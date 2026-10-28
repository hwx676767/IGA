using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

/// <summary>
/// Scene 1 flow from 游戏文本.docx:
/// Intro dialogue → A/B/C story choices → ice-cream tutorial rounds (choices + noise)
/// → Moonlit Tryst keyword danmaku (catch inspiration) → closing / next scene.
/// </summary>
public class BrainstormController : MonoBehaviour
{
    private enum FlowState
    {
        Introduction,
        Choosing,
        Tutorial,
        Brainstorm,
        DialoguePause,
        Completed
    }

    private enum TutorialPhase
    {
        Round1,
        Round2
    }

    [Header("Flow")]
    [SerializeField] private string nextSceneName = "SampleScene";
    [SerializeField] private float dialogueTypingSpeed = 45f;
    [SerializeField] private float spawnInterval = .8f;
    [SerializeField] private Vector2 danmakuSpeedRange = new Vector2(150f, 220f);
    [SerializeField] private float tutorialChoiceSeconds = 8f;

    [Header("Danmaku layout")]
    [SerializeField] private float danmakuVerticalLimit = 260f;
    [SerializeField] private float danmakuLaneSpacing = 92f;

    [Header("Scene-authored cover UI")]
    [Tooltip("Edit these objects directly under Scene1CoverCanvas in S1.")]
    [SerializeField] private GameObject sceneCoverRoot;
    [SerializeField] private Button sceneStartButton;
    [SerializeField] private Text sceneCoverTitle;
    [SerializeField] private Text sceneCoverSubtitle;
    [Tooltip("Edit DialoguePanel under Scene1CoverCanvas. Hidden until dialogue starts.")]
    [SerializeField] private GameObject sceneDialoguePanel;
    [Min(.01f)] public float coverSideSlideDuration = 3f;

    [Header("Optional audio")]
    [SerializeField] private AudioClip positiveSound;
    [SerializeField] private AudioClip negativeSound;
    [Tooltip("TODO: Assign a short dismiss sound when audio material is ready.")]
    [SerializeField] private AudioClip irrelevantSound;

    [HideInInspector, SerializeField] private List<BrainstormThought> thoughts = new List<BrainstormThought>();

    private Canvas _canvas;
    private RectTransform _danmakuLayer;
    private GameObject _dialoguePanel;
    private GameObject _leftBubble;
    private GameObject _rightBubble;
    private Text _leftSpeaker;
    private Text _rightSpeaker;
    private Text _leftDialogue;
    private Text _rightDialogue;
    private Text _speaker;
    private Text _dialogue;
    private Text _status;
    private Text _timerLabel;
    private Button _dialogueNextButton;
    private Button _leftNextButton;
    private Button _rightNextButton;
    private Button _panelAdvanceButton;
    private Button _sceneNextButton;
    private GameObject _startOverlay;
    private Button _startButton;
    private GameObject _choicePanel;
    private readonly List<GameObject> _tutorialCards = new List<GameObject>();
    private Coroutine _choiceSpawnRoutine;
    private AudioSource _audio;
    private Font _font;
    private FlowState _state;
    private DanmakuRevealPlaceholder[] _entries;
    private readonly List<DanmakuRevealPlaceholder> _spawnQueue = new List<DanmakuRevealPlaceholder>();
    private readonly HashSet<DanmakuRevealPlaceholder> _resolved = new HashSet<DanmakuRevealPlaceholder>();
    private readonly List<GameObject> _activeDanmaku = new List<GameObject>();
    private int _correctTotal;
    private int _correctCaught;
    private float _spawnTimer;
    private bool _typing;
    private string _fullText;
    private Coroutine _typingRoutine;
    private bool _introductionStarted;
    private Coroutine _coverSideSlideRoutine;
    private Coroutine _tutorialTimerRoutine;
    private int _dialogueTurn;
    private bool _authoredDialogueLayout;
    private TutorialPhase _tutorialPhase;
    private bool _tutorialLocked;
    private static readonly bool[] DialogueUsesRight = { false, false, true, false, true, true };

    private void Awake()
    {
        HideAuthoredRevealArt();
    }

    private void Start()
    {
        try
        {
            BuildUI();
            CachePlaceholders();
            ShowStartScreen();
            StartCoverSideSlide();
            Debug.Log("[Scene1] Ready. Waiting for Start Game button.", this);
        }
        catch (System.Exception exception)
        {
            Debug.LogException(exception, this);
            BuildEmergencyUI(exception.Message);
        }
    }

    private void Update()
    {
        if (_state == FlowState.Introduction && !_introductionStarted && _startOverlay != null &&
            _startOverlay.activeSelf &&
            (Input.GetMouseButtonDown(0) || Input.GetKeyDown(KeyCode.Return) ||
             Input.GetKeyDown(KeyCode.KeypadEnter) || Input.GetKeyDown(KeyCode.Space)))
        {
            StartIntroduction();
            return;
        }

        if (_state != FlowState.Brainstorm || _spawnQueue.Count == 0) return;
        _spawnTimer -= Time.deltaTime;
        if (_spawnTimer <= 0f)
            _spawnTimer = SpawnKeyword() ? spawnInterval : .2f;
    }

    private void HideAuthoredRevealArt()
    {
        DanmakuRevealPlaceholder[] authored = FindObjectsOfType<DanmakuRevealPlaceholder>(true);
        foreach (DanmakuRevealPlaceholder entry in authored)
        {
            entry.BindArtwork();
            entry.gameObject.SetActive(false);
        }
    }

    private void CachePlaceholders()
    {
        _entries = FindObjectsOfType<DanmakuRevealPlaceholder>(true);
        _correctTotal = 0;
        foreach (DanmakuRevealPlaceholder entry in _entries)
        {
            entry.BindArtwork();
            entry.gameObject.SetActive(false);
            if (entry.IsHelpful) _correctTotal++;
        }
        if (_correctTotal == 0)
            Debug.LogError("S1 has no helpful DanmakuRevealPlaceholder objects.", this);
    }

    private void ResetKeywordQueue()
    {
        _spawnQueue.Clear();
        _resolved.Clear();
        _correctCaught = 0;
        foreach (DanmakuRevealPlaceholder entry in _entries)
        {
            if (entry == null) continue;
            entry.gameObject.SetActive(false);
            _spawnQueue.Add(entry);
        }
    }

    // -------------------------------------------------------------------------
    // Scripted story: Intro → meet Sam/Roxy → A/B/C rules choice
    // -------------------------------------------------------------------------

    private void StartIntroduction()
    {
        if (_introductionStarted) return;
        _introductionStarted = true;
        Debug.Log("[Scene1] Start Game clicked. Beginning introduction dialogue.", this);
        _startOverlay.SetActive(false);
        _state = FlowState.Introduction;
        HideChoicePanel();
        ClearTutorialCards();
        StopTutorialTimer();
        _dialoguePanel.SetActive(true);
        _sceneNextButton.gameObject.SetActive(false);
        _status.text = "Scene 1  ·  Brainstorm";

        ShowDialogue("Teacher", "Thank you. I guess that would be enough.", () =>
            ShowDialogue("Player", "Lady Luck, please. I'd give anything...", () =>
                ShowDialogue("Player", "(Sigh)", () =>
                    ShowDialogue("Voice", "It's not the end of the world. Front stage isn't everything for a show. You remember how good you are at making stuff? That's your spark.", () =>
                        ShowDialogue("Sam", "Hi? I'm Samson Smith from G12 — yes, the director. Just call me Sam.", () =>
                            ShowDialogue("Player", "I'm here.", () =>
                                ShowDialogue("Sam", "OK everybody! Attention please! Look around and remember the faces. All of us would be the stage and backstage people working for the musical.", () =>
                                    ShowDialogue("Sam", "Before we assign jobs, let's ice-break. What about… a game of categories?", () =>
                                        ShowDialogue("Roxy", "Boo! Categories is so lame. I bet I'm better in this than you. I'm Roxy.", () =>
                                            ShowDialogue("Sam", "Oh well, Roxy. Any questions about categories? Anyone?", () =>
                                                ShowDialogue("Player", "Hmm…", ShowRulesChoice)))))))))));
    }

    private void ShowStartScreen()
    {
        _introductionStarted = false;
        _dialogueTurn = 0;
        _state = FlowState.Introduction;
        _dialoguePanel.SetActive(false);
        HideChoicePanel();
        ClearTutorialCards();
        StopTutorialTimer();
        _sceneNextButton.gameObject.SetActive(false);
        _startOverlay.SetActive(true);
        _startButton.onClick.RemoveAllListeners();
        _startButton.onClick.AddListener(StartIntroduction);
    }

    private void ShowRulesChoice()
    {
        _dialoguePanel.SetActive(false);
        _status.text = "Choose A / B / C";
        ShowStoryChoices(new[]
        {
            "A. Ask Sam for the rules",
            "B. Ask Roxy for the rules",
            "C. You know the rules"
        }, OnRulesChoice);
    }

    private void OnRulesChoice(int index)
    {
        StopChoiceSpawnRoutine();
        ClearTutorialCards();
        _dialoguePanel.SetActive(true);
        _state = FlowState.Introduction;

        if (index == 0)
        {
            ShowDialogue("Sam", "Okay! It's normal to have questions, guys.", () =>
                ShowDialogue("Sam", "Basically: pick a category, then say things in that category one by one. Repeat an answer, or take more than 3 seconds, and you're out.", () =>
                    ShowDialogue("Player", "Makes sense.", BeginTutorialFromScript)));
        }
        else if (index == 1)
        {
            ShowDialogue("Roxy", "Seriously? You don't know the rules? I thought we've all played this for, like, centuries.", () =>
                ShowDialogue("Roxy", "Pick a category and say stuff one by one. Repeat what people said, or go too slow, and you lose. See how boring it is?", () =>
                    ShowDialogue("Roxy", "By the way, I'm the lead singer. Roxy Flint's the full name.", () =>
                        ShowDialogue("Player", "I'm here.", BeginTutorialFromScript))));
        }
        else
        {
            BeginTutorialFromScript();
        }
    }

    // -------------------------------------------------------------------------
    // Tutorial rounds from the script (ice cream + floating choices + noise)
    // -------------------------------------------------------------------------

    private void BeginTutorialFromScript()
    {
        ShowDialogue("Sam", "Okay—— Let's begin!", () =>
            ShowDialogue("Sam", "In a brainstorm, you pick the correct — or relevant — thoughts among the ones in your head.", () =>
                ShowDialogue("Sam", "No repeat or hesitation. The category is: Ice cream flavors.", StartTutorialRound1)));
    }

    private void StartTutorialRound1()
    {
        _tutorialPhase = TutorialPhase.Round1;
        ShowDialogue("StudentA", "Vanilla.", () =>
            ShowDialogue("StudentB", "Chocolate.", () =>
                ShowDialogue("Player", "Well…", SpawnTutorialRound1)));
    }

    private void SpawnTutorialRound1()
    {
        StopChoiceSpawnRoutine();
        ClearTutorialCards();
        _tutorialLocked = false;
        _state = FlowState.Tutorial;
        _dialoguePanel.SetActive(false);
        _status.text = "Tutorial  ·  Pick the right answer  ·  C. Strawberry";

        SpawnStaticChoices(new[]
        {
            new ChoiceSpawn("A. Vanilla", new Color(.37f, .18f, .2f, .98f), false,
                () => FailTutorialRound("Sam", "Vanilla was mentioned. You're out.")),
            new ChoiceSpawn("B. French fries", new Color(.37f, .18f, .2f, .98f), false,
                () => FailTutorialRound("Sam", "Focus on what I said! French fries isn't an ice cream flavor.")),
            new ChoiceSpawn("C. Strawberry", new Color(.12f, .27f, .4f, .98f), false, PassTutorialRound1)
        });
        BeginTutorialTimer(RestartCurrentTutorialRound);
    }

    private void PassTutorialRound1()
    {
        if (_tutorialLocked) return;
        _tutorialLocked = true;
        StopTutorialTimer();
        StopChoiceSpawnRoutine();
        ClearTutorialCards();
        Play(positiveSound);
        _dialoguePanel.SetActive(true);
        _state = FlowState.Introduction;
        ShowDialogue("Sam", "Correct. Emm… Mint chocolate chip!", () =>
            ShowDialogue("StudentC", "Caramel.", () =>
                ShowDialogue("Roxy", "Matcha.", () =>
                    ShowDialogue("Sam", "The game is down to the final few. Stay sharp.", StartTutorialRound2))));
    }

    private void StartTutorialRound2()
    {
        _tutorialPhase = TutorialPhase.Round2;
        ShowDialogue("Player", "Em…", () =>
            ShowDialogue("Sam", "Tired already? That happens. Try not to let these things distract you.", () =>
                ShowDialogue("Sam", "Irrelevant thoughts are covering the choices — click them to clear the noise, then pick the right flavor.", SpawnTutorialRound2)));
    }

    private void SpawnTutorialRound2()
    {
        StopChoiceSpawnRoutine();
        ClearTutorialCards();
        _tutorialLocked = false;
        _state = FlowState.Tutorial;
        _dialoguePanel.SetActive(false);
        _status.text = "Tutorial  ·  Click away the dark noise, then pick A. Cookies and cream";

        SpawnStaticChoices(new[]
        {
            new ChoiceSpawn("…daydream…", new Color(.24f, .24f, .27f, .98f), true, null),
            new ChoiceSpawn("…hungry…", new Color(.24f, .24f, .27f, .98f), true, null),
            new ChoiceSpawn("…phone buzz…", new Color(.24f, .24f, .27f, .98f), true, null),
            new ChoiceSpawn("A. Cookies and cream", new Color(.12f, .27f, .4f, .98f), false, () =>
            {
                if (TutorialNoiseRemaining())
                {
                    _status.text = "Clear the dark noise first, then choose A";
                    return;
                }
                PassTutorialRound2();
            }),
            new ChoiceSpawn("B. Caramel", new Color(.37f, .18f, .2f, .98f), false, () =>
            {
                if (TutorialNoiseRemaining())
                {
                    _status.text = "Clear the dark noise first, then choose A";
                    return;
                }
                FailTutorialRound("Sam", "Roxy already said that. You're out.",
                    () => ShowDialogue("Roxy", "Haha! Too bad.", RestartCurrentTutorialRound));
            }),
            new ChoiceSpawn("C. Roses", new Color(.37f, .18f, .2f, .98f), false, () =>
            {
                if (TutorialNoiseRemaining())
                {
                    _status.text = "Clear the dark noise first, then choose A";
                    return;
                }
                FailTutorialRound("Roxy", "That's not an ice cream flavor. You lose.");
            })
        });
        // Timer starts only after noise is cleared — otherwise the round is unfair.
    }

    private bool TutorialNoiseRemaining()
    {
        foreach (GameObject card in _tutorialCards)
            if (card != null && card.name.StartsWith("Noise_")) return true;
        return false;
    }

    private void PassTutorialRound2()
    {
        if (_tutorialLocked) return;
        _tutorialLocked = true;
        StopTutorialTimer();
        StopChoiceSpawnRoutine();
        ClearTutorialCards();
        Play(positiveSound);
        _dialoguePanel.SetActive(true);
        _state = FlowState.Introduction;
        ShowDialogue("Sam", "Right. Coconut.", () =>
            ShowDialogue("Roxy", "Err… I give up.", () =>
                ShowDialogue("Sam", "Cookies and cream. Wait — you said that, right?", () =>
                    ShowDialogue("Player", "I'm the only one left.", () =>
                        ShowDialogue("Sam", "Yeah! Congrats. You win.", () =>
                            ShowDialogue("Sam", "Backstage is kind of like this game. Ideas come fast, and some flee by. Some are useful, some are just noise. Your job is to find the ones worth keeping.", AfterTutorialAssignRoles))))));
    }

    private void FailTutorialRound(string speaker, string line, System.Action afterLine = null)
    {
        if (_tutorialLocked) return;
        _tutorialLocked = true;
        StopTutorialTimer();
        StopChoiceSpawnRoutine();
        ClearTutorialCards();
        Play(negativeSound);
        _dialoguePanel.SetActive(true);
        _state = FlowState.Introduction;
        ShowDialogue(speaker, line, () =>
        {
            if (afterLine != null) afterLine();
            else RestartCurrentTutorialRound();
        });
    }

    private void RestartCurrentTutorialRound()
    {
        StopTutorialTimer();
        StopChoiceSpawnRoutine();
        ClearTutorialCards();
        _dialoguePanel.SetActive(true);
        _state = FlowState.Introduction;
        ShowDialogue("Sam", "Sorry — let's try that round again. No repeat, no hesitation.", () =>
        {
            if (_tutorialPhase == TutorialPhase.Round1) SpawnTutorialRound1();
            else SpawnTutorialRound2();
        });
    }

    private void AfterTutorialAssignRoles()
    {
        ShowDialogue("Sam", "Ahem—— And now! Assigning roles! Frontstage people, please follow our music teacher for vocal training!", () =>
            ShowDialogue("Roxy", "Bye. See ya later.", () =>
                ShowDialogue("Sam", "We need two people for costume design… one for lighting… sound… Oh! Anyone want prop making?", () =>
                    ShowDialogue("Player", "I'll have it.", BridgeToKeywordBrainstorm))));
    }

    private void BridgeToKeywordBrainstorm()
    {
        ShowDialogue("Sam", "Perfect. Before you head to props: Moonlit Tryst needs a look. Same skill as the game — catch what fits, clear the noise.", () =>
            ShowDialogue("Player", "Castle, candlelight, long table, parchment… keep what holds the night together.", BeginKeywordBrainstorm));
    }

    // -------------------------------------------------------------------------
    // Main brainstorm: keyword danmaku (existing catch-inspiration gameplay)
    // -------------------------------------------------------------------------

    private void BeginKeywordBrainstorm()
    {
        HideChoicePanel();
        StopChoiceSpawnRoutine();
        ClearTutorialCards();
        StopTutorialTimer();
        ResetKeywordQueue();
        ClearDanmaku();
        _dialoguePanel.SetActive(false);
        _state = FlowState.Brainstorm;
        _dialogueTurn = 0;
        _spawnTimer = 0f;
        UpdateProgress("Catch the ideas worth keeping");
    }

    private bool SpawnKeyword()
    {
        if (!TryGetClearDanmakuLane(out float y)) return false;

        DanmakuRevealPlaceholder entry = _spawnQueue[Random.Range(0, _spawnQueue.Count)];
        _spawnQueue.Remove(entry);

        Color cardColor = entry.IsHelpful
            ? new Color(.12f, .27f, .4f, .98f)
            : entry.IsIrrelevant
                ? new Color(.24f, .24f, .27f, .98f)
                : new Color(.37f, .18f, .2f, .98f);

        GameObject go = CreateDanmakuVisual("Danmaku_" + entry.Keyword, entry.DisplayKeyword, cardColor, out float halfWidth, out float startX, y);
        _activeDanmaku.Add(go);

        BrainstormDanmakuButton mover = go.AddComponent<BrainstormDanmakuButton>();
        mover.Prepare(new BrainstormThought { text = entry.Keyword, isRelevant = entry.IsHelpful });
        mover.BeginMove(-Random.Range(danmakuSpeedRange.x, danmakuSpeedRange.y),
            startX, y, -halfWidth - go.GetComponent<RectTransform>().sizeDelta.x,
            clicked => SelectKeyword(entry, clicked), OnDanmakuLeftScreen);
        return true;
    }

    private bool TryGetClearDanmakuLane(out float y)
    {
        for (int i = _activeDanmaku.Count - 1; i >= 0; i--)
            if (_activeDanmaku[i] == null) _activeDanmaku.RemoveAt(i);
        for (int i = _tutorialCards.Count - 1; i >= 0; i--)
            if (_tutorialCards[i] == null) _tutorialCards.RemoveAt(i);

        float halfHeight = _danmakuLayer == null ? danmakuVerticalLimit :
            Mathf.Min(danmakuVerticalLimit, Mathf.Max(0f, _danmakuLayer.rect.height * .5f - 50f));
        int laneCount = Mathf.Max(1, Mathf.FloorToInt(halfHeight * 2f / danmakuLaneSpacing) + 1);
        int firstLane = Random.Range(0, laneCount);

        for (int offset = 0; offset < laneCount; offset++)
        {
            int laneIndex = (firstLane + offset) % laneCount;
            float candidate = -halfHeight + laneIndex * danmakuLaneSpacing;
            if (!IsDanmakuLaneOccupied(candidate))
            {
                y = candidate;
                return true;
            }
        }

        y = 0f;
        return false;
    }

    private bool IsDanmakuLaneOccupied(float candidateY)
    {
        return IsLaneUsedBy(_activeDanmaku, candidateY) || IsLaneUsedBy(_tutorialCards, candidateY);
    }

    private bool IsLaneUsedBy(List<GameObject> list, float candidateY)
    {
        foreach (GameObject active in list)
        {
            if (active == null) continue;
            RectTransform activeRect = active.GetComponent<RectTransform>();
            if (activeRect != null && Mathf.Abs(activeRect.anchoredPosition.y - candidateY) < danmakuLaneSpacing)
                return true;
        }
        return false;
    }

    private void SelectKeyword(DanmakuRevealPlaceholder entry, BrainstormDanmakuButton danmaku)
    {
        if (_state != FlowState.Brainstorm || entry == null || danmaku == null) return;
        _activeDanmaku.Remove(danmaku.gameObject);
        _resolved.Add(entry);
        entry.gameObject.SetActive(true);
        danmaku.Despawn();

        if (entry.IsHelpful)
        {
            _correctCaught++;
            Play(positiveSound);
            UpdateProgress("✓ " + entry.DisplayKeyword + ": " + entry.Feedback);

            if (_correctCaught >= _correctTotal)
                PauseForDialogue("Sam", HelpfulLine(entry), BeginClosingReveal);
            else
                PauseForDialogue("Sam", HelpfulLine(entry), ResumeBrainstorm);
        }
        else if (entry.IsIrrelevant)
        {
            Play(irrelevantSound);
            UpdateProgress("— " + entry.DisplayKeyword + ": just noise. Clear it and keep going.");
            PauseForDialogue("Sam", IrrelevantLine(entry), ResumeBrainstorm);
        }
        else
        {
            Play(negativeSound);
            UpdateProgress("× " + entry.DisplayKeyword + ": " + entry.Feedback);
            PauseForDialogue("Sam", RejectLine(entry), ResumeBrainstorm);
        }
    }

    private void PauseForDialogue(string speaker, string text, System.Action completed)
    {
        _state = FlowState.DialoguePause;
        SetActiveDanmakuPaused(true);
        _dialoguePanel.SetActive(true);
        ShowKeywordDialogue(text, completed);
    }

    private void ResumeBrainstorm()
    {
        _dialoguePanel.SetActive(false);
        SetActiveDanmakuPaused(false);
        _spawnTimer = .15f;
        _state = FlowState.Brainstorm;
    }

    private void BeginClosingReveal()
    {
        _state = FlowState.Completed;
        _dialoguePanel.SetActive(false);
        ClearDanmaku();
        HideChoicePanel();
        ClearTutorialCards();
        StopTutorialTimer();
        _status.text = "Scene 1 complete: the look of Moonlit Tryst is set";
        _sceneNextButton.gameObject.SetActive(false);
        StartCoroutine(CloseSceneAfterReveal());
    }

    private IEnumerator CloseSceneAfterReveal()
    {
        foreach (DanmakuRevealPlaceholder entry in _entries)
        {
            if (entry == null) continue;
            if (entry.IsHelpful)
            {
                entry.gameObject.SetActive(true);
                continue;
            }

            if (entry.gameObject.activeSelf)
                StartCoroutine(entry.FadeOut(1f));
        }

        yield return new WaitForSeconds(1f);
        yield return new WaitForSeconds(2f);
        GoToNextScene();
    }

    public void GoToNextScene()
    {
        if (!string.IsNullOrWhiteSpace(nextSceneName) && Application.CanStreamedLevelBeLoaded(nextSceneName))
        {
            SceneTransition.LoadScene(nextSceneName, "Prop Making");
            return;
        }
        int nextIndex = SceneManager.GetActiveScene().buildIndex + 1;
        if (nextIndex < SceneManager.sceneCountInBuildSettings)
            SceneTransition.LoadScene(nextIndex, "Prop Making");
        else
            Debug.LogWarning("Next scene is not configured or included in Build Settings.", this);
    }

    // -------------------------------------------------------------------------
    // Choice / tutorial danmaku (same card look + horizontal drift as keywords)
    // -------------------------------------------------------------------------

    private struct ChoiceSpawn
    {
        public string label;
        public Color color;
        public bool noise;
        public System.Action onPicked;

        public ChoiceSpawn(string label, Color color, bool noise, System.Action onPicked)
        {
            this.label = label;
            this.color = color;
            this.noise = noise;
            this.onPicked = onPicked;
        }
    }

    private void ShowStoryChoices(string[] labels, System.Action<int> onPicked)
    {
        StopChoiceSpawnRoutine();
        ClearTutorialCards();
        HideChoicePanel();
        _tutorialLocked = false;
        _state = FlowState.Choosing;
        _dialoguePanel.SetActive(false);

        ChoiceSpawn[] spawns = new ChoiceSpawn[labels.Length];
        for (int i = 0; i < labels.Length; i++)
        {
            int captured = i;
            spawns[i] = new ChoiceSpawn(labels[i], new Color(.12f, .27f, .4f, .98f), false, () =>
            {
                if (_state != FlowState.Choosing || _tutorialLocked) return;
                _tutorialLocked = true;
                StopChoiceSpawnRoutine();
                ClearTutorialCards();
                onPicked?.Invoke(captured);
            });
        }

        SpawnStaticChoices(spawns);
    }

    /// <summary>
    /// Stationary choice cards that reuse the keyword danmaku look (glow + color plate),
    /// but do NOT drift — so timed picks stay fair.
    /// </summary>
    private void SpawnStaticChoices(ChoiceSpawn[] spawns)
    {
        StopChoiceSpawnRoutine();
        // Answers first in layout (center column), noise layered on top at random offsets.
        List<ChoiceSpawn> answers = new List<ChoiceSpawn>();
        List<ChoiceSpawn> noise = new List<ChoiceSpawn>();
        foreach (ChoiceSpawn spec in spawns)
        {
            if (spec.noise) noise.Add(spec);
            else answers.Add(spec);
        }

        for (int i = 0; i < answers.Count; i++)
        {
            float y = (answers.Count == 1) ? 0f : 140f - i * (280f / Mathf.Max(1, answers.Count - 1));
            SpawnStaticChoiceCard(answers[i], new Vector2(0f, y));
        }

        for (int i = 0; i < noise.Count; i++)
        {
            // Cover the answer area so the player must clear them first.
            float x = (i % 2 == 0 ? -40f : 40f) + Random.Range(-30f, 30f);
            float y = 120f - i * 110f + Random.Range(-20f, 20f);
            SpawnStaticChoiceCard(noise[i], new Vector2(x, y));
        }
    }

    private void SpawnStaticChoiceCard(ChoiceSpawn spec, Vector2 anchoredPos)
    {
        string objectName = (spec.noise ? "Noise_" : "Choice_") + spec.label;
        GameObject go = CreateDanmakuVisual(objectName, spec.label, spec.color, anchoredPos);
        _tutorialCards.Add(go);

        // Noise sits above answers so it can block clicks until cleared.
        if (spec.noise) go.transform.SetAsLastSibling();

        Button button = go.GetComponent<Button>();
        button.onClick.RemoveAllListeners();
        button.onClick.AddListener(() => HandleStaticChoiceClick(go, spec));
    }

    private void HandleStaticChoiceClick(GameObject card, ChoiceSpawn spec)
    {
        if (card == null || _tutorialLocked) return;
        if (_state != FlowState.Tutorial && _state != FlowState.Choosing) return;

        if (spec.noise)
        {
            Play(irrelevantSound);
            _tutorialCards.Remove(card);
            Destroy(card);
            if (TutorialNoiseRemaining())
            {
                _status.text = "Noise cleared — keep clearing the dark cards";
            }
            else
            {
                _status.text = "Noise cleared — now pick A. Cookies and cream";
                // Round 2: countdown begins only once answers are reachable.
                if (_tutorialPhase == TutorialPhase.Round2 && _tutorialTimerRoutine == null)
                    BeginTutorialTimer(RestartCurrentTutorialRound);
            }
            return;
        }

        spec.onPicked?.Invoke();
    }

    private GameObject CreateDanmakuVisual(string objectName, string labelText, Color cardColor, Vector2 anchoredPos)
    {
        GameObject go = new GameObject(objectName, typeof(RectTransform), typeof(Image), typeof(Button));
        go.transform.SetParent(_danmakuLayer, false);
        RectTransform rect = go.GetComponent<RectTransform>();
        rect.anchorMin = rect.anchorMax = new Vector2(.5f, .5f);
        float cardWidth = Mathf.Clamp(labelText.Length * 15f + 90f, 280f, 720f);
        rect.sizeDelta = new Vector2(cardWidth + 28f, 88f);
        rect.anchoredPosition = anchoredPos;

        Image glow = go.GetComponent<Image>();
        glow.color = new Color(1f, 1f, 1f, .55f);
        glow.raycastTarget = true;
        Outline glowOutline = go.AddComponent<Outline>();
        glowOutline.effectColor = new Color(1f, 1f, 1f, .7f);
        glowOutline.effectDistance = new Vector2(10f, -10f);
        Shadow glowBloom = go.AddComponent<Shadow>();
        glowBloom.effectColor = new Color(1f, 1f, 1f, .45f);
        glowBloom.effectDistance = new Vector2(0f, 0f);

        Image card = CreateImage(go.transform, "Card", cardColor);
        Stretch(card.rectTransform, 12, 10, -12, -10);
        card.raycastTarget = false;
        Text label = CreateText(go.transform, "Keyword", 26, TextAnchor.MiddleCenter);
        Stretch(label.rectTransform, 18, 12, -18, -12);
        label.text = labelText;
        label.horizontalOverflow = HorizontalWrapMode.Wrap;
        label.verticalOverflow = VerticalWrapMode.Overflow;
        return go;
    }

    /// <summary>Shared look for drifting keyword danmaku (still used by brainstorm phase).</summary>
    private GameObject CreateDanmakuVisual(string objectName, string labelText, Color cardColor,
        out float halfWidth, out float startX, float y)
    {
        halfWidth = Mathf.Max(600f, _danmakuLayer.rect.width * .5f);
        float cardWidth = Mathf.Max(220f, labelText.Length * 16f + 80f);
        startX = halfWidth + cardWidth + 28f;
        GameObject go = CreateDanmakuVisual(objectName, labelText, cardColor, new Vector2(startX, y));
        go.GetComponent<RectTransform>().sizeDelta = new Vector2(cardWidth + 28f, 80f);
        return go;
    }

    private void EnsureChoicePanel()
    {
        if (_choicePanel != null) return;
        _choicePanel = new GameObject("ChoicePanel", typeof(RectTransform));
        _choicePanel.transform.SetParent(_canvas.transform, false);
        Stretch(_choicePanel.GetComponent<RectTransform>(), 0, 0, 0, 0);
        _choicePanel.SetActive(false);
    }

    private void HideChoicePanel()
    {
        if (_choicePanel != null) _choicePanel.SetActive(false);
    }

    private void StopChoiceSpawnRoutine()
    {
        if (_choiceSpawnRoutine != null)
        {
            StopCoroutine(_choiceSpawnRoutine);
            _choiceSpawnRoutine = null;
        }
    }

    private void ClearTutorialCards()
    {
        foreach (GameObject go in _tutorialCards)
            if (go != null) Destroy(go);
        _tutorialCards.Clear();
        if (_timerLabel != null) _timerLabel.gameObject.SetActive(false);
    }

    private void BeginTutorialTimer(System.Action onTimeout)
    {
        StopTutorialTimer();
        if (_timerLabel != null) _timerLabel.gameObject.SetActive(true);
        _tutorialTimerRoutine = StartCoroutine(TutorialTimerRoutine(onTimeout));
    }

    private void StopTutorialTimer()
    {
        if (_tutorialTimerRoutine != null)
        {
            StopCoroutine(_tutorialTimerRoutine);
            _tutorialTimerRoutine = null;
        }
        if (_timerLabel != null)
        {
            _timerLabel.text = string.Empty;
            _timerLabel.gameObject.SetActive(false);
        }
    }

    private IEnumerator TutorialTimerRoutine(System.Action onTimeout)
    {
        float left = Mathf.Max(1f, tutorialChoiceSeconds);
        while (left > 0f)
        {
            if (_timerLabel != null)
                _timerLabel.text = "Time  " + Mathf.CeilToInt(left);
            left -= Time.unscaledDeltaTime;
            yield return null;
        }

        _tutorialTimerRoutine = null;
        if (_state == FlowState.Tutorial && !_tutorialLocked)
        {
            _tutorialLocked = true;
            ClearTutorialCards();
            Play(negativeSound);
            _dialoguePanel.SetActive(true);
            _state = FlowState.Introduction;
            ShowDialogue("Sam", "Sorry, time's up.", onTimeout);
        }
    }

    // -------------------------------------------------------------------------
    // Dialogue presentation
    // -------------------------------------------------------------------------

    private void ShowDialogue(string speaker, string text, System.Action completed)
    {
        bool player = speaker == "Player";
        PresentBubble(player, true, SpeakerLabel(speaker), text, completed);
    }

    private void ShowKeywordDialogue(string text, System.Action completed)
    {
        bool right = DialogueUsesRight[_dialogueTurn % DialogueUsesRight.Length];
        _dialogueTurn++;
        PresentBubble(right, false, string.Empty, text, completed);
    }

    private void PresentBubble(bool right, bool showSpeaker, string speakerLabel, string text, System.Action completed)
    {
        if (_leftBubble != null) _leftBubble.SetActive(!right);
        if (_rightBubble != null) _rightBubble.SetActive(right);

        _speaker = right ? _rightSpeaker : _leftSpeaker;
        _dialogue = right ? _rightDialogue : _leftDialogue;
        _dialogueNextButton = right ? _rightNextButton : _leftNextButton;

        ApplySpeakerLayout(right, showSpeaker);
        if (_speaker != null)
        {
            _speaker.gameObject.SetActive(showSpeaker);
            _speaker.text = showSpeaker ? speakerLabel : string.Empty;
        }

        _fullText = text;
        if (_typingRoutine != null) StopCoroutine(_typingRoutine);
        _typingRoutine = StartCoroutine(TypeText(text));

        BindAdvance(_leftNextButton, completed);
        BindAdvance(_rightNextButton, completed);
        BindAdvance(_panelAdvanceButton, completed);
        BindAdvance(_dialogueNextButton, completed);
    }

    private void ApplySpeakerLayout(bool right, bool showSpeaker)
    {
        if (_authoredDialogueLayout || _dialogue == null) return;
        if (showSpeaker)
        {
            if (!right) SetAnchors(_dialogue.rectTransform, .18f, .22f, .84f, .72f);
            else SetAnchors(_dialogue.rectTransform, .12f, .18f, .78f, .74f);
        }
        else
        {
            if (!right) SetAnchors(_dialogue.rectTransform, .18f, .22f, .84f, .86f);
            else SetAnchors(_dialogue.rectTransform, .12f, .18f, .78f, .88f);
        }
    }

    private static string SpeakerLabel(string speaker)
    {
        switch (speaker)
        {
            case "Teacher": return "Audition Teacher";
            case "Player": return "You";
            case "Voice": return "?";
            case "Sam": return "Sam";
            case "Roxy": return "Roxy";
            case "StudentA": return "Student A";
            case "StudentB": return "Student B";
            case "StudentC": return "Student C";
            default: return speaker;
        }
    }

    private void BindAdvance(Button button, System.Action completed)
    {
        if (button == null) return;
        button.onClick.RemoveAllListeners();
        button.onClick.AddListener(() =>
        {
            if (_typing)
            {
                if (_typingRoutine != null) StopCoroutine(_typingRoutine);
                if (_dialogue != null) _dialogue.text = _fullText;
                _typing = false;
            }
            else completed?.Invoke();
        });
    }

    private static string HelpfulLine(DanmakuRevealPlaceholder entry)
    {
        switch (entry.Keyword)
        {
            case "中世纪城堡":
                return "Correct. The castle sets the era — keep it in the night behind the stage. Far scenery for Moonlit Tryst is enough.";
            case "骑士盔甲":
                return "Right. Nobody has to wear the armor. A flash of iron in the tree-shadow is enough for identity.";
            case "哥特拱门":
                return "Good catch. The arch can be the treeline entrance — she comes through it on her way under the tree.";
            case "羊皮卷":
                return "Keep that. The parchment is the tryst itself. Later it can sit on the table, or hide in her sleeve.";
            case "烛台与火炬":
                return "Yes. Where moonlight isn't enough, use fire. Warm the tryst table; leave the treeline dark.";
            case "木制长桌":
                return "That's the one. The tryst table — leave the edge free for the token, and don't block her path.";
            case "王座":
                return "Worth keeping. Throne farther back: power upstage, the meeting at the table — two forces holding the scene.";
            case "彩绘玻璃":
                return "Nice. Moonlight through stained glass is what makes the falling leaves feel like they're falling.";
            default:
                return "Correct. \"" + entry.DisplayKeyword + "\" can enter this scene. " + entry.Feedback;
        }
    }

    private static string RejectLine(DanmakuRevealPlaceholder entry)
    {
        switch (entry.Keyword)
        {
            case "古希腊石柱":
                return "Focus on what I said! The columns are too early — this night is medieval, not a temple.";
            case "罗马斗兽场":
                return "That one's out. The arena would turn the tryst into a fight. The period would collapse.";
            case "文艺复兴油画":
                return "Too late, and too bright. Moonlight needs shadow, not a gallery.";
            case "巴洛克水晶吊灯":
                return "Hang a chandelier and the tree-shadow is gone. This scene doesn't need palace glitter.";
            case "维多利亚蒸汽机":
                return "Machine noise would crush a night talk. Save it for another industrial play.";
            case "日式鸟居":
                return "Wrong frame. The treeline can have a gate, but not a torii.";
            default:
                return "Focus! \"" + entry.DisplayKeyword + "\" would drag Moonlit Tryst somewhere else. " + entry.Feedback;
        }
    }

    private static string IrrelevantLine(DanmakuRevealPlaceholder entry)
    {
        switch (entry.Keyword)
        {
            case "现代麦克风":
                return "Tired already? That's just noise — a modern mic breaks the medieval stage. Clear it.";
            case "霓虹灯牌":
                return "Neon belongs to a city night, not this play. Don't let it distract you.";
            case "宇宙飞船":
                return "Sci-fi flying past? Leave it. We're building Moonlit Tryst, not a space opera.";
            case "手机直播":
                return "A livestream won't help this set. Clear the noise and stay with the night.";
            case "沙滩遮阳伞":
                return "Unrelated. Ideas like that flee by — click them away and keep going.";
            case "自动售货机":
                return "Just noise. Some thoughts aren't worth keeping — clear it.";
            default:
                return "That's just noise. Clear it and find the thoughts worth keeping.";
        }
    }

    private IEnumerator TypeText(string text)
    {
        _typing = true;
        if (_dialogue == null) yield break;
        _dialogue.text = string.Empty;
        float delay = 1f / Mathf.Max(1f, dialogueTypingSpeed);
        for (int i = 1; i <= text.Length; i++)
        {
            _dialogue.text = text.Substring(0, i);
            yield return new WaitForSecondsRealtime(delay);
        }
        _typing = false;
    }

    private void OnDanmakuLeftScreen(BrainstormDanmakuButton danmaku)
    {
        if (danmaku == null) return;
        _activeDanmaku.Remove(danmaku.gameObject);
        string keyword = danmaku.Thought != null ? danmaku.Thought.text : string.Empty;
        foreach (DanmakuRevealPlaceholder entry in _entries)
        {
            if (entry.Keyword == keyword && !_resolved.Contains(entry) && !_spawnQueue.Contains(entry))
            {
                _spawnQueue.Add(entry);
                return;
            }
        }
    }

    private void SetActiveDanmakuPaused(bool paused)
    {
        for (int i = _activeDanmaku.Count - 1; i >= 0; i--)
        {
            GameObject go = _activeDanmaku[i];
            if (go == null) { _activeDanmaku.RemoveAt(i); continue; }
            BrainstormDanmakuButton mover = go.GetComponent<BrainstormDanmakuButton>();
            if (mover != null) mover.SetPaused(paused);
            Button button = go.GetComponent<Button>();
            if (button != null) button.interactable = !paused;
        }
    }

    private void UpdateProgress(string message)
    {
        _status.text = "Right ideas " + _correctCaught + " / " + _correctTotal + "    " + message;
    }

    private void ClearDanmaku()
    {
        foreach (GameObject go in _activeDanmaku) if (go != null) Destroy(go);
        _activeDanmaku.Clear();
    }

    // -------------------------------------------------------------------------
    // Cover slide / UI build
    // -------------------------------------------------------------------------

    private void StartCoverSideSlide()
    {
        if (_coverSideSlideRoutine != null) StopCoroutine(_coverSideSlideRoutine);
        if (sceneCoverRoot == null) return;

        RectTransform left = FindCoverRect("left");
        RectTransform right = FindCoverRect("right");
        if (left == null && right == null) return;
        _coverSideSlideRoutine = StartCoroutine(SlideCoverSides(left, right));
    }

    private IEnumerator SlideCoverSides(RectTransform left, RectTransform right)
    {
        Vector2 leftStart = left == null ? Vector2.zero : left.anchoredPosition;
        Vector2 rightStart = right == null ? Vector2.zero : right.anchoredPosition;
        Vector2 leftEnd = leftStart + Vector2.left * 520f;
        Vector2 rightEnd = rightStart + Vector2.right * 520f;
        float elapsed = 0f;

        while (elapsed < coverSideSlideDuration)
        {
            elapsed += Time.unscaledDeltaTime;
            float t = Mathf.SmoothStep(0f, 1f, elapsed / coverSideSlideDuration);
            if (left != null) left.anchoredPosition = Vector2.Lerp(leftStart, leftEnd, t);
            if (right != null) right.anchoredPosition = Vector2.Lerp(rightStart, rightEnd, t);
            yield return null;
        }

        if (left != null) left.anchoredPosition = leftEnd;
        if (right != null) right.anchoredPosition = rightEnd;
        _coverSideSlideRoutine = null;
    }

    private RectTransform FindCoverRect(string objectName)
    {
        Transform found = FindChildRecursive(sceneCoverRoot.transform, objectName);
        return found == null ? null : found.GetComponent<RectTransform>();
    }

    private static Transform FindChildRecursive(Transform root, string objectName)
    {
        if (root.name == objectName) return root;
        for (int i = 0; i < root.childCount; i++)
        {
            Transform found = FindChildRecursive(root.GetChild(i), objectName);
            if (found != null) return found;
        }
        return null;
    }

    private void BuildUI()
    {
        EnsureEventSystem();
        _font = RuntimeMonaFont.Load();

        GameObject canvasGo = new GameObject("Scene1Canvas", typeof(Canvas), typeof(CanvasScaler), typeof(GraphicRaycaster));
        _canvas = canvasGo.GetComponent<Canvas>();
        _canvas.renderMode = RenderMode.ScreenSpaceOverlay;
        CanvasScaler scaler = canvasGo.GetComponent<CanvasScaler>();
        scaler.uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
        scaler.referenceResolution = new Vector2(1920, 1080);
        scaler.matchWidthOrHeight = .5f;

        Image backdrop = CreateImage(canvasGo.transform, "Backdrop", new Color(.045f, .06f, .09f, .5f));
        Stretch(backdrop.rectTransform, 0, 0, 0, 0);

        _danmakuLayer = new GameObject("DanmakuLayer", typeof(RectTransform)).GetComponent<RectTransform>();
        _danmakuLayer.SetParent(canvasGo.transform, false);
        _danmakuLayer.anchorMin = new Vector2(.03f, .18f);
        _danmakuLayer.anchorMax = new Vector2(.97f, .88f);
        _danmakuLayer.offsetMin = _danmakuLayer.offsetMax = Vector2.zero;

        _status = CreateText(canvasGo.transform, "Status", 30, TextAnchor.MiddleCenter);
        SetAnchors(_status.rectTransform, .06f, .89f, .94f, .98f);
        _status.text = "Scene 1  ·  Brainstorm";

        _timerLabel = CreateText(canvasGo.transform, "TutorialTimer", 36, TextAnchor.MiddleCenter);
        SetAnchors(_timerLabel.rectTransform, .4f, .82f, .6f, .9f);
        _timerLabel.fontStyle = FontStyle.Bold;
        _timerLabel.color = new Color(1f, .85f, .45f, 1f);
        _timerLabel.gameObject.SetActive(false);

        Sprite[] bubbleSprites = Resources.LoadAll<Sprite>("bubble");
        Sprite bubbleLeft = FindSprite(bubbleSprites, "bubble_0");
        Sprite bubbleRight = FindSprite(bubbleSprites, "bubble_1");

        if (!BindAuthoredDialogue())
        {
            _dialoguePanel = new GameObject("DialoguePanel", typeof(RectTransform), typeof(Image));
            _dialoguePanel.transform.SetParent(canvasGo.transform, false);
            RectTransform panel = _dialoguePanel.GetComponent<RectTransform>();
            Stretch(panel, 0, 0, 0, 0);
            Image dim = _dialoguePanel.GetComponent<Image>();
            dim.color = new Color(0f, 0f, 0f, .28f);
            dim.raycastTarget = true;
            _panelAdvanceButton = _dialoguePanel.AddComponent<Button>();
            _panelAdvanceButton.transition = Selectable.Transition.None;
            _leftBubble = CreateSpeechBubble(panel, "BubbleLeft", bubbleLeft, true,
                out _leftSpeaker, out _leftDialogue, out _leftNextButton);
            _rightBubble = CreateSpeechBubble(panel, "BubbleRight", bubbleRight, false,
                out _rightSpeaker, out _rightDialogue, out _rightNextButton);
        }

        _speaker = _leftSpeaker;
        _dialogue = _leftDialogue;
        _dialogueNextButton = _leftNextButton;
        if (_dialoguePanel != null) _dialoguePanel.SetActive(false);

        _sceneNextButton = CreateButton(canvasGo.transform, "SceneNext", "NEXT  →");
        SetAnchors(_sceneNextButton.GetComponent<RectTransform>(), .78f, .05f, .94f, .14f);
        _sceneNextButton.onClick.AddListener(GoToNextScene);
        _sceneNextButton.gameObject.SetActive(false);

        BindOrCreateCoverUI(canvasGo.transform);
        EnsureChoicePanel();

        _audio = GetComponent<AudioSource>();
        if (_audio == null) _audio = gameObject.AddComponent<AudioSource>();
    }

    private bool BindAuthoredDialogue()
    {
        if (sceneDialoguePanel == null)
        {
            GameObject[] roots = FindObjectsOfType<GameObject>(true);
            for (int i = 0; i < roots.Length; i++)
                if (roots[i] != null && roots[i].name == "DialoguePanel")
                {
                    sceneDialoguePanel = roots[i];
                    break;
                }
        }

        if (sceneDialoguePanel == null) return false;

        _dialoguePanel = sceneDialoguePanel;
        Transform left = FindChildRecursive(_dialoguePanel.transform, "BubbleLeft");
        Transform right = FindChildRecursive(_dialoguePanel.transform, "BubbleRight");
        if (left == null || right == null) return false;

        _leftBubble = left.gameObject;
        _rightBubble = right.gameObject;
        _leftSpeaker = FindText(left, "Speaker");
        _rightSpeaker = FindText(right, "Speaker");
        _leftDialogue = FindText(left, "Dialogue");
        _rightDialogue = FindText(right, "Dialogue");
        _leftNextButton = left.GetComponent<Button>();
        _rightNextButton = right.GetComponent<Button>();
        _panelAdvanceButton = _dialoguePanel.GetComponent<Button>();
        if (_panelAdvanceButton == null) _panelAdvanceButton = _dialoguePanel.AddComponent<Button>();
        _panelAdvanceButton.transition = Selectable.Transition.None;
        _dialoguePanel.SetActive(false);
        bool bound = _leftDialogue != null && _rightDialogue != null;
        _authoredDialogueLayout = bound;
        return bound;
    }

    private static Text FindText(Transform root, string objectName)
    {
        Transform found = FindChildRecursive(root, objectName);
        return found == null ? null : found.GetComponent<Text>();
    }

    private void BindOrCreateCoverUI(Transform fallbackParent)
    {
        if (sceneCoverRoot != null && sceneStartButton != null)
        {
            _startOverlay = sceneCoverRoot;
            _startButton = sceneStartButton;
            return;
        }

        _startOverlay = new GameObject("StartOverlay_Fallback", typeof(RectTransform), typeof(Image));
        _startOverlay.transform.SetParent(fallbackParent, false);
        RectTransform startOverlayRect = _startOverlay.GetComponent<RectTransform>();
        Stretch(startOverlayRect, 0, 0, 0, 0);
        _startOverlay.GetComponent<Image>().color = new Color(.025f, .035f, .055f, .96f);

        Text title = CreateText(startOverlayRect, "Title", 48, TextAnchor.MiddleCenter);
        title.fontStyle = FontStyle.Bold;
        title.text = "Backstage Troupe";
        SetAnchors(title.rectTransform, .2f, .58f, .8f, .72f);
        Text subtitle = CreateText(startOverlayRect, "Subtitle", 25, TextAnchor.MiddleCenter);
        subtitle.text = "It starts with a failed acting audition";
        SetAnchors(subtitle.rectTransform, .2f, .48f, .8f, .58f);
        _startButton = CreateButton(startOverlayRect, "StartGameButton", "Start Game");
        SetAnchors(_startButton.GetComponent<RectTransform>(), .38f, .34f, .62f, .45f);
    }

    private void BuildEmergencyUI(string message)
    {
        if (_canvas != null) return;
        GameObject go = new GameObject("Scene1StartupError", typeof(Canvas), typeof(CanvasScaler), typeof(GraphicRaycaster));
        Canvas canvas = go.GetComponent<Canvas>();
        canvas.renderMode = RenderMode.ScreenSpaceOverlay;
        _font = RuntimeMonaFont.Load();
        Text text = CreateText(go.transform, "Error", 24, TextAnchor.MiddleCenter);
        Stretch(text.rectTransform, 40, 40, -40, -40);
        text.text = "Scene 1 startup failed:\n" + message;
        text.color = Color.red;
    }

    private GameObject CreateSpeechBubble(Transform parent, string objectName, Sprite sprite, bool left,
        out Text speaker, out Text body, out Button advance)
    {
        GameObject go = new GameObject(objectName, typeof(RectTransform), typeof(Image), typeof(Button));
        go.transform.SetParent(parent, false);
        RectTransform rect = go.GetComponent<RectTransform>();
        if (left)
        {
            rect.anchorMin = rect.anchorMax = new Vector2(0f, 0f);
            rect.pivot = new Vector2(0f, 0f);
            rect.anchoredPosition = new Vector2(36f, 28f);
            rect.sizeDelta = new Vector2(560f, 313f);
        }
        else
        {
            rect.anchorMin = rect.anchorMax = new Vector2(1f, 0f);
            rect.pivot = new Vector2(1f, 0f);
            rect.anchoredPosition = new Vector2(-36f, 72f);
            rect.sizeDelta = new Vector2(620f, 267f);
        }

        Image image = go.GetComponent<Image>();
        image.sprite = sprite;
        image.color = Color.white;
        image.preserveAspect = true;
        image.raycastTarget = true;

        ColorBlock colors = go.GetComponent<Button>().colors;
        colors.highlightedColor = new Color(1f, 1f, 1f, 1f);
        colors.pressedColor = new Color(.92f, .92f, .9f, 1f);
        go.GetComponent<Button>().colors = colors;
        advance = go.GetComponent<Button>();

        speaker = CreateText(go.transform, "Speaker", 26, left ? TextAnchor.MiddleLeft : TextAnchor.MiddleRight);
        speaker.fontStyle = FontStyle.Bold;
        speaker.color = new Color(.28f, .16f, .1f, 1f);
        if (left) SetAnchors(speaker.rectTransform, .18f, .72f, .82f, .88f);
        else SetAnchors(speaker.rectTransform, .12f, .74f, .78f, .9f);

        body = CreateText(go.transform, "Dialogue", 24, TextAnchor.UpperLeft);
        body.color = new Color(.16f, .11f, .08f, 1f);
        body.horizontalOverflow = HorizontalWrapMode.Wrap;
        body.verticalOverflow = VerticalWrapMode.Overflow;
        if (left) SetAnchors(body.rectTransform, .18f, .22f, .84f, .72f);
        else SetAnchors(body.rectTransform, .12f, .18f, .78f, .74f);
        return go;
    }

    private static Sprite FindSprite(Sprite[] sprites, string spriteName)
    {
        if (sprites == null) return null;
        foreach (Sprite sprite in sprites)
            if (sprite != null && sprite.name == spriteName) return sprite;
        return null;
    }

    private Image CreateImage(Transform parent, string name, Color color)
    {
        GameObject go = new GameObject(name, typeof(RectTransform), typeof(Image));
        go.transform.SetParent(parent, false);
        Image image = go.GetComponent<Image>();
        image.color = color;
        return image;
    }

    private Text CreateText(Transform parent, string name, int size, TextAnchor alignment)
    {
        GameObject go = new GameObject(name, typeof(RectTransform), typeof(Text));
        go.transform.SetParent(parent, false);
        Text text = go.GetComponent<Text>();
        text.font = _font;
        text.fontSize = size;
        text.alignment = alignment;
        text.color = Color.white;
        text.raycastTarget = false;
        return text;
    }

    private Button CreateButton(Transform parent, string name, string label)
    {
        Image image = CreateImage(parent, name, new Color(.13f, .34f, .52f, 1f));
        Button button = image.gameObject.AddComponent<Button>();
        Text text = CreateText(image.transform, "Label", 25, TextAnchor.MiddleCenter);
        Stretch(text.rectTransform, 7, 4, -7, -4);
        text.text = label;
        return button;
    }

    private static void SetAnchors(RectTransform rect, float minX, float minY, float maxX, float maxY)
    {
        rect.anchorMin = new Vector2(minX, minY);
        rect.anchorMax = new Vector2(maxX, maxY);
        rect.offsetMin = rect.offsetMax = Vector2.zero;
    }

    private static void Stretch(RectTransform rect, float left, float bottom, float right, float top)
    {
        rect.anchorMin = Vector2.zero;
        rect.anchorMax = Vector2.one;
        rect.offsetMin = new Vector2(left, bottom);
        rect.offsetMax = new Vector2(right, top);
    }

    private void Play(AudioClip clip) { if (clip != null) _audio.PlayOneShot(clip); }

    private static void EnsureEventSystem()
    {
        if (FindObjectOfType<EventSystem>() == null)
            new GameObject("EventSystem", typeof(EventSystem), typeof(StandaloneInputModule));
    }
}

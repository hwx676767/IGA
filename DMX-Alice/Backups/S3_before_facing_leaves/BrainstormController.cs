using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

/// <summary>
/// Scene 1 flow: introduction dialogue -> interactive danmaku -> NEXT scene.
/// Scene placeholders are activated by keyword clicks and remain scene-owned.
/// </summary>
public class BrainstormController : MonoBehaviour
{
    private enum FlowState { Introduction, Brainstorm, DialoguePause, Completed }

    [Header("Flow")]
    [SerializeField] private string nextSceneName = "SampleScene";
    [SerializeField] private float dialogueTypingSpeed = 45f;
    [SerializeField] private float spawnInterval = .8f;
    [SerializeField] private Vector2 danmakuSpeedRange = new Vector2(150f, 220f);

    [Header("Danmaku layout")]
    [SerializeField] private float danmakuVerticalLimit = 260f;
    [SerializeField] private float danmakuLaneSpacing = 92f;

    [Header("Scene-authored cover UI")]
    [Tooltip("Edit these objects directly under Scene1CoverCanvas in S1.")]
    [SerializeField] private GameObject sceneCoverRoot;
    [SerializeField] private Button sceneStartButton;
    [SerializeField] private Text sceneCoverTitle;
    [SerializeField] private Text sceneCoverSubtitle;
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
    private Button _dialogueNextButton;
    private Button _leftNextButton;
    private Button _rightNextButton;
    private Button _panelAdvanceButton;
    private Button _sceneNextButton;
    private GameObject _startOverlay;
    private Button _startButton;
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
    private int _dialogueTurn;
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
        {
            // Wait for a clear lane instead of placing a new clickable card over
            // an existing one. Different horizontal speeds still remain intact.
            _spawnTimer = SpawnKeyword() ? spawnInterval : .2f;
        }
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
            _spawnQueue.Add(entry);
            if (entry.IsHelpful) _correctTotal++;
        }
        if (_correctTotal == 0)
            Debug.LogError("S1 has no helpful DanmakuRevealPlaceholder objects.", this);
    }

    private void StartIntroduction()
    {
        if (_introductionStarted) return;
        _introductionStarted = true;
        Debug.Log("[Scene1] Start Game clicked. Beginning introduction dialogue.", this);
        _startOverlay.SetActive(false);
        _state = FlowState.Introduction;
        _dialoguePanel.SetActive(true);
        _sceneNextButton.gameObject.SetActive(false);
        ShowDialogue("Teacher", "Thank you for coming to the drama club audition. I'm sorry — you didn't meet the bar to go on stage this time.", () =>
            ShowDialogue("Player", "So I failed after all... I always wanted to stand in the lights. Maybe they were never meant for me.", () =>
                ShowDialogue("Voice", "A play is not only what happens downstage. You can make things. Maybe your place is backstage.", () =>
                    ShowDialogue("Sam", "Welcome to the crew. The new show is Moonlit Tryst: a meeting at the treeline, a token at the table, a scene change, a distant shock. First, catch the keywords that can hold this night together.", () =>
                        ShowDialogue("Player", "Got it. Castle, candlelight, long table, parchment... keep what fits, drop what doesn't, and piece the night stage together.", BeginBrainstorm)))));
    }

    private void ShowStartScreen()
    {
        _introductionStarted = false;
        _dialogueTurn = 0;
        _state = FlowState.Introduction;
        _dialoguePanel.SetActive(false);
        _sceneNextButton.gameObject.SetActive(false);
        _startOverlay.SetActive(true);
        _startButton.onClick.RemoveAllListeners();
        _startButton.onClick.AddListener(StartIntroduction);
    }

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

    private void BeginBrainstorm()
    {
        _dialoguePanel.SetActive(false);
        _state = FlowState.Brainstorm;
        _dialogueTurn = 0;
        _spawnTimer = 0f;
        UpdateProgress("Start collecting ideas");
    }

    private bool SpawnKeyword()
    {
        if (!TryGetClearDanmakuLane(out float y)) return false;

        DanmakuRevealPlaceholder entry = _spawnQueue[Random.Range(0, _spawnQueue.Count)];
        _spawnQueue.Remove(entry);

        GameObject go = new GameObject("Danmaku_" + entry.Keyword, typeof(RectTransform), typeof(Image), typeof(Button));
        go.transform.SetParent(_danmakuLayer, false);
        _activeDanmaku.Add(go);
        RectTransform rect = go.GetComponent<RectTransform>();
        rect.anchorMin = rect.anchorMax = new Vector2(.5f, .5f);
        float cardWidth = Mathf.Max(220f, entry.DisplayKeyword.Length * 18f + 80f);
        rect.sizeDelta = new Vector2(cardWidth + 28f, 80f);
        float halfWidth = Mathf.Max(600f, _danmakuLayer.rect.width * .5f);
        rect.anchoredPosition = new Vector2(halfWidth + rect.sizeDelta.x, y);

        Image glow = go.GetComponent<Image>();
        glow.color = new Color(1f, 1f, 1f, .55f);
        glow.raycastTarget = true;
        Outline glowOutline = go.AddComponent<Outline>();
        glowOutline.effectColor = new Color(1f, 1f, 1f, .7f);
        glowOutline.effectDistance = new Vector2(10f, -10f);
        Shadow glowBloom = go.AddComponent<Shadow>();
        glowBloom.effectColor = new Color(1f, 1f, 1f, .45f);
        glowBloom.effectDistance = new Vector2(0f, 0f);

        Image card = CreateImage(go.transform, "Card", entry.IsHelpful
            ? new Color(.12f, .27f, .4f, .98f)
            : entry.IsIrrelevant
                ? new Color(.24f, .24f, .27f, .98f)
                : new Color(.37f, .18f, .2f, .98f));
        Stretch(card.rectTransform, 12, 10, -12, -10);
        card.raycastTarget = false;
        Text label = CreateText(go.transform, "Keyword", 28, TextAnchor.MiddleCenter);
        Stretch(label.rectTransform, 18, 12, -18, -12);
        label.text = entry.DisplayKeyword;

        BrainstormDanmakuButton mover = go.AddComponent<BrainstormDanmakuButton>();
        mover.Prepare(new BrainstormThought { text = entry.Keyword, isRelevant = entry.IsHelpful });
        mover.BeginMove(-Random.Range(danmakuSpeedRange.x, danmakuSpeedRange.y),
            rect.anchoredPosition.x, y, -halfWidth - rect.sizeDelta.x,
            clicked => SelectKeyword(entry, clicked), OnDanmakuLeftScreen);
        return true;
    }

    private bool TryGetClearDanmakuLane(out float y)
    {
        for (int i = _activeDanmaku.Count - 1; i >= 0; i--)
            if (_activeDanmaku[i] == null) _activeDanmaku.RemoveAt(i);

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
        foreach (GameObject active in _activeDanmaku)
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
            // TODO(audio): assign irrelevantSound when the music/SFX material is available.
            Play(irrelevantSound);
            UpdateProgress("— " + entry.DisplayKeyword + ": unrelated to Moonlit Tryst.");
            StartCoroutine(FlashStatus());
        }
        else
        {
            Play(negativeSound);
            UpdateProgress("× " + entry.DisplayKeyword + ": " + entry.Feedback);
            PauseForDialogue("Sam", RejectLine(entry), ResumeBrainstorm);
        }
    }

    private IEnumerator FlashStatus()
    {
        Color original = _status.color;
        _status.color = new Color(1f, .76f, .3f);
        yield return new WaitForSecondsRealtime(.3f);
        _status.color = original;
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
        if (_dialogue == null) return;
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
                return "The castle doesn't need the center. Put it in the night behind the stage — far scenery for Moonlit Tryst is enough.";
            case "骑士盔甲":
                return "No one has to wear the armor. A flash of iron in the tree-shadow is enough for identity.";
            case "哥特拱门":
                return "The arch can be the treeline entrance. She comes through it on her way under the tree.";
            case "羊皮卷":
                return "The parchment is the tryst itself. Later it can become the token on the table, or a contract in her sleeve.";
            case "烛台与火炬":
                return "Where moonlight isn't enough, use fire. The tryst table should be warm; the treeline should stay dark.";
            case "木制长桌":
                return "That's the tryst table. Leave the edge free for the apple, and don't block her path.";
            case "王座":
                return "Keep the throne farther back. Power in the upstage, the meeting at the table — two forces holding the scene.";
            case "彩绘玻璃":
                return "Moonlight through stained glass is what makes the falling leaves look like they're falling.";
            default:
                return "\"" + entry.DisplayKeyword + "\" can enter this scene. " + entry.Feedback;
        }
    }

    private static string RejectLine(DanmakuRevealPlaceholder entry)
    {
        switch (entry.Keyword)
        {
            case "古希腊石柱":
                return "The columns are too early. This night is medieval, not a temple.";
            case "罗马斗兽场":
                return "The arena would turn the tryst into a fight. The period would collapse.";
            case "文艺复兴油画":
                return "The painting is too late, and too bright. Moonlight needs shadow, not a gallery.";
            case "巴洛克水晶吊灯":
                return "Hang a chandelier and the tree-shadow is gone. This scene doesn't need palace glitter.";
            case "维多利亚蒸汽机":
                return "Machine noise would crush a night talk. Save it for another industrial play.";
            case "日式鸟居":
                return "Wrong frame. The treeline can have a gate, but not a torii.";
            default:
                return "\"" + entry.DisplayKeyword + "\" would drag Moonlit Tryst somewhere else. " + entry.Feedback;
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

    private void BuildUI()
    {
        EnsureEventSystem();
        _font = FontFromScene();

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
        _status.text = "Scene 1  ·  Moonlit Tryst";

        Sprite[] bubbleSprites = Resources.LoadAll<Sprite>("bubble");
        Sprite bubbleLeft = FindSprite(bubbleSprites, "bubble_0");
        Sprite bubbleRight = FindSprite(bubbleSprites, "bubble_1");

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
        _speaker = _leftSpeaker;
        _dialogue = _leftDialogue;
        _dialogueNextButton = _leftNextButton;

        _sceneNextButton = CreateButton(canvasGo.transform, "SceneNext", "NEXT  →");
        SetAnchors(_sceneNextButton.GetComponent<RectTransform>(), .78f, .05f, .94f, .14f);
        _sceneNextButton.onClick.AddListener(GoToNextScene);
        _sceneNextButton.gameObject.SetActive(false);

        BindOrCreateCoverUI(canvasGo.transform);

        _audio = GetComponent<AudioSource>();
        if (_audio == null) _audio = gameObject.AddComponent<AudioSource>();
    }

    private void BindOrCreateCoverUI(Transform fallbackParent)
    {
        if (sceneCoverRoot != null && sceneStartButton != null)
        {
            _startOverlay = sceneCoverRoot;
            _startButton = sceneStartButton;
            return;
        }

        // Fallback only for scenes that have not been upgraded with editable cover objects.
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

    private static Font FontFromScene()
    {
        Text[] texts = FindObjectsOfType<Text>(true);
        for (int i = 0; i < texts.Length; i++)
            if (texts[i] != null && texts[i].font != null)
                return texts[i].font;
        return Resources.GetBuiltinResource<Font>("Arial.ttf");
    }

    private void BuildEmergencyUI(string message)
    {
        if (_canvas != null) return;
        GameObject go = new GameObject("Scene1StartupError", typeof(Canvas), typeof(CanvasScaler), typeof(GraphicRaycaster));
        Canvas canvas = go.GetComponent<Canvas>();
        canvas.renderMode = RenderMode.ScreenSpaceOverlay;
        _font = Resources.GetBuiltinResource<Font>("Arial.ttf");
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
            rect.sizeDelta = new Vector2(560f, 470f);
        }
        else
        {
            rect.anchorMin = rect.anchorMax = new Vector2(1f, 0f);
            rect.pivot = new Vector2(1f, 0f);
            rect.anchoredPosition = new Vector2(-36f, 72f);
            rect.sizeDelta = new Vector2(620f, 400f);
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

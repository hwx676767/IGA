using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;
using UnityEngine.UI;

/// <summary>
/// Level 1 sequence: start → dialog 01 → dialog 02 → eat noodles → transition → buy noodles.
/// Panels and children already exist in the scene; this script only toggles and animates them.
/// </summary>
public class MemoryStoryFlow : MonoBehaviour
{
    private enum StoryStage
    {
        Start,
        Dialog01,
        Dialog02,
        Eating,
        Transition,
        BuyNoodle
    }

    [Header("Scene References")]
    [SerializeField] private DiaryController diaryController;
    [SerializeField] private GameObject startPanel;
    [SerializeField] private GameObject dialog01Panel;
    [SerializeField] private GameObject dialog02Panel;
    [SerializeField] private GameObject eatNoodlePanel;
    [SerializeField] private GameObject transitionPanel;
    [SerializeField] private GameObject buyNoodlePanel;
    [SerializeField] private NoodleDragController noodleDrag;
    [SerializeField] private Volume globalVolume;

    [Header("Timing")]
    [SerializeField, Min(0.05f)] private float bubblePopDuration = 0.7f;
    [SerializeField, Min(0.05f)] private float fadeDuration = 0.9f;
    [SerializeField, Min(0f)] private float dialog02DelayBetweenChildren = 0.55f;
    [SerializeField, Min(0f)] private float transitionVisibleDuration = 3f;
    [SerializeField, Min(0.05f)] private float vignetteFadeDuration = 1.2f;
    [SerializeField, Min(0.05f)] private float frontMoveDuration = 1.6f;
    [SerializeField] private float frontStartPosY = -430f;
    [SerializeField] private float frontEndPosY = 0f;

    private StoryStage stage;
    private Coroutine routine;
    private bool waitingForClick;
    private bool clickConsumedThisFrame;
    private bool postMealDiaryUnlocked;
    private readonly List<GameObject> dialog01Children = new List<GameObject>();
    private readonly List<GameObject> dialog02RevealChildren = new List<GameObject>();
    private int dialog01Index;
    private CanvasGroup transitionCanvasGroup;
    private RectTransform buyFrontRect;
    private GameObject buyBubble;
    private Vector3 buyBubbleScale = Vector3.one;
    private Vignette vignette;
    private float defaultVignetteIntensity;

    private void Awake()
    {
        CachePanelChildren();
        EnsureTransitionCanvasGroup();
        CacheBuyNoodleParts();
        CacheVignette();

        if (noodleDrag == null && eatNoodlePanel != null)
        {
            noodleDrag = eatNoodlePanel.GetComponentInChildren<NoodleDragController>(true);
        }

        if (noodleDrag != null)
        {
            noodleDrag.EatingCompleted += OnEatingCompleted;
        }
    }

    private void OnDestroy()
    {
        if (noodleDrag != null)
        {
            noodleDrag.EatingCompleted -= OnEatingCompleted;
        }
    }

    private void Start()
    {
        SetActive(dialog01Panel, false);
        SetActive(dialog02Panel, false);
        SetActive(eatNoodlePanel, false);
        SetActive(transitionPanel, false);
        SetActive(buyNoodlePanel, false);
        SetActive(startPanel, true);
        EnsureCoverButtons();
        EnsureEatDebugButton();

        stage = StoryStage.Start;
        postMealDiaryUnlocked = false;
        waitingForClick = false;
        SetVignetteIntensity(defaultVignetteIntensity);
    }

    public void OpenDiaryForCurrentStage()
    {
        if (diaryController == null) return;

        if (stage == StoryStage.Start)
        {
            SetActive(startPanel, false);
        }

        if (postMealDiaryUnlocked)
        {
            diaryController.OpenPostMealDiary();
        }
        else
        {
            diaryController.OpenIntroDiary();
        }
    }

    public void CloseDiaryAndContinue()
    {
        if (diaryController == null) return;
        diaryController.CloseDiary();

        if (stage == StoryStage.Start)
        {
            BeginDialog01();
        }
    }

    public void StartGame()
    {
        if (stage != StoryStage.Start) return;
        BeginDialog01();
    }

    public void CompleteEating()
    {
        if (stage != StoryStage.Eating || routine != null) return;
        BeginTransition();
    }

    private void Update()
    {
        clickConsumedThisFrame = false;
        if (!waitingForClick) return;
        if (!Input.GetMouseButtonDown(0)) return;
        if (IsDiaryOpen()) return;
        if (IsPointerOverButton()) return;

        clickConsumedThisFrame = true;
        HandleStoryClick();
    }

    private void HandleStoryClick()
    {
        switch (stage)
        {
            case StoryStage.Dialog01:
                AdvanceDialog01();
                break;
            case StoryStage.Dialog02:
                BeginEating();
                break;
            default:
                break;
        }
    }

    private void BeginDialog01()
    {
        waitingForClick = false;
        SetActive(startPanel, false);
        PrepareSequentialChildren(dialog01Children);
        SetActive(dialog01Panel, true);

        stage = StoryStage.Dialog01;
        dialog01Index = 0;
        waitingForClick = true;
    }

    private void AdvanceDialog01()
    {
        if (routine != null) return;

        if (dialog01Index < dialog01Children.Count)
        {
            waitingForClick = false;
            routine = StartCoroutine(PopInChild(dialog01Children[dialog01Index], () =>
            {
                dialog01Index++;
                routine = null;
                waitingForClick = true;
            }));
            return;
        }

        BeginDialog02();
    }

    private void BeginDialog02()
    {
        waitingForClick = false;
        SetActive(dialog01Panel, false);
        PrepareDialog02();
        SetActive(dialog02Panel, true);

        stage = StoryStage.Dialog02;
        routine = StartCoroutine(RevealDialog02ThenWait());
    }

    private IEnumerator RevealDialog02ThenWait()
    {
        for (var i = 0; i < dialog02RevealChildren.Count; i++)
        {
            var child = dialog02RevealChildren[i];
            yield return FadeAndPopChild(child);
            if (dialog02DelayBetweenChildren > 0f && i < dialog02RevealChildren.Count - 1)
            {
                yield return new WaitForSecondsRealtime(dialog02DelayBetweenChildren);
            }
        }

        routine = null;
        waitingForClick = true;
    }

    private void BeginEating()
    {
        if (routine != null) return;

        waitingForClick = false;
        SetActive(dialog02Panel, false);
        SetActive(eatNoodlePanel, true);
        stage = StoryStage.Eating;
        noodleDrag?.ResetSession();
    }

    private void OnEatingCompleted()
    {
        if (stage != StoryStage.Eating) return;
        if (clickConsumedThisFrame) return;
        BeginTransition();
    }

    private void BeginTransition()
    {
        waitingForClick = false;
        SetActive(eatNoodlePanel, false);
        postMealDiaryUnlocked = true;
        stage = StoryStage.Transition;
        routine = StartCoroutine(PlayTransitionThenBuyNoodle());
    }

    private IEnumerator PlayTransitionThenBuyNoodle()
    {
        SetActive(transitionPanel, true);
        if (transitionCanvasGroup != null)
        {
            transitionCanvasGroup.alpha = 0f;
            yield return FadeCanvasGroup(transitionCanvasGroup, 0f, 1f);
        }

        yield return new WaitForSecondsRealtime(transitionVisibleDuration);

        if (transitionCanvasGroup != null)
        {
            yield return FadeCanvasGroup(transitionCanvasGroup, 1f, 0f);
        }

        SetActive(transitionPanel, false);
        SetVignetteIntensity(1f);
        yield return PlayBuyNoodle();
    }

    private IEnumerator PlayBuyNoodle()
    {
        stage = StoryStage.BuyNoodle;
        PrepareBuyNoodle();
        SetActive(buyNoodlePanel, true);

        // Enter last scene fully vignetted, then ease out before front/bubble.
        SetVignetteIntensity(1f);
        yield return FadeVignette(1f, 0f);

        if (buyFrontRect != null)
        {
            var start = buyFrontRect.anchoredPosition;
            start.y = frontStartPosY;
            var end = start;
            end.y = frontEndPosY;
            buyFrontRect.anchoredPosition = start;

            var elapsed = 0f;
            while (elapsed < frontMoveDuration)
            {
                elapsed += Time.unscaledDeltaTime;
                var t = Mathf.Clamp01(elapsed / frontMoveDuration);
                t = 1f - (1f - t) * (1f - t);
                buyFrontRect.anchoredPosition = Vector2.LerpUnclamped(start, end, t);
                yield return null;
            }

            buyFrontRect.anchoredPosition = end;
        }

        if (buyBubble != null)
        {
            yield return PopInChild(buyBubble, null);
        }

        routine = null;
        waitingForClick = false;
    }

    private IEnumerator FadeVignette(float from, float to)
    {
        if (vignette == null) yield break;

        var elapsed = 0f;
        SetVignetteIntensity(from);
        while (elapsed < vignetteFadeDuration)
        {
            elapsed += Time.unscaledDeltaTime;
            SetVignetteIntensity(Mathf.Lerp(from, to, elapsed / vignetteFadeDuration));
            yield return null;
        }

        SetVignetteIntensity(to);
    }

    private void CacheVignette()
    {
        if (globalVolume == null)
        {
            globalVolume = FindObjectOfType<Volume>();
        }

        if (globalVolume == null) return;

        // Runtime profile clone — avoid permanently writing the shared asset.
        if (!globalVolume.profile.TryGet(out vignette) || vignette == null) return;

        defaultVignetteIntensity = 0f;
        vignette.active = true;
        vignette.intensity.overrideState = true;
        SetVignetteIntensity(0f);
    }

    private void SetVignetteIntensity(float value)
    {
        if (vignette == null) return;
        vignette.intensity.Override(Mathf.Clamp01(value));
    }

    private IEnumerator PopInChild(GameObject child, System.Action onComplete)
    {
        if (child == null)
        {
            onComplete?.Invoke();
            yield break;
        }

        var rect = child.transform as RectTransform;
        var targetScale = rect != null ? rect.localScale : Vector3.one;
        child.SetActive(true);
        if (rect != null)
        {
            rect.localScale = Vector3.zero;
        }

        var elapsed = 0f;
        while (elapsed < bubblePopDuration)
        {
            elapsed += Time.unscaledDeltaTime;
            var t = Mathf.Clamp01(elapsed / bubblePopDuration);
            var scale = EaseOutBack(t);
            if (rect != null)
            {
                rect.localScale = targetScale * scale;
            }

            yield return null;
        }

        if (rect != null)
        {
            rect.localScale = targetScale;
        }

        onComplete?.Invoke();
    }

    private IEnumerator FadeAndPopChild(GameObject child)
    {
        if (child == null) yield break;

        var rect = child.transform as RectTransform;
        var targetScale = rect != null ? rect.localScale : Vector3.one;
        var canvasGroup = child.GetComponent<CanvasGroup>();
        if (canvasGroup == null)
        {
            canvasGroup = child.AddComponent<CanvasGroup>();
        }

        child.SetActive(true);
        canvasGroup.alpha = 0f;
        if (rect != null)
        {
            rect.localScale = targetScale * 0.82f;
        }

        var elapsed = 0f;
        while (elapsed < fadeDuration)
        {
            elapsed += Time.unscaledDeltaTime;
            var t = Mathf.Clamp01(elapsed / fadeDuration);
            canvasGroup.alpha = t;
            if (rect != null)
            {
                rect.localScale = Vector3.LerpUnclamped(targetScale * 0.82f, targetScale, EaseOutBack(t));
            }

            yield return null;
        }

        canvasGroup.alpha = 1f;
        if (rect != null)
        {
            rect.localScale = targetScale;
        }
    }

    private IEnumerator FadeCanvasGroup(CanvasGroup canvasGroup, float from, float to)
    {
        var elapsed = 0f;
        canvasGroup.alpha = from;
        while (elapsed < fadeDuration)
        {
            elapsed += Time.unscaledDeltaTime;
            canvasGroup.alpha = Mathf.Lerp(from, to, elapsed / fadeDuration);
            yield return null;
        }

        canvasGroup.alpha = to;
    }

    private void CachePanelChildren()
    {
        CollectDirectChildren(dialog01Panel, dialog01Children, null);
        CollectDirectChildren(dialog02Panel, dialog02RevealChildren, "back");
    }

    private static void CollectDirectChildren(GameObject panel, List<GameObject> buffer, string skipName)
    {
        buffer.Clear();
        if (panel == null) return;

        var parent = panel.transform;
        for (var i = 0; i < parent.childCount; i++)
        {
            var child = parent.GetChild(i).gameObject;
            if (!string.IsNullOrEmpty(skipName) && string.Equals(child.name, skipName, System.StringComparison.OrdinalIgnoreCase))
            {
                continue;
            }

            buffer.Add(child);
        }
    }

    private void PrepareSequentialChildren(List<GameObject> children)
    {
        for (var i = 0; i < children.Count; i++)
        {
            if (children[i] != null)
            {
                children[i].SetActive(false);
            }
        }
    }

    private void PrepareDialog02()
    {
        if (dialog02Panel == null) return;

        var parent = dialog02Panel.transform;
        for (var i = 0; i < parent.childCount; i++)
        {
            var child = parent.GetChild(i).gameObject;
            var isBack = string.Equals(child.name, "back", System.StringComparison.OrdinalIgnoreCase);
            child.SetActive(isBack);
        }
    }

    private void EnsureTransitionCanvasGroup()
    {
        if (transitionPanel == null) return;

        transitionCanvasGroup = transitionPanel.GetComponent<CanvasGroup>();
        if (transitionCanvasGroup == null)
        {
            transitionCanvasGroup = transitionPanel.AddComponent<CanvasGroup>();
        }
    }

    private void CacheBuyNoodleParts()
    {
        if (buyNoodlePanel == null) return;

        var parent = buyNoodlePanel.transform;
        var front = parent.Find("front");
        if (front != null)
        {
            buyFrontRect = front as RectTransform;
        }

        var bubble = parent.Find("bubble");
        if (bubble != null)
        {
            buyBubble = bubble.gameObject;
            buyBubbleScale = bubble.localScale;
        }
    }

    private void PrepareBuyNoodle()
    {
        if (buyNoodlePanel == null) return;

        var parent = buyNoodlePanel.transform;
        for (var i = 0; i < parent.childCount; i++)
        {
            var child = parent.GetChild(i).gameObject;
            if (string.Equals(child.name, "back", System.StringComparison.OrdinalIgnoreCase))
            {
                child.SetActive(true);
            }
            else if (string.Equals(child.name, "front", System.StringComparison.OrdinalIgnoreCase))
            {
                child.SetActive(true);
                if (buyFrontRect != null)
                {
                    var pos = buyFrontRect.anchoredPosition;
                    pos.y = frontStartPosY;
                    buyFrontRect.anchoredPosition = pos;
                }
            }
            else if (string.Equals(child.name, "bubble", System.StringComparison.OrdinalIgnoreCase))
            {
                child.SetActive(false);
                child.transform.localScale = buyBubbleScale;
            }
            else
            {
                child.SetActive(false);
            }
        }
    }

    private bool IsDiaryOpen()
    {
        return diaryController != null && diaryController.IsDiaryOpen;
    }

    private static bool IsPointerOverButton()
    {
        var eventSystem = EventSystem.current;
        if (eventSystem == null) return false;

        var pointer = new PointerEventData(eventSystem) { position = Input.mousePosition };
        var results = new List<RaycastResult>();
        eventSystem.RaycastAll(pointer, results);

        for (var i = 0; i < results.Count; i++)
        {
            if (results[i].gameObject.GetComponent<Button>() != null)
            {
                return true;
            }
        }

        return false;
    }

    private void EnsureCoverButtons()
    {
        if (startPanel == null) return;
        if (startPanel.transform.Find("Start Game Button") != null) return;

        CreateUiButton(
            "Start Game Button",
            startPanel.transform,
            "开始游戏",
            new Vector2(0.5f, 0.5f),
            new Vector2(0f, -110f),
            new Vector2(300f, 70f),
            new Color(0.31f, 0.42f, 0.22f, 1f),
            StartGame);
    }

    private void EnsureEatDebugButton()
    {
        if (eatNoodlePanel == null) return;
        if (eatNoodlePanel.transform.Find("Finish Eating Debug Button") != null) return;

        CreateUiButton(
            "Finish Eating Debug Button",
            eatNoodlePanel.transform,
            "完成吃面（调试）",
            new Vector2(1f, 0f),
            new Vector2(-180f, 80f),
            new Vector2(280f, 62f),
            new Color(0.31f, 0.16f, 0.08f, 1f),
            CompleteEating);
    }

    private void CreateUiButton(
        string objectName,
        Transform parent,
        string label,
        Vector2 anchor,
        Vector2 anchoredPosition,
        Vector2 size,
        Color color,
        UnityEngine.Events.UnityAction onClick)
    {
        var buttonObject = new GameObject(objectName, typeof(RectTransform), typeof(CanvasRenderer), typeof(Image), typeof(Button));
        buttonObject.layer = LayerMask.NameToLayer("UI");
        buttonObject.transform.SetParent(parent, false);

        var rect = buttonObject.GetComponent<RectTransform>();
        rect.anchorMin = anchor;
        rect.anchorMax = anchor;
        rect.pivot = new Vector2(0.5f, 0.5f);
        rect.anchoredPosition = anchoredPosition;
        rect.sizeDelta = size;

        var image = buttonObject.GetComponent<Image>();
        image.color = color;
        var button = buttonObject.GetComponent<Button>();
        button.targetGraphic = image;
        button.onClick.AddListener(onClick);

        var labelObject = new GameObject("Label", typeof(RectTransform), typeof(CanvasRenderer), typeof(Text));
        labelObject.layer = LayerMask.NameToLayer("UI");
        labelObject.transform.SetParent(buttonObject.transform, false);

        var labelRect = labelObject.GetComponent<RectTransform>();
        labelRect.anchorMin = Vector2.zero;
        labelRect.anchorMax = Vector2.one;
        labelRect.offsetMin = Vector2.zero;
        labelRect.offsetMax = Vector2.zero;

        var text = labelObject.GetComponent<Text>();
        text.font = GetComponentInChildren<Text>(true)?.font
            ?? Resources.GetBuiltinResource<Font>("LegacyRuntime.ttf")
            ?? Resources.GetBuiltinResource<Font>("Arial.ttf");
        text.text = label;
        text.fontSize = 26;
        text.fontStyle = FontStyle.Bold;
        text.color = Color.white;
        text.alignment = TextAnchor.MiddleCenter;
        text.raycastTarget = false;
    }

    private static void SetActive(GameObject target, bool active)
    {
        if (target != null) target.SetActive(active);
    }

    private static float EaseOutBack(float t)
    {
        const float overshoot = 1.70158f;
        t = Mathf.Clamp01(t);
        var inv = t - 1f;
        return 1f + inv * inv * ((overshoot + 1f) * inv + overshoot);
    }
}

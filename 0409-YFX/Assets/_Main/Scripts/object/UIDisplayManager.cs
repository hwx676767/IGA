// 文件名：UIDisplayManager.cs
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

/// <summary>
/// Clue description: basic text first; Analyzed/Full Read after Analyze click.
/// Scroll stays inside the original text rect — panel / Analyze layout unchanged.
/// </summary>
public class UIDisplayManager : MonoBehaviour
{
    [Header("UI 显示组件")]
    public Image targetImage;
    public TextMeshProUGUI targetText;

    [Header("可选")]
    public string defaultText = "Select an item";
    public Button analyzeButton;
    public KeyCode analyzeKey = KeyCode.R;

    private ItemData currentItem;
    /// <summary>0 = description only, 1 = +Analyzed, 2 = +Full Read</summary>
    private int revealLevel;
    /// <summary>Persisted reveal level per item so re-select does not reset Analyze.</summary>
    private readonly Dictionary<string, int> itemRevealLevels = new Dictionary<string, int>();

    private ScrollRect scrollRect;
    private RectTransform scrollRoot;
    private RectTransform scrollContent;
    private RectTransform viewportRT;
    private bool scrollReady;
    private bool analyzeBound;
    private int lastAnalyzeFrame = -1;

    private Vector2 slotAnchorMin;
    private Vector2 slotAnchorMax;
    private Vector2 slotPivot;
    private Vector2 slotPos;
    private Vector2 slotSize;
    private bool slotCached;

    void Start()
    {
        if (targetImage != null)
            targetImage.gameObject.SetActive(false);

        ResolveAnalyzeButton();
        BindAnalyzeButton();
        CacheTextSlot();

        if (targetText != null && string.IsNullOrEmpty(targetText.text))
            targetText.text = defaultText;

        RefreshAnalyzeButtonState();
    }

    void OnEnable()
    {
        ResolveAnalyzeButton();
        BindAnalyzeButton();

        if (targetText != null && targetText.gameObject.activeInHierarchy)
            EnsureScrollView();
    }

    void Update()
    {
        if (currentItem == null) return;
        if (Input.GetKeyDown(analyzeKey))
            Analyze();
    }

    public void CycleLayer()
    {
        Analyze();
    }

    public void Analyze()
    {
        // Inspector OnClick + runtime listener may both fire in one click
        if (Time.frameCount == lastAnalyzeFrame) return;
        lastAnalyzeFrame = Time.frameCount;

        if (currentItem == null)
        {
            Debug.LogWarning("[UIDisplayManager] Analyze ignored: no item selected.");
            return;
        }

        // Already analyzed — ignore further clicks
        if (itemRevealLevels.TryGetValue(ItemKey(currentItem), out int done) && done > 0)
            return;

        bool hasAnalyzed = !string.IsNullOrWhiteSpace(currentItem.analyzedText);
        bool hasFull = !string.IsNullOrWhiteSpace(currentItem.GetFullReadText());

        if (!hasAnalyzed && !hasFull)
        {
            Debug.LogWarning($"[UIDisplayManager] Item '{currentItem.itemName}' has no Analyzed/Read text.");
            return;
        }

        // One Analyze click reveals everything available, then stays locked
        if (hasFull) revealLevel = 2;
        else revealLevel = 1;

        // Persist so re-selecting this item keeps Analyzed state / disabled Analyze
        itemRevealLevels[ItemKey(currentItem)] = revealLevel;

        // Rebuild text with Analyzed section, then scroll so the new part is visible
        RefreshText(scrollToBottom: true);
        RefreshAnalyzeButtonState();

        // Unlock mind-map clue after a successful analyze
        if (!string.IsNullOrEmpty(currentItem.clueId))
            ClueProgress.Ensure().UnlockClue(currentItem.clueId);
    }

    public void DisplayItem(ItemData data)
    {
        if (data == null)
        {
            Debug.LogWarning("尝试显示空的ItemData！");
            return;
        }

        EnsureScrollView();
        BindAnalyzeButton();

        currentItem = data;
        revealLevel = itemRevealLevels.TryGetValue(ItemKey(data), out int saved) ? saved : 0;

        if (targetImage != null)
        {
            if (data.itemImage != null)
            {
                targetImage.sprite = data.itemImage;
                if (!targetImage.gameObject.activeSelf)
                    targetImage.gameObject.SetActive(true);
            }
            else
            {
                targetImage.sprite = null;
            }
        }

        RefreshText(scrollToTop: true);
        RefreshAnalyzeButtonState();
    }

    private static string ItemKey(ItemData data)
    {
        if (data == null) return string.Empty;
        if (!string.IsNullOrEmpty(data.clueId)) return data.clueId;
        if (!string.IsNullOrEmpty(data.itemName)) return data.itemName;
        return data.name;
    }

    public void DisplayTestimony(TestimonyData data)
    {
        if (data == null) return;

        EnsureScrollView();

        currentItem = null;
        revealLevel = 0;

        if (targetImage != null)
            targetImage.gameObject.SetActive(false);

        if (targetText != null)
        {
            targetText.text = $"<b>{data.title}</b>\n\n{data.body}";
            FitTextContentHeight();
            SetScroll(top: true);
        }

        RefreshAnalyzeButtonState();
    }

    public void ClearDisplay()
    {
        currentItem = null;
        revealLevel = 0;

        if (targetImage != null)
            targetImage.sprite = null;

        if (targetText != null)
            targetText.text = defaultText;

        FitTextContentHeight();
        SetScroll(top: true);
        RefreshAnalyzeButtonState();
    }

    private void RefreshText(bool scrollToTop = false, bool scrollToBottom = false)
    {
        if (targetText == null || currentItem == null) return;

        targetText.text = BuildText(currentItem, revealLevel);
        FitTextContentHeight();

        if (scrollToBottom) SetScroll(top: false);
        else if (scrollToTop) SetScroll(top: true);
    }

    private static string BuildText(ItemData data, int level)
    {
        var sb = new System.Text.StringBuilder();
        sb.Append($"<b>{data.itemName}</b>\n\n{data.description}");

        if (level >= 1 && !string.IsNullOrWhiteSpace(data.analyzedText))
            sb.Append($"\n\n<b>Analyzed:</b>\n{data.analyzedText}");

        if (level >= 2)
        {
            string full = data.GetFullReadText();
            if (!string.IsNullOrWhiteSpace(full))
                sb.Append($"\n\n<b>Read:</b>\n{full}");
        }

        return sb.ToString();
    }

    private void ResolveAnalyzeButton()
    {
        if (analyzeButton != null) return;

        Transform t = transform.Find("descriptionPanel/analyzeButton");
        if (t != null)
            analyzeButton = t.GetComponent<Button>();

        if (analyzeButton == null && targetText != null)
        {
            Transform panel = targetText.transform.parent;
            // text may already be under DescScroll/Viewport/Content
            while (panel != null && panel.name != "descriptionPanel")
                panel = panel.parent;
            if (panel != null)
            {
                Transform btn = panel.Find("analyzeButton");
                if (btn != null)
                    analyzeButton = btn.GetComponent<Button>();
            }
        }
    }

    private void BindAnalyzeButton()
    {
        ResolveAnalyzeButton();
        if (analyzeButton == null || analyzeBound) return;

        analyzeButton.onClick.AddListener(Analyze);
        analyzeBound = true;
    }

    private void RefreshAnalyzeButtonState()
    {
        if (analyzeButton == null) return;

        bool canAnalyze = false;
        if (currentItem != null)
        {
            // Already analyzed this session → permanently locked
            int saved = itemRevealLevels.TryGetValue(ItemKey(currentItem), out int lv) ? lv : revealLevel;
            if (saved <= 0)
            {
                bool hasAnalyzed = !string.IsNullOrWhiteSpace(currentItem.analyzedText);
                bool hasFull = !string.IsNullOrWhiteSpace(currentItem.GetFullReadText());
                canAnalyze = hasAnalyzed || hasFull;
            }
        }

        analyzeButton.interactable = canAnalyze;

        // Ensure the button can receive clicks above the scroll area
        if (canAnalyze)
            analyzeButton.transform.SetAsLastSibling();
    }

    private void CacheTextSlot()
    {
        if (slotCached || targetText == null) return;

        RectTransform textRT = targetText.rectTransform;
        slotAnchorMin = textRT.anchorMin;
        slotAnchorMax = textRT.anchorMax;
        slotPivot = textRT.pivot;
        slotPos = textRT.anchoredPosition;
        slotSize = textRT.sizeDelta;

        if (Mathf.Abs(slotSize.x) < 1f) slotSize.x = 232f;
        if (Mathf.Abs(slotSize.y) < 1f) slotSize.y = 64f;

        slotCached = true;
    }

    private void FitTextContentHeight()
    {
        if (targetText == null) return;

        RectTransform textRT = targetText.rectTransform;
        float width = slotCached ? Mathf.Abs(slotSize.x) : Mathf.Max(textRT.rect.width, 232f);
        if (width < 1f) width = 232f;

        textRT.SetSizeWithCurrentAnchors(RectTransform.Axis.Horizontal, width);
        targetText.ForceMeshUpdate(true);

        float h = Mathf.Max(targetText.preferredHeight + 2f, slotCached ? Mathf.Abs(slotSize.y) : 64f);
        textRT.SetSizeWithCurrentAnchors(RectTransform.Axis.Vertical, h);

        if (scrollContent != null)
        {
            scrollContent.SetSizeWithCurrentAnchors(RectTransform.Axis.Horizontal, width);
            scrollContent.SetSizeWithCurrentAnchors(RectTransform.Axis.Vertical, h);
        }

        Canvas.ForceUpdateCanvases();
    }

    private void SetScroll(bool top)
    {
        if (scrollRect == null) return;
        Canvas.ForceUpdateCanvases();
        scrollRect.verticalNormalizedPosition = top ? 1f : 0f;
    }

    private void EnsureScrollView()
    {
        if (targetText == null) return;
        if (scrollReady) return;

        CacheTextSlot();

        RectTransform textRT = targetText.rectTransform;
        RectTransform panel = textRT.parent as RectTransform;
        if (panel == null) return;

        if (textRT.parent != null && textRT.parent.name == "Content" &&
            textRT.parent.parent != null && textRT.parent.parent.name == "Viewport")
        {
            scrollContent = textRT.parent as RectTransform;
            viewportRT = scrollContent.parent as RectTransform;
            scrollRoot = viewportRT != null ? viewportRT.parent as RectTransform : null;
            scrollRect = scrollRoot != null ? scrollRoot.GetComponent<ScrollRect>() : null;
            ConfigureTmp(targetText);
            scrollReady = scrollRect != null;
            return;
        }

        // descriptionPanel is the parent before wrapping
        if (panel.name != "descriptionPanel")
        {
            // Already moved unexpectedly — climb to descriptionPanel
            Transform p = panel;
            while (p != null && p.name != "descriptionPanel")
                p = p.parent;
            if (p == null) return;
            panel = p as RectTransform;
        }

        int sibling = textRT.GetSiblingIndex();

        GameObject scrollGO = new GameObject("DescScroll", typeof(RectTransform));
        scrollGO.layer = panel.gameObject.layer;
        scrollRoot = scrollGO.GetComponent<RectTransform>();
        scrollRoot.SetParent(panel, false);
        scrollRoot.SetSiblingIndex(sibling);
        scrollRoot.anchorMin = slotAnchorMin;
        scrollRoot.anchorMax = slotAnchorMax;
        scrollRoot.pivot = slotPivot;
        scrollRoot.anchoredPosition = slotPos;
        scrollRoot.sizeDelta = slotSize;
        scrollRoot.localScale = Vector3.one;
        scrollRoot.localRotation = Quaternion.identity;

        scrollRect = scrollGO.AddComponent<ScrollRect>();
        scrollRect.horizontal = false;
        scrollRect.vertical = true;
        scrollRect.movementType = ScrollRect.MovementType.Clamped;
        scrollRect.scrollSensitivity = 25f;
        scrollRect.inertia = true;

        GameObject viewportGO = new GameObject("Viewport", typeof(RectTransform));
        viewportGO.layer = panel.gameObject.layer;
        viewportRT = viewportGO.GetComponent<RectTransform>();
        viewportRT.SetParent(scrollRoot, false);
        Stretch(viewportRT);
        viewportRT.localScale = Vector3.one;
        viewportGO.AddComponent<RectMask2D>();

        Image hit = viewportGO.AddComponent<Image>();
        hit.color = new Color(0f, 0f, 0f, 0f);
        hit.raycastTarget = true;

        GameObject contentGO = new GameObject("Content", typeof(RectTransform));
        contentGO.layer = panel.gameObject.layer;
        scrollContent = contentGO.GetComponent<RectTransform>();
        scrollContent.SetParent(viewportRT, false);
        scrollContent.anchorMin = new Vector2(0.5f, 1f);
        scrollContent.anchorMax = new Vector2(0.5f, 1f);
        scrollContent.pivot = new Vector2(0.5f, 1f);
        scrollContent.anchoredPosition = Vector2.zero;
        scrollContent.sizeDelta = new Vector2(Mathf.Abs(slotSize.x), Mathf.Abs(slotSize.y));
        scrollContent.localScale = Vector3.one;

        textRT.SetParent(scrollContent, false);
        textRT.anchorMin = new Vector2(0.5f, 1f);
        textRT.anchorMax = new Vector2(0.5f, 1f);
        textRT.pivot = new Vector2(0.5f, 1f);
        textRT.anchoredPosition = Vector2.zero;
        textRT.sizeDelta = new Vector2(Mathf.Abs(slotSize.x), Mathf.Abs(slotSize.y));
        textRT.localScale = Vector3.one;
        textRT.localRotation = Quaternion.identity;

        ConfigureTmp(targetText);

        scrollRect.viewport = viewportRT;
        scrollRect.content = scrollContent;

        if (analyzeButton != null)
            analyzeButton.transform.SetAsLastSibling();

        scrollReady = true;
        FitTextContentHeight();
    }

    private static void ConfigureTmp(TextMeshProUGUI tmp)
    {
        tmp.enableWordWrapping = true;
        tmp.overflowMode = TextOverflowModes.Overflow;
        tmp.raycastTarget = false;
        tmp.verticalAlignment = VerticalAlignmentOptions.Top;
        tmp.horizontalAlignment = HorizontalAlignmentOptions.Left;
        tmp.maxVisibleLines = int.MaxValue;
    }

    private static void Stretch(RectTransform rt)
    {
        rt.anchorMin = Vector2.zero;
        rt.anchorMax = Vector2.one;
        rt.pivot = new Vector2(0.5f, 0.5f);
        rt.offsetMin = Vector2.zero;
        rt.offsetMax = Vector2.zero;
    }
}

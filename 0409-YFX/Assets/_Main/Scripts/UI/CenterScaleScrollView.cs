using UnityEngine;
using UnityEngine.UI;
using TMPro;
using System.Collections.Generic;
using UnityEngine.EventSystems;

/// <summary>
/// Left info ScrollView: right-aligned cards + center scale + snap.
/// This is the original layout logic for sv-left — MindMapBoard only fills text.
/// </summary>
public class CenterScaleScrollView : MonoBehaviour, IBeginDragHandler, IEndDragHandler
{
    [Header("Scroll View 设置")]
    public ScrollRect scrollRect;
    public float scaleRange = 200f;
    public float minScale = 0.6f;
    public float maxScale = 1f;

    [Header("字体设置（TMP）")]
    public bool scaleFont = true;
    public float minFontSize = 18f;
    public float maxFontSize = 30f;

    [Header("吸附/停靠效果设置")]
    public float snapVelocityThreshold = 150f;
    public float snapLerpSpeed = 12f;
    [Tooltip("Already this close to center → stop snapping (kills jitter)")]
    public float snapStopDistance = 2f;

    private RectTransform viewport;
    private RectTransform content;
    private readonly List<RectTransform> items = new List<RectTransform>();
    private readonly List<TextMeshProUGUI> tmpTexts = new List<TextMeshProUGUI>();

    private bool isDragging;
    private bool layoutReady;

    void Awake()
    {
        if (scrollRect == null)
            scrollRect = GetComponent<ScrollRect>();
    }

    void Start()
    {
        if (scrollRect == null)
            scrollRect = GetComponent<ScrollRect>();
        if (scrollRect == null) return;

        viewport = scrollRect.viewport;
        content = scrollRect.content;

        SetupContentLayout();
        RefreshItems();
        layoutReady = true;
    }

    /// <summary>Call after MindMapBoard fills / clears a display card.</summary>
    public void RefreshItems()
    {
        if (scrollRect == null)
            scrollRect = GetComponent<ScrollRect>();
        if (scrollRect == null) return;

        content = scrollRect.content;
        viewport = scrollRect.viewport;
        if (content == null) return;

        items.Clear();
        tmpTexts.Clear();

        foreach (Transform child in content)
        {
            if (!child.gameObject.activeInHierarchy) continue;
            if (!child.name.StartsWith("display", System.StringComparison.OrdinalIgnoreCase) &&
                !child.name.StartsWith("display_", System.StringComparison.OrdinalIgnoreCase))
                continue;

            RectTransform rect = child as RectTransform;
            if (rect == null) continue;

            items.Add(rect);
            SetItemRightAlignment(rect);
            tmpTexts.Add(child.GetComponentInChildren<TextMeshProUGUI>(true));
        }
    }

    void SetupContentLayout()
    {
        if (content == null) return;

        content.anchorMin = new Vector2(0, 1);
        content.anchorMax = new Vector2(1, 1);
        content.pivot = new Vector2(0.5f, 1);
        content.anchoredPosition = Vector2.zero;

        ContentSizeFitter fitter = content.GetComponent<ContentSizeFitter>();
        if (fitter == null)
            fitter = content.gameObject.AddComponent<ContentSizeFitter>();
        fitter.horizontalFit = ContentSizeFitter.FitMode.Unconstrained;
        fitter.verticalFit = ContentSizeFitter.FitMode.PreferredSize;

        VerticalLayoutGroup layout = content.GetComponent<VerticalLayoutGroup>();
        if (layout == null)
            layout = content.gameObject.AddComponent<VerticalLayoutGroup>();
        layout.childAlignment = TextAnchor.UpperRight; // 右对齐
        layout.spacing = 50;
        layout.padding = new RectOffset(0, 20, 10, 10);
        layout.childControlWidth = false;
        layout.childControlHeight = false;
        layout.childForceExpandWidth = false;
        layout.childForceExpandHeight = false;
    }

    void SetItemRightAlignment(RectTransform item)
    {
        if (item == null) return;

        // Right edge of content, keep existing height
        item.anchorMin = new Vector2(1f, 1f);
        item.anchorMax = new Vector2(1f, 1f);
        item.pivot = new Vector2(1f, 0.5f);

        Vector2 size = item.sizeDelta;
        if (size.x < 50f) size.x = 277f;
        if (size.y < 50f) size.y = 150f;
        item.sizeDelta = size;

        // X = 0 means flush to right edge when pivot is right
        item.anchoredPosition = new Vector2(0f, item.anchoredPosition.y);
        item.localScale = Vector3.one;
    }

    void Update()
    {
        if (!layoutReady || items.Count == 0 || viewport == null || content == null || scrollRect == null)
            return;

        Vector3 viewportWorldCenter = viewport.TransformPoint(viewport.rect.center);

        for (int i = 0; i < items.Count; i++)
        {
            RectTransform item = items[i];
            if (item == null || !item.gameObject.activeInHierarchy) continue;

            Vector3 itemWorldCenter = item.TransformPoint(item.rect.center);
            float distance = Mathf.Abs(viewportWorldCenter.y - itemWorldCenter.y);

            float t = Mathf.Clamp01(distance / scaleRange);
            float scale = Mathf.Lerp(maxScale, minScale, t);
            item.localScale = new Vector3(scale, scale, 1f);

            if (scaleFont && i < tmpTexts.Count && tmpTexts[i] != null)
                tmpTexts[i].fontSize = Mathf.Lerp(maxFontSize, minFontSize, t);
        }

        // Snap only while coasting — stop when close enough (prevents permanent jitter)
        if (isDragging) return;
        if (Mathf.Abs(scrollRect.velocity.y) >= snapVelocityThreshold) return;

        RectTransform closestItem = null;
        float closestDistance = float.MaxValue;
        Vector3 closestItemWorldCenter = Vector3.zero;

        for (int i = 0; i < items.Count; i++)
        {
            RectTransform item = items[i];
            if (item == null || !item.gameObject.activeInHierarchy) continue;

            Vector3 itemWorldCenter = item.TransformPoint(item.rect.center);
            float distance = Mathf.Abs(viewportWorldCenter.y - itemWorldCenter.y);
            if (distance < closestDistance)
            {
                closestDistance = distance;
                closestItem = item;
                closestItemWorldCenter = itemWorldCenter;
            }
        }

        if (closestItem == null) return;

        if (closestDistance <= snapStopDistance)
        {
            scrollRect.velocity = Vector2.zero;
            return;
        }

        float worldOffsetY = viewportWorldCenter.y - closestItemWorldCenter.y;
        Vector2 target = new Vector2(
            content.anchoredPosition.x,
            content.anchoredPosition.y + worldOffsetY);

        content.anchoredPosition = Vector2.Lerp(
            content.anchoredPosition,
            target,
            Mathf.Clamp01(snapLerpSpeed * Time.deltaTime));

        scrollRect.velocity = Vector2.Lerp(
            scrollRect.velocity,
            Vector2.zero,
            Mathf.Clamp01(snapLerpSpeed * Time.deltaTime * 1.5f));
    }

    public void OnBeginDrag(PointerEventData eventData) => isDragging = true;
    public void OnEndDrag(PointerEventData eventData) => isDragging = false;
}

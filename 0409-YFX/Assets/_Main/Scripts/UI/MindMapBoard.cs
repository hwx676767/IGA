using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Mind map board: unlock clues → spawn connectable nodes → connect →
/// fill inference text into the existing left sv-left display cards
/// (layout owned by CenterScaleScrollView — do not move those cards).
/// </summary>
public class MindMapBoard : MonoBehaviour
{
    [System.Serializable]
    public class ClueDef
    {
        public string clueId;
        public string label;
        public Sprite icon;
    }

    [Header("Panels")]
    public Transform unlockListContent;
    public Transform nodeContent;
    public GameObject unlockCardTemplate;
    public ConnectableUI nodeTemplate;

    [Header("Logic")]
    public InferenceManager inferenceManager;
    public InferenceRule[] allRules;
    public ClueDef[] clueCatalog;

    [Header("Node layout")]
    public Vector2 nodeStart = new Vector2(-275f, 243f);
    public Vector2 nodeSpacing = new Vector2(110f, -110f);
    public int nodeColumns = 3;

    [Header("Unlock card layout (unused — left panel uses scene layout)")]
    public Vector2 cardStart = new Vector2(165f, -78f);
    public float cardSpacingY = -160f;
    public float cardHeight = 149.58f;

    [Header("Debug")]
    public InferenceRule[] debugOnlyRules;

    private readonly Dictionary<string, ConnectableUI> nodes = new Dictionary<string, ConnectableUI>();
    private readonly Dictionary<string, GameObject> unlockCards = new Dictionary<string, GameObject>();
    private readonly List<GameObject> displaySlots = new List<GameObject>();
    private TMP_FontAsset labelFont;
    private bool ready;
    private CenterScaleScrollView leftScrollFx;

    void Awake()
    {
        EnsureProgress();
        if (inferenceManager == null)
            inferenceManager = GetComponent<InferenceManager>();

        if (inferenceManager != null && allRules != null && allRules.Length > 0)
            inferenceManager.rules = allRules;
    }

    void OnEnable()
    {
        EnsureProgress();
        ClueProgress.OnClueUnlocked += HandleClueUnlocked;
        ClueProgress.OnInferenceUnlocked += HandleInferenceUnlocked;
        PrepareBoard();
        RefreshFromProgress();
    }

    void OnDisable()
    {
        ClueProgress.OnClueUnlocked -= HandleClueUnlocked;
        ClueProgress.OnInferenceUnlocked -= HandleInferenceUnlocked;
    }

    private static void EnsureProgress()
    {
        ClueProgress.Ensure();
    }

    private void PrepareBoard()
    {
        if (ready) return;

        if (unlockCardTemplate != null)
        {
            var tmp = unlockCardTemplate.GetComponentInChildren<TextMeshProUGUI>(true);
            if (tmp != null) labelFont = tmp.font;
        }

        if (nodeTemplate != null)
            nodeTemplate.gameObject.SetActive(false);

        HideOtherChildren(nodeContent, nodeTemplate != null ? nodeTemplate.transform : null);

        // Collect artist display cards only — never move / destroy layout components
        CollectDisplaySlots();

        if (unlockListContent != null)
            leftScrollFx = unlockListContent.GetComponentInParent<CenterScaleScrollView>();

        if (inferenceManager != null && allRules != null && allRules.Length > 0)
            inferenceManager.rules = allRules;

        ready = true;
    }

    private void CollectDisplaySlots()
    {
        displaySlots.Clear();
        if (unlockListContent == null) return;

        for (int i = 0; i < unlockListContent.childCount; i++)
        {
            Transform child = unlockListContent.GetChild(i);
            if (!child.name.StartsWith("display", System.StringComparison.OrdinalIgnoreCase))
                continue;
            displaySlots.Add(child.gameObject);
        }

        // Stable top→bottom by sibling order (scene order)
        Debug.Log($"[MindMapBoard] Using {displaySlots.Count} existing display slots (no layout changes).");
    }

    private void HideOtherChildren(Transform parent, Transform keep)
    {
        if (parent == null) return;
        for (int i = 0; i < parent.childCount; i++)
        {
            Transform child = parent.GetChild(i);
            if (keep != null && child == keep)
            {
                child.gameObject.SetActive(false);
                continue;
            }
            // Hide spawn leftovers + old rectangular placeholder Images in sv-right
            if (child.name.StartsWith("Node_") || child.name.StartsWith("Line_") ||
                child.name == "TempLine" || child.name.StartsWith("Image"))
                child.gameObject.SetActive(false);
        }
    }

    private void RefreshFromProgress()
    {
        if (ClueProgress.Instance == null) return;

        foreach (var id in ClueProgress.Instance.GetUnlockedClues())
            SpawnNode(id);

        RefreshUnlockCardsFromProgress();
    }

    private void HandleClueUnlocked(string clueId) => SpawnNode(clueId);
    private void HandleInferenceUnlocked(InferenceRule rule) => SpawnUnlockCard(rule);

    public ClueDef FindClueDef(string clueId)
    {
        if (clueCatalog == null) return null;
        foreach (var c in clueCatalog)
        {
            if (c != null && c.clueId == clueId)
                return c;
        }
        return null;
    }

    private void SpawnNode(string clueId)
    {
        if (string.IsNullOrEmpty(clueId) || nodeContent == null || nodeTemplate == null)
            return;
        if (nodes.ContainsKey(clueId)) return;

        PrepareBoard();

        ClueDef def = FindClueDef(clueId);
        string label = def != null && !string.IsNullOrEmpty(def.label) ? def.label : clueId;

        GameObject go = Instantiate(nodeTemplate.gameObject, nodeContent);
        go.name = "Node_" + clueId;
        go.SetActive(true);

        ConnectableUI node = go.GetComponent<ConnectableUI>();
        if (node == null) node = go.AddComponent<ConnectableUI>();
        node.clueId = clueId;

        Image img = go.GetComponent<Image>();
        Sprite iconSprite = (def != null && def.icon != null) ? def.icon : (img != null ? img.sprite : null);

        // analyzePanel mind-map nodes only: crop rectangular clue art into a circle
        ApplyCircularClueMask(go, iconSprite);

        RectTransform rt = go.GetComponent<RectTransform>();
        int index = nodes.Count;
        int col = index % nodeColumns;
        int row = index / nodeColumns;
        rt.anchorMin = rt.anchorMax = new Vector2(0.5f, 0.5f);
        rt.pivot = new Vector2(0.5f, 0.5f);
        rt.sizeDelta = nodeTemplate.GetComponent<RectTransform>().sizeDelta;
        rt.anchoredPosition = nodeStart + new Vector2(col * nodeSpacing.x, row * nodeSpacing.y);

        EnsureNodeLabel(go.transform, label);

        nodes[clueId] = node;
        ExpandNodeContent(row);
    }

    /// <summary>
    /// Only for spawned mind-map clue nodes in analyzePanel.
    /// Does not change CluePanel / ClueDisplay / other rectangular item images.
    /// Label stays outside the mask so it is not clipped.
    /// </summary>
    private static void ApplyCircularClueMask(GameObject nodeGo, Sprite clueSprite)
    {
        if (nodeGo == null) return;

        // Root Image = invisible hit target for ConnectableUI (label must not be under Mask)
        var rootImg = nodeGo.GetComponent<Image>();
        if (rootImg == null)
            rootImg = nodeGo.AddComponent<Image>();
        rootImg.sprite = GetOrCreateCircleSprite();
        rootImg.color = new Color(1f, 1f, 1f, 0f);
        rootImg.raycastTarget = true;

        Transform maskT = nodeGo.transform.Find("CircleMask");
        GameObject maskGo;
        if (maskT == null)
        {
            maskGo = new GameObject("CircleMask", typeof(RectTransform), typeof(CanvasRenderer), typeof(Image), typeof(Mask));
            maskGo.transform.SetParent(nodeGo.transform, false);
            maskGo.transform.SetAsFirstSibling();
        }
        else maskGo = maskT.gameObject;

        var maskRt = maskGo.GetComponent<RectTransform>();
        maskRt.anchorMin = Vector2.zero;
        maskRt.anchorMax = Vector2.one;
        maskRt.offsetMin = Vector2.zero;
        maskRt.offsetMax = Vector2.zero;

        var maskImg = maskGo.GetComponent<Image>();
        maskImg.sprite = GetOrCreateCircleSprite();
        maskImg.color = Color.white;
        maskImg.type = Image.Type.Simple;
        maskImg.preserveAspect = true;
        maskImg.raycastTarget = false;

        var mask = maskGo.GetComponent<Mask>();
        mask.showMaskGraphic = false;

        Transform iconT = maskGo.transform.Find("ClueIcon");
        Image icon;
        if (iconT == null)
        {
            var iconGo = new GameObject("ClueIcon", typeof(RectTransform), typeof(CanvasRenderer), typeof(Image));
            iconGo.transform.SetParent(maskGo.transform, false);
            var irt = iconGo.GetComponent<RectTransform>();
            irt.anchorMin = Vector2.zero;
            irt.anchorMax = Vector2.one;
            irt.offsetMin = Vector2.zero;
            irt.offsetMax = Vector2.zero;
            icon = iconGo.GetComponent<Image>();
        }
        else
        {
            icon = iconT.GetComponent<Image>();
            if (icon == null)
                icon = iconT.gameObject.AddComponent<Image>();
        }

        icon.sprite = clueSprite;
        icon.color = Color.white;
        // Fill square; Mask crops to circle
        icon.preserveAspect = false;
        icon.type = Image.Type.Simple;
        icon.raycastTarget = false;
        icon.maskable = true;
    }

    private static Sprite s_circleSprite;

    private static Sprite GetOrCreateCircleSprite()
    {
        if (s_circleSprite != null) return s_circleSprite;

        const int size = 128;
        var tex = new Texture2D(size, size, TextureFormat.RGBA32, false);
        tex.wrapMode = TextureWrapMode.Clamp;
        tex.filterMode = FilterMode.Bilinear;
        float r = size * 0.5f;
        float r2 = (r - 0.5f) * (r - 0.5f);
        for (int y = 0; y < size; y++)
        {
            for (int x = 0; x < size; x++)
            {
                float dx = x + 0.5f - r;
                float dy = y + 0.5f - r;
                tex.SetPixel(x, y, (dx * dx + dy * dy) <= r2 ? Color.white : Color.clear);
            }
        }
        tex.Apply(false, true);
        s_circleSprite = Sprite.Create(tex, new Rect(0, 0, size, size), new Vector2(0.5f, 0.5f), 100f);
        s_circleSprite.name = "MindMapCircleMask";
        return s_circleSprite;
    }

    private void EnsureNodeLabel(Transform node, string label)
    {
        Transform existing = node.Find("NodeLabel");
        TextMeshProUGUI tmp;
        if (existing == null)
        {
            GameObject labelGo = new GameObject("NodeLabel", typeof(RectTransform));
            labelGo.transform.SetParent(node, false);
            RectTransform lrt = labelGo.GetComponent<RectTransform>();
            lrt.anchorMin = new Vector2(0f, 0f);
            lrt.anchorMax = new Vector2(1f, 0f);
            lrt.pivot = new Vector2(0.5f, 1f);
            lrt.anchoredPosition = new Vector2(0f, -2f);
            lrt.sizeDelta = new Vector2(0f, 28f);
            tmp = labelGo.AddComponent<TextMeshProUGUI>();
            if (labelFont != null) tmp.font = labelFont;
            tmp.fontSize = 11f;
            tmp.alignment = TextAlignmentOptions.Top;
            tmp.color = new Color(0.54f, 0.70f, 0.65f, 1f);
            tmp.enableWordWrapping = true;
            tmp.raycastTarget = false;
        }
        else
        {
            tmp = existing.GetComponent<TextMeshProUGUI>();
        }

        if (tmp != null)
            tmp.text = label;
    }

    private void ExpandNodeContent(int lastRow)
    {
        RectTransform content = nodeContent as RectTransform;
        if (content == null) return;
        float need = Mathf.Abs(nodeStart.y) + (lastRow + 2) * Mathf.Abs(nodeSpacing.y) + 100f;
        if (content.sizeDelta.y < need)
            content.SetSizeWithCurrentAnchors(RectTransform.Axis.Vertical, need);
    }

    /// <summary>
    /// Only writes text into the next free scene display card.
    /// Layout / right-align / scale = CenterScaleScrollView (your previous logic).
    /// </summary>
    private void SpawnUnlockCard(InferenceRule rule)
    {
        if (rule == null || unlockListContent == null)
        {
            Debug.LogWarning("[MindMapBoard] SpawnUnlockCard missing unlockListContent.");
            return;
        }

        string key = string.IsNullOrEmpty(rule.inferenceId) ? rule.name : rule.inferenceId;
        if (unlockCards.ContainsKey(key)) return;

        PrepareBoard();

        GameObject card = null;
        foreach (var slot in displaySlots)
        {
            if (slot == null) continue;
            if (unlockCards.ContainsValue(slot)) continue;
            card = slot;
            break;
        }

        if (card == null)
        {
            Debug.LogWarning("[MindMapBoard] No free display slot under sv-left Content.");
            return;
        }

        TextMeshProUGUI tmp = card.GetComponentInChildren<TextMeshProUGUI>(true);
        if (tmp != null)
        {
            if (labelFont != null) tmp.font = labelFont;
            tmp.enableWordWrapping = true;
            tmp.overflowMode = TextOverflowModes.Overflow;
            tmp.text = $"<b>{rule.title}</b>\n{rule.resultBody}";
        }

        if (!card.activeSelf)
            card.SetActive(true);

        unlockCards[key] = card;

        if (leftScrollFx != null)
            leftScrollFx.RefreshItems();

        Debug.Log($"[MindMapBoard] Filled '{card.name}' with: {rule.title}");
    }

    public void RefreshUnlockCardsFromProgress()
    {
        if (ClueProgress.Instance == null || allRules == null) return;
        foreach (var rule in allRules)
        {
            if (rule == null) continue;
            string key = string.IsNullOrEmpty(rule.inferenceId) ? rule.name : rule.inferenceId;
            if (ClueProgress.Instance.HasInference(key))
                SpawnUnlockCard(rule);
        }
    }

    private void ClearUnlockTexts()
    {
        foreach (var kv in unlockCards)
        {
            if (kv.Value == null) continue;
            var tmp = kv.Value.GetComponentInChildren<TextMeshProUGUI>(true);
            if (tmp != null) tmp.text = string.Empty;
        }
        unlockCards.Clear();

        if (leftScrollFx != null)
            leftScrollFx.RefreshItems();
    }

    [ContextMenu("Debug/Generate Linked Mind Map")]
    public void DebugGenerateLinked()
    {
        if (!Application.isPlaying)
        {
            Debug.LogWarning("[MindMapBoard] Enter Play Mode, then click Generate.");
            return;
        }

        EnsureProgress();
        PrepareBoard();

        if (inferenceManager != null && allRules != null && allRules.Length > 0)
            inferenceManager.rules = allRules;

        InferenceRule[] rules = (debugOnlyRules != null && debugOnlyRules.Length > 0)
            ? debugOnlyRules
            : allRules;

        if (rules == null || rules.Length == 0)
        {
            Debug.LogWarning("[MindMapBoard] No InferenceRules assigned.");
            return;
        }

        foreach (var rule in rules)
        {
            if (rule == null || rule.requiredClueIds == null) continue;
            foreach (var id in rule.requiredClueIds)
            {
                if (string.IsNullOrEmpty(id)) continue;
                ClueProgress.Ensure().UnlockClue(id);
                SpawnNode(id);
            }
        }

        int linkCount = 0;
        foreach (var rule in rules)
        {
            if (rule == null || rule.requiredClueIds == null) continue;
            ConnectableUI prev = null;
            foreach (var id in rule.requiredClueIds)
            {
                if (string.IsNullOrEmpty(id)) continue;
                if (!nodes.TryGetValue(id, out var node) || node == null) continue;
                if (prev != null && prev.ForceConnect(node))
                    linkCount++;
                prev = node;
            }
        }

        if (inferenceManager != null)
            inferenceManager.EvaluateConnections();

        RefreshUnlockCardsFromProgress();

        Debug.Log($"[MindMapBoard] Generate done. nodes={nodes.Count} links={linkCount} cards={unlockCards.Count}");
    }

    [ContextMenu("Debug/Reset Mind Map")]
    public void DebugReset()
    {
        if (!Application.isPlaying)
        {
            Debug.LogWarning("[MindMapBoard] Enter Play Mode, then click Reset.");
            return;
        }

        PrepareBoard();

        foreach (var kv in nodes)
        {
            if (kv.Value != null)
                kv.Value.ClearConnections();
        }

        foreach (var kv in nodes)
        {
            if (kv.Value != null)
                Destroy(kv.Value.gameObject);
        }
        nodes.Clear();

        ClearUnlockTexts();

        if (nodeContent != null)
        {
            for (int i = nodeContent.childCount - 1; i >= 0; i--)
            {
                Transform child = nodeContent.GetChild(i);
                if (nodeTemplate != null && child == nodeTemplate.transform) continue;
                if (child.name.StartsWith("Line_") || child.name.StartsWith("Node_") || child.name == "TempLine")
                    Destroy(child.gameObject);
            }
        }

        ClueProgress.Ensure().ClearAll();
        if (inferenceManager != null)
            inferenceManager.ClearUnlockedCache();

        Debug.Log("[MindMapBoard] Reset done.");
    }
}

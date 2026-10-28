using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Fills CluePanel Objects / Photos / Testimony tabs from content assets.
/// Supports discovery: explore pickups call DiscoverItem to add object buttons at runtime.
/// </summary>
public class CluePanelBootstrap : MonoBehaviour
{
    [Header("Template & Contents")]
    public GameObject itemButtonPrefab;
    public Transform objectsContent;
    public Transform photosContent;
    public Transform testimonyContent;

    [Header("Content (English)")]
    [Tooltip("Shown immediately at start (items already on the player).")]
    public ItemData[] objectItems;
    [Tooltip("If set, ONLY these objects appear at start. Explore finds the rest from objectItems.")]
    public ItemData[] startingObjectItems;
    public ItemData[] photoItems;
    public TestimonyData[] testimonies;

    [Header("Discovery")]
    [Tooltip("If true and startingObjectItems is set, other objectItems stay hidden until ExploreInteractable finds them.")]
    public bool discoveryMode = true;

    [Header("Layout")]
    public Vector2 cellSize = new Vector2(100f, 100f);
    public Vector2 spacing = new Vector2(20f, 20f);
    public int columns = 4;
    public bool hidePlaceholderChildren = true;

    [Header("Debug UI")]
    [Tooltip("Creates an on-screen Reveal All button (like Map Inspector Generate).")]
    public bool createDebugRevealButton = true;
    public Button debugRevealButton;

    private int nextObjectSlot;
    private bool bootstrapped;
    private readonly System.Collections.Generic.List<ItemData> pendingDiscoveries =
        new System.Collections.Generic.List<ItemData>();

    void Start()
    {
        BootstrapIfNeeded();
        EnsureDebugRevealButton();
    }

    private void BootstrapIfNeeded()
    {
        if (bootstrapped) return;

        if (itemButtonPrefab == null)
        {
            Debug.LogError("[CluePanelBootstrap] itemButtonPrefab is missing.");
            return;
        }

        PrepareContent(objectsContent);
        PrepareContent(photosContent);
        PrepareContent(testimonyContent);

        ItemData[] initial = GetStartingObjects();
        nextObjectSlot = 0;
        PopulateItems(objectsContent, initial, ref nextObjectSlot);

        // Photos: only pre-fill when discovery is off (explore finds Brochure / News / Album)
        if (!discoveryMode)
        {
            int photoSlot = 0;
            PopulateItems(photosContent, photoItems, ref photoSlot);
        }

        PopulateTestimonies(testimonyContent, testimonies);
        bootstrapped = true;

        // Re-apply pickups collected while CluePanel was still closed/inactive
        for (int i = 0; i < pendingDiscoveries.Count; i++)
            DiscoverItem(pendingDiscoveries[i]);
        pendingDiscoveries.Clear();
    }

    private void EnsureDebugRevealButton()
    {
        if (!createDebugRevealButton) return;
        if (debugRevealButton != null)
        {
            debugRevealButton.onClick.RemoveListener(DebugRevealAll);
            debugRevealButton.onClick.AddListener(DebugRevealAll);
            return;
        }

        // Prefer this CluePanel (even if inactive — GameObject.Find skips inactive)
        Transform root = transform;
        if (root.name != "CluePanel")
        {
            var p = transform;
            while (p != null)
            {
                if (p.name == "CluePanel") { root = p; break; }
                p = p.parent;
            }
        }

        var existing = root.Find("DebugRevealAllButton");
        if (existing != null)
        {
            debugRevealButton = existing.GetComponent<Button>();
            if (debugRevealButton != null)
            {
                debugRevealButton.onClick.RemoveListener(DebugRevealAll);
                debugRevealButton.onClick.AddListener(DebugRevealAll);
            }
            return;
        }

        var go = new GameObject("DebugRevealAllButton", typeof(RectTransform), typeof(CanvasRenderer), typeof(Image), typeof(Button));
        go.transform.SetParent(root, false);
        var rt = go.GetComponent<RectTransform>();
        rt.anchorMin = new Vector2(1f, 1f);
        rt.anchorMax = new Vector2(1f, 1f);
        rt.pivot = new Vector2(1f, 1f);
        rt.sizeDelta = new Vector2(160f, 36f);
        rt.anchoredPosition = new Vector2(-12f, -12f);

        var img = go.GetComponent<Image>();
        img.color = new Color(0.2f, 0.55f, 0.35f, 0.92f);

        var labelGo = new GameObject("Label", typeof(RectTransform));
        labelGo.transform.SetParent(go.transform, false);
        var lrt = labelGo.GetComponent<RectTransform>();
        lrt.anchorMin = Vector2.zero;
        lrt.anchorMax = Vector2.one;
        lrt.offsetMin = Vector2.zero;
        lrt.offsetMax = Vector2.zero;
        var txt = labelGo.AddComponent<Text>();
        txt.text = "Reveal All";
        txt.alignment = TextAnchor.MiddleCenter;
        txt.color = Color.white;
        txt.fontSize = 16;
        txt.raycastTarget = false;
        var builtin = Resources.GetBuiltinResource<Font>("Arial.ttf");
        if (builtin != null)
            txt.font = builtin;

        debugRevealButton = go.GetComponent<Button>();
        debugRevealButton.targetGraphic = img;
        debugRevealButton.onClick.AddListener(DebugRevealAll);
    }

    /// <summary>
    /// Debug: unlock every object + photo into CluePanel (skip exploration).
    /// Same role as Map "Generate Linked".
    /// </summary>
    [ContextMenu("Debug/Reveal All Clues")]
    public void DebugRevealAll()
    {
        if (!Application.isPlaying)
        {
            Debug.LogWarning("[CluePanel] Enter Play Mode to reveal all.");
            return;
        }

        // CluePanel starts inactive — force bootstrap so discoveries apply immediately
        if (!gameObject.activeSelf)
            gameObject.SetActive(true);
        BootstrapIfNeeded();

        if (objectItems != null)
        {
            foreach (var item in objectItems)
            {
                if (item == null) continue;
                DiscoverItem(item);
                if (!string.IsNullOrEmpty(item.clueId))
                    ClueProgress.Ensure().UnlockClue(item.clueId);
            }
        }

        if (photoItems != null)
        {
            foreach (var item in photoItems)
            {
                if (item == null) continue;
                DiscoverItem(item);
                if (!string.IsNullOrEmpty(item.clueId))
                    ClueProgress.Ensure().UnlockClue(item.clueId);
            }
        }

        Debug.Log("[CluePanel] Debug reveal all — objects + photos unlocked.");
    }

    private ItemData[] GetStartingObjects()
    {
        if (discoveryMode && startingObjectItems != null && startingObjectItems.Length > 0)
            return startingObjectItems;
        return objectItems;
    }

    /// <summary>Called by ExploreInteractable when the player finds an item in the world.</summary>
    public void DiscoverItem(ItemData data)
    {
        if (data == null || itemButtonPrefab == null)
            return;

        // Allow discoveries even before CluePanel was opened
        if (!bootstrapped && gameObject.activeInHierarchy)
            BootstrapIfNeeded();

        if (!bootstrapped)
        {
            if (!pendingDiscoveries.Contains(data))
                pendingDiscoveries.Add(data);
            Debug.Log($"[CluePanel] Queued discovery (panel not open yet): {data.itemName}");
            return;
        }

        bool isPhoto = IsInList(photoItems, data);
        Transform content = isPhoto ? photosContent : objectsContent;
        if (content == null) return;

        // Already have a button for this item?
        for (int i = 0; i < content.childCount; i++)
        {
            var btn = content.GetChild(i).GetComponent<ItemButton>();
            if (btn != null && btn.itemData == data && btn.gameObject.activeSelf)
                return;
        }

        int slot = CountActiveItemButtons(content);
        SpawnItemButton(content, data, slot);
        if (!isPhoto)
            nextObjectSlot = Mathf.Max(nextObjectSlot, slot + 1);

        Debug.Log($"[CluePanel] Discovered {(isPhoto ? "photo" : "item")}: {data.itemName}");
    }

    private static bool IsInList(ItemData[] list, ItemData data)
    {
        if (list == null || data == null) return false;
        foreach (var it in list)
            if (it == data) return true;
        return false;
    }

    private static int CountActiveItemButtons(Transform content)
    {
        int n = 0;
        for (int i = 0; i < content.childCount; i++)
        {
            var child = content.GetChild(i);
            if (!child.gameObject.activeSelf) continue;
            if (child.GetComponent<ItemButton>() != null) n++;
        }
        return n;
    }

    private void PopulateItems(Transform content, ItemData[] items, ref int slotCounter)
    {
        if (content == null || items == null) return;

        for (int i = 0; i < items.Length; i++)
        {
            ItemData data = items[i];
            if (data == null) continue;
            SpawnItemButton(content, data, slotCounter);
            slotCounter++;
        }
    }

    private void SpawnItemButton(Transform content, ItemData data, int slotIndex)
    {
        GameObject go = Instantiate(itemButtonPrefab, content);
        go.name = "Item_" + data.itemName;
        go.SetActive(true);

        RectTransform rt = go.GetComponent<RectTransform>();
        if (rt != null)
            rt.anchoredPosition = GetSlotPosition(slotIndex);

        Image img = go.GetComponent<Image>();
        if (img != null && data.itemImage != null)
            img.sprite = data.itemImage;

        ItemButton itemBtn = go.GetComponent<ItemButton>();
        if (itemBtn == null)
            itemBtn = go.AddComponent<ItemButton>();
        itemBtn.enabled = true;
        itemBtn.Setup(data);

        Button btn = go.GetComponent<Button>();
        if (btn == null)
            btn = go.AddComponent<Button>();
        btn.enabled = true;
        if (img != null)
            btn.targetGraphic = img;
    }

    private void PopulateTestimonies(Transform content, TestimonyData[] list)
    {
        if (content == null || list == null) return;

        for (int i = 0; i < list.Length; i++)
        {
            TestimonyData data = list[i];
            if (data == null) continue;

            GameObject go = Instantiate(itemButtonPrefab, content);
            go.name = "Testimony_" + data.title;
            go.SetActive(true);

            RectTransform rt = go.GetComponent<RectTransform>();
            if (rt != null)
                rt.anchoredPosition = GetSlotPosition(i);

            Image img = go.GetComponent<Image>();

            ItemButton old = go.GetComponent<ItemButton>();
            if (old != null)
                old.enabled = false;

            Button btn = go.GetComponent<Button>();
            if (btn == null)
                btn = go.AddComponent<Button>();
            btn.enabled = true;
            if (img != null)
                btn.targetGraphic = img;

            TestimonyButton tBtn = go.GetComponent<TestimonyButton>();
            if (tBtn == null)
                tBtn = go.AddComponent<TestimonyButton>();
            tBtn.Setup(data);
        }
    }

    private void PrepareContent(Transform content)
    {
        if (content == null || !hidePlaceholderChildren) return;

        for (int i = 0; i < content.childCount; i++)
        {
            Transform child = content.GetChild(i);
            if (itemButtonPrefab != null && child.gameObject == itemButtonPrefab)
            {
                child.gameObject.SetActive(false);
                continue;
            }
            child.gameObject.SetActive(false);
        }
    }

    private Vector2 GetSlotPosition(int index)
    {
        int col = index % columns;
        int row = index / columns;
        float x = 65f + col * (cellSize.x + spacing.x);
        float y = -65f - row * (cellSize.y + spacing.y);
        return new Vector2(x, y);
    }
}

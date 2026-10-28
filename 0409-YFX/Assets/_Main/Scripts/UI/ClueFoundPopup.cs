using TMPro;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// On pickup: activate UI-Canvas/ClueDisplay and fill name / intro / image.
/// Stays open until right-click. Never uses HintPanel.
/// </summary>
public class ClueFoundPopup : MonoBehaviour
{
    public static ClueFoundPopup Instance { get; private set; }

    [Header("Existing scene UI")]
    [Tooltip("Must be ClueDisplay under UI-Canvas.")]
    public GameObject panel;
    public TextMeshProUGUI titleText;
    public TextMeshProUGUI descriptionText;
    public Image itemImage;

    [Header("Style")]
    public Color titleColor = Color.white;
    public Color descriptionColor = new Color(0.541f, 0.698f, 0.647f, 1f);

    [Header("Close")]
    public KeyCode dismissKey = KeyCode.Mouse1;

    private bool isShowing;
    private GameObject mainPanel;
    private bool mainPanelWasActive;

    // Legacy serialized fields (ignored)
    public GameObject blinkObject;
    public Text titleTextLegacy;
    public Image cardFrame;
    public Image photoFrame;
    public float blinkInterval;
    public int blinkTimes;
    public float displayDuration;
    public KeyCode dismissKeyAlt;

    void Awake()
    {
        if (gameObject.name == "DialogueManager" || GetComponent<DialogueManager>() != null)
        {
            var canvas = FindUiCanvas();
            if (canvas != null && canvas != gameObject)
            {
                var moved = canvas.GetComponent<ClueFoundPopup>();
                if (moved == null)
                    moved = canvas.AddComponent<ClueFoundPopup>();
                Instance = moved;
                Destroy(this);
                return;
            }
        }

        Instance = this;
        BindClueDisplay();
        ForceHintPanelOff();
        if (panel != null && panel.activeSelf)
            panel.SetActive(false);
        isShowing = false;
    }

    void OnDestroy()
    {
        if (Instance == this)
            Instance = null;
    }

    void Update()
    {
        if (!isShowing) return;
        if (panel == null || !panel.activeSelf)
        {
            if (isShowing)
                RestoreMainPanel();
            isShowing = false;
            return;
        }

        if (Input.GetMouseButtonDown(1) || Input.GetKeyDown(dismissKey))
            Hide();
    }

    public static ClueFoundPopup Ensure()
    {
        var canvas = FindUiCanvas();
        if (canvas == null)
        {
            Debug.LogError("[ClueFoundPopup] UI-Canvas not found.");
            return null;
        }

        foreach (var stray in FindObjectsOfType<ClueFoundPopup>(true))
        {
            if (stray == null) continue;
            if (stray.gameObject == canvas) continue;
            if (Instance == stray)
                Instance = null;
            Destroy(stray);
        }

        CleanupGeneratedClueCards();

        var popup = canvas.GetComponent<ClueFoundPopup>();
        if (popup == null)
            popup = canvas.AddComponent<ClueFoundPopup>();

        Instance = popup;
        popup.BindClueDisplay();
        return popup;
    }

    private static void CleanupGeneratedClueCards()
    {
        foreach (var t in Resources.FindObjectsOfTypeAll<Transform>())
        {
            if (t == null || t.name != "ClueCard") continue;
            if (!t.gameObject.scene.IsValid()) continue;
            Destroy(t.gameObject);
        }
    }

    private static GameObject FindNamed(string objectName)
    {
        foreach (var t in Resources.FindObjectsOfTypeAll<Transform>())
        {
            if (t == null || t.name != objectName) continue;
            if (!t.gameObject.scene.IsValid()) continue;
            return t.gameObject;
        }
        return GameObject.Find(objectName);
    }

    private static GameObject FindUiCanvas() => FindNamed("UI-Canvas");
    private static GameObject FindClueDisplay() => FindNamed("ClueDisplay");

    private GameObject GetMainPanel()
    {
        if (mainPanel == null)
            mainPanel = FindNamed("mainPanel");
        return mainPanel;
    }

    private void HideMainPanel()
    {
        var mp = GetMainPanel();
        if (mp == null) return;
        mainPanelWasActive = mp.activeSelf;
        if (mp.activeSelf)
            mp.SetActive(false);
    }

    private void RestoreMainPanel()
    {
        var mp = GetMainPanel();
        if (mp == null) return;
        if (mainPanelWasActive)
            mp.SetActive(true);
        mainPanelWasActive = false;
    }

    private static void ForceHintPanelOff()
    {
        var hint = FindNamed("HintPanel");
        if (hint != null && hint.activeSelf)
            hint.SetActive(false);
    }

    /// <summary>Always bind to ClueDisplay — ignore any wrong panel assignment (e.g. HintPanel).</summary>
    public void BindClueDisplay()
    {
        var display = FindClueDisplay();
        if (display == null)
        {
            Debug.LogError("[ClueFoundPopup] ClueDisplay not found under UI-Canvas.");
            panel = null;
            return;
        }

        // Reject HintPanel / anything that is not ClueDisplay
        if (panel != display)
            panel = display;

        titleText = null;
        descriptionText = null;
        itemImage = null;

        var nameT = panel.transform.Find("name-text");
        if (nameT != null)
            titleText = nameT.GetComponent<TextMeshProUGUI>();

        var introT = panel.transform.Find("introduce-text");
        if (introT != null)
            descriptionText = introT.GetComponent<TextMeshProUGUI>();

        var imgT = panel.transform.Find("ItemImage");
        if (imgT == null) imgT = panel.transform.Find("item-image");
        if (imgT == null) imgT = panel.transform.Find("Image");
        if (imgT != null)
            itemImage = imgT.GetComponent<Image>();

        if (itemImage == null)
            EnsureItemImageSlot();

        cardFrame = panel.GetComponent<Image>();

        // Color only — do NOT set outlineWidth (needs material instance, throws NRE)
        if (titleText != null)
            titleText.color = titleColor;

        if (descriptionText != null)
            descriptionText.color = descriptionColor;
    }

    private void EnsureItemImageSlot()
    {
        if (panel == null || itemImage != null) return;

        var go = new GameObject("ItemImage", typeof(RectTransform), typeof(CanvasRenderer), typeof(Image));
        go.transform.SetParent(panel.transform, false);
        go.transform.SetSiblingIndex(0);
        var rt = go.GetComponent<RectTransform>();
        rt.anchorMin = rt.anchorMax = new Vector2(0.5f, 0.5f);
        rt.pivot = new Vector2(0.5f, 0.5f);
        rt.sizeDelta = new Vector2(160f, 160f);
        rt.anchoredPosition = new Vector2(0f, 10f);
        itemImage = go.GetComponent<Image>();
        itemImage.preserveAspect = true;
        itemImage.raycastTarget = false;
        itemImage.color = Color.white;
    }

    public void ShowItem(ItemData item)
    {
        if (item == null)
        {
            Debug.LogWarning("[ClueFoundPopup] ShowItem called with null ItemData.");
            return;
        }
        Show(item.itemName, item.itemImage, item.description);
    }

    public void Show(string title, Sprite sprite)
    {
        Show(title, sprite, null);
    }

    public void Show(string title, Sprite sprite, string description)
    {
        var host = Ensure();
        if (host == null) return;

        host.BindClueDisplay();
        if (host.panel == null) return;

        ForceHintPanelOff();
        host.HideMainPanel();

        host.ApplyContent(title, sprite, description);
        host.panel.SetActive(true);
        host.isShowing = true;
    }

    public void Hide()
    {
        if (panel != null)
            panel.SetActive(false);
        isShowing = false;
        RestoreMainPanel();
    }

    private void ApplyContent(string title, Sprite sprite, string description)
    {
        if (titleText != null)
        {
            titleText.text = title ?? string.Empty;
            titleText.color = titleColor;
        }

        if (descriptionText != null)
        {
            descriptionText.text = description ?? string.Empty;
            descriptionText.color = descriptionColor;
        }

        if (itemImage != null)
        {
            itemImage.sprite = sprite;
            itemImage.enabled = sprite != null;
            itemImage.preserveAspect = true;
            itemImage.color = Color.white;
        }
    }

    public void EnsureUiBuilt() => BindClueDisplay();

    public bool IsShowing => isShowing && panel != null && panel.activeSelf;
}

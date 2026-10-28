using System.Collections;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Key 1 intro:
/// 1) HintPanel 2s → hide
/// 2) E → ClueDisplay Blue Candy Wrapper → RMB close
/// 3) E → ClueDisplay Office Waiting Ticket → RMB close
/// </summary>
public class HintPanelDisplay : MonoBehaviour
{
    public static HintPanelDisplay Instance { get; private set; }

    /// <summary>True while waiting for E to reveal on-body items (blocks world explore E).</summary>
    public static bool BlocksExploreInput
    {
        get
        {
            if (Instance == null) return false;
            return Instance.phase == Phase.WaitFirstItem || Instance.phase == Phase.WaitSecondItem;
        }
    }

    [Header("HintPanel")]
    public GameObject panel;
    public Text hintText;
    public float hintDuration = 2f;
    public string hintMessage = "Hint: First, check what you have on yourself.";

    [Header("On-body clues (order)")]
    public ItemData chocolateWrapper;
    public ItemData waitingTicket;
    public string chocolateDisplayName = "Blue Candy Wrapper";
    public string waitingTicketDisplayName = "Office Waiting Ticket";

    [Header("Keys")]
    public KeyCode startKey = KeyCode.Alpha1;
    public KeyCode inspectKey = KeyCode.E;

    // Legacy fields (scene serialized)
    public GameObject blinkObject;
    public float blinkInterval = 0.15f;
    public int blinkTimes = 4;
    public float displayDuration = 5f;

    private enum Phase
    {
        Idle,
        ShowingHint,
        WaitFirstItem,
        ShowingFirstItem,
        WaitSecondItem,
        ShowingSecondItem,
        Done
    }

    private Phase phase = Phase.Idle;
    private bool wasPopupShowing;

    void Awake()
    {
        Instance = this;
    }

    void OnDestroy()
    {
        if (Instance == this)
            Instance = null;
    }

    void Start()
    {
        var stray = GetComponent<ClueFoundPopup>();
        if (stray != null)
            Destroy(stray);

        ClueFoundPopup.Ensure();
        ResolveItems();
        ResolveHintText();

        if (panel != null)
            panel.SetActive(false);
    }

    void Update()
    {
        if (Input.GetKeyDown(startKey) && phase == Phase.Idle)
            StartCoroutine(ShowHintRoutine());

        // After hint: E reveals next on-body clue
        if (phase == Phase.WaitFirstItem && Input.GetKeyDown(inspectKey))
        {
            if (ClueFoundPopup.Instance != null && ClueFoundPopup.Instance.IsShowing)
                return;
            RevealItem(chocolateWrapper, chocolateDisplayName, Phase.ShowingFirstItem);
        }
        else if (phase == Phase.WaitSecondItem && Input.GetKeyDown(inspectKey))
        {
            if (ClueFoundPopup.Instance != null && ClueFoundPopup.Instance.IsShowing)
                return;
            RevealItem(waitingTicket, waitingTicketDisplayName, Phase.ShowingSecondItem);
        }

        // Detect right-click close of ClueDisplay
        bool popupShowing = ClueFoundPopup.Instance != null && ClueFoundPopup.Instance.IsShowing;
        if (wasPopupShowing && !popupShowing)
        {
            if (phase == Phase.ShowingFirstItem)
                phase = Phase.WaitSecondItem;
            else if (phase == Phase.ShowingSecondItem)
                phase = Phase.Done;
        }
        wasPopupShowing = popupShowing;
    }

    private IEnumerator ShowHintRoutine()
    {
        phase = Phase.ShowingHint;
        ResolveHintText();

        if (panel == null)
        {
            Debug.LogError("[HintPanel] panel not assigned.");
            phase = Phase.WaitFirstItem;
            yield break;
        }

        if (hintText != null)
            hintText.text = hintMessage;

        panel.SetActive(true);
        yield return new WaitForSeconds(hintDuration);
        panel.SetActive(false);

        phase = Phase.WaitFirstItem;
        Debug.Log("[HintPanel] Hint done — press E to find Blue Candy Wrapper.");
    }

    private void RevealItem(ItemData data, string displayName, Phase showingPhase)
    {
        if (data == null)
        {
            Debug.LogWarning($"[HintPanel] Missing ItemData for '{displayName}'.");
            phase = showingPhase == Phase.ShowingFirstItem ? Phase.WaitSecondItem : Phase.Done;
            return;
        }

        phase = showingPhase;

        var boot = FindObjectOfType<CluePanelBootstrap>(true);
        if (boot != null)
            boot.DiscoverItem(data);

        if (!string.IsNullOrEmpty(data.clueId))
            ClueProgress.Ensure().UnlockClue(data.clueId);

        var popup = ClueFoundPopup.Ensure();
        if (popup != null)
            popup.Show(displayName, data.itemImage, data.description);

        wasPopupShowing = true;
        Debug.Log($"[HintPanel] Showing: {displayName}");
    }

    private void ResolveHintText()
    {
        if (hintText != null) return;
        if (panel == null) return;

        hintText = panel.GetComponentInChildren<Text>(true);
        if (hintText == null)
        {
            var legacy = panel.transform.Find("Text (Legacy)");
            if (legacy != null)
                hintText = legacy.GetComponent<Text>();
        }
    }

    private void ResolveItems()
    {
        if (chocolateWrapper == null)
            chocolateWrapper = FindItemByClueId("clue_chocolate_wrapper");
        if (waitingTicket == null)
            waitingTicket = FindItemByClueId("clue_waiting_ticket");
    }

    private static ItemData FindItemByClueId(string clueId)
    {
        if (string.IsNullOrEmpty(clueId)) return null;
        var all = Resources.FindObjectsOfTypeAll<ItemData>();
        foreach (var item in all)
        {
            if (item != null && item.clueId == clueId)
                return item;
        }
        return null;
    }
}

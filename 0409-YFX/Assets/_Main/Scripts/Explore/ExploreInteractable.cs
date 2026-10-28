using TMPro;
using UnityEngine;

/// <summary>
/// World explore pickup. Walk near (trigger) and press E to obtain an ItemData.
/// </summary>
[RequireComponent(typeof(Collider))]
public class ExploreInteractable : MonoBehaviour
{
    [Header("Content")]
    public ItemData itemData;

    [Header("Interaction")]
    public KeyCode interactKey = KeyCode.E;
    public bool autoPickupOnEnter;
    public bool hideAfterPickup = true;
    public bool disableColliderAfterPickup = true;

    [Header("Prompt (optional)")]
    public GameObject promptRoot;
    public TextMeshPro promptWorldText;
    public string promptMessage = "Press E — Inspect";

    [Header("World visual (optional)")]
    public GameObject worldVisual;

    private bool playerInRange;
    private bool collected;

    void Reset()
    {
        var col = GetComponent<Collider>();
        if (col != null) col.isTrigger = true;
    }

    void Awake()
    {
        // Fallback: bind ItemData by GameObject name if Inspector ref missing
        if (itemData == null)
            itemData = FindItemDataByName(gameObject.name);
    }

    void Start()
    {
        var col = GetComponent<Collider>();
        if (col != null) col.isTrigger = true;

        if (itemData == null)
        {
            itemData = FindItemDataByName(gameObject.name);
            if (itemData == null)
                Debug.LogError($"[ExploreInteractable] '{name}' has no ItemData. Assign it in Inspector.");
        }

        if (worldVisual == null)
        {
            var v = transform.Find("Visual");
            if (v != null) worldVisual = v.gameObject;
        }

        if (promptWorldText != null && !string.IsNullOrEmpty(promptMessage))
            promptWorldText.text = promptMessage;

        SetPrompt(false);
    }

    public static ItemData FindItemDataByName(string objectName)
    {
        if (string.IsNullOrEmpty(objectName)) return null;

        string compact = objectName.Replace(" ", "");
        string assetHint = "Item_" + compact;

        var all = Resources.FindObjectsOfTypeAll<ItemData>();
        foreach (var item in all)
        {
            if (item == null) continue;
            if (!string.IsNullOrEmpty(item.itemName) &&
                string.Equals(item.itemName, objectName, System.StringComparison.OrdinalIgnoreCase))
                return item;
            if (string.Equals(item.name, objectName, System.StringComparison.OrdinalIgnoreCase) ||
                string.Equals(item.name, assetHint, System.StringComparison.OrdinalIgnoreCase) ||
                string.Equals(item.name.Replace(" ", ""), assetHint, System.StringComparison.OrdinalIgnoreCase))
                return item;
        }
        return null;
    }

    void OnTriggerEnter(Collider other)
    {
        if (collected) return;
        if (!IsPlayer(other)) return;

        playerInRange = true;
        SetPrompt(true);

        if (autoPickupOnEnter)
            TryCollect();
    }

    void OnTriggerExit(Collider other)
    {
        if (!IsPlayer(other)) return;
        playerInRange = false;
        SetPrompt(false);
    }

    private static bool IsPlayer(Collider other)
    {
        if (other.CompareTag("Player")) return true;
        if (other.GetComponentInParent<PlayerMovement>() != null) return true;
        return other.name.Contains("Player");
    }

    void Update()
    {
        if (collected || !playerInRange) return;
        if (DialogueManager.Instance != null && DialogueManager.Instance.IsDialogueActive)
            return;
        if (ClueFoundPopup.Instance != null && ClueFoundPopup.Instance.IsShowing)
            return;
        // Body-search intro (key 1) owns E until both items are shown
        if (HintPanelDisplay.BlocksExploreInput)
            return;

        if (Input.GetKeyDown(interactKey) || Input.GetKeyDown(KeyCode.C))
            TryCollect();
    }

    public void TryCollect()
    {
        if (collected) return;

        if (itemData == null)
            itemData = FindItemDataByName(gameObject.name);

        if (itemData == null)
        {
            Debug.LogWarning($"[ExploreInteractable] {name} has no ItemData.");
            return;
        }

        collected = true;
        SetPrompt(false);

        Debug.Log($"[Explore] Collecting '{itemData.itemName}'");

        var popup = ClueFoundPopup.Ensure();
        if (popup != null)
            popup.ShowItem(itemData);

        var boot = FindObjectOfType<CluePanelBootstrap>(true);
        if (boot != null)
            boot.DiscoverItem(itemData);

        if (!string.IsNullOrEmpty(itemData.clueId))
        {
            try
            {
                ClueProgress.Ensure().UnlockClue(itemData.clueId);
            }
            catch (System.Exception e)
            {
                Debug.LogWarning($"[Explore] UnlockClue failed for {itemData.clueId}: {e.Message}");
            }
        }

        if (hideAfterPickup)
        {
            if (worldVisual != null)
                worldVisual.SetActive(false);
            else
            {
                foreach (var r in GetComponentsInChildren<Renderer>())
                    r.enabled = false;
            }
        }

        if (disableColliderAfterPickup)
        {
            var col = GetComponent<Collider>();
            if (col != null) col.enabled = false;
            enabled = false;
        }
    }

    private void SetPrompt(bool on)
    {
        if (promptRoot != null)
            promptRoot.SetActive(on);
        else if (promptWorldText != null)
            promptWorldText.gameObject.SetActive(on);
    }
}

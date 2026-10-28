using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Serialized links for the Canvas authored directly in SampleScene.
/// The dialogue controller reads this component; it never creates UI at runtime.
/// </summary>
public sealed class CampusUiReferences : MonoBehaviour
{
    [Header("Top HUD")]
    public Text DayText;
    public Text LocationText;
    public Text PlayerText;
    public Text MoneyText;
    public Text FavorText;
    public Text ObjectiveText;
    public GameObject DebugPanel;

    [Header("Map")]
    public GameObject MapOverlay;
    public Button[] MapButtons;

    [Header("Dialogue")]
    public GameObject DialoguePanel;
    public Image ActorPortrait;
    public Text SpeakerText;
    public Text DialogueText;
    public Text ProgressText;
    [Tooltip("Optional. Dialogue advances with Enter / left click when this is missing.")]
    public Button ContinueButton;
    [Tooltip("Optional. Dialogue closes with Enter / left click when this is missing.")]
    public Button CloseButton;
    [Tooltip("Optional. Choices auto-resolve when empty.")]
    public Button[] ChoiceButtons;

    [Header("Classroom trade")]
    public GameObject ClassroomTradePanel;
    public Image CustomerPortrait;
    public Text CustomerNameText;
    public Text CustomerRequestText;
    public Text TradeStatusText;
    public Button RefreshCustomerButton;
    public Button[] InventoryButtons;
    public Image[] InventoryItemImages;
    public Text[] InventoryQuantityTexts;
}

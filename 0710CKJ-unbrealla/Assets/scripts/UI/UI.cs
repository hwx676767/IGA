using UnityEngine;

public class UI : MonoBehaviour
{
    [SerializeField] private GameObject[] uiElements;
    public bool alternativeInput { get; private set; }
    private PlayerInputSet input;
    
    public UI_ItemToolTip itemToolTip { get; private set; }
    public UI_Inventory inventoryUI { get; private set; }
    public UI_Ingame inGameUI { get; private set; }
    public UI_Options optionsUI { get; private set; }

    //private bool skillTreeEnabled;
    private bool inventoryEnabled;

    private void Awake()
    {
        itemToolTip = GetComponentInChildren<UI_ItemToolTip>();
        inGameUI = GetComponentInChildren<UI_Ingame>(true);
        optionsUI = GetComponentInChildren<UI_Options>(true);
        inventoryUI = GetComponentInChildren<UI_Inventory>(true);
        inventoryEnabled = inventoryUI.gameObject.activeSelf;
        inventoryEnabled = false;
    }
    
    public void SetupControlsUI(PlayerInputSet inputSet)
    {
        input = inputSet;
        
        input.UI.InventoryUI.performed += ctx => ToggleInventoryUI();

        input.UI.Alternative.performed += ctx => alternativeInput = true;
        input.UI.Alternative.canceled += ctx => alternativeInput = false;

        input.UI.OptionsUI.performed += ctx =>
        { 
            foreach (var element in uiElements)
            {
                if (element.activeSelf)
                {
                    Time.timeScale = 1;
                    SwitchToInGameUI();
                    return;
                }
            }

            Time.timeScale = 0;
            OpenOptionsUI();
        };
    }

    public void OpenOptionsUI()
    {
        foreach (var element in uiElements)
            element.gameObject.SetActive(false);

        HideAllTooltips();
        StopPlayerControls(true);
        optionsUI.gameObject.SetActive(true);
    }

    public void SwitchToInGameUI()
    {
        foreach(var element in uiElements)
            element.gameObject.SetActive(false);

        HideAllTooltips();
        StopPlayerControls(false);
        inGameUI.gameObject.SetActive(true);

        inventoryEnabled = false;
    }

    private void StopPlayerControls(bool stopControls)
    {
        if (stopControls)
            input.Player.Disable();
        else
            input.Player.Enable();
    }

    private void StopPlayerControlsIfNeeded()
    {
        foreach (var element in uiElements)
        {
            if (element.activeSelf)
            {
                StopPlayerControls(true);
                return;
            }
        }

        StopPlayerControls(false);
    }

    public void HideAllTooltips()
    {
        itemToolTip.ShowToolTip(false, null);
    }


    public void ToggleInventoryUI()
    {
        inventoryUI.transform.SetAsLastSibling();
        SetTooltipsAsLastSibling();
        
        inventoryEnabled = !inventoryEnabled;
        inventoryUI.gameObject.SetActive(inventoryEnabled);
        itemToolTip.ShowToolTip(false, null);
        
        StopPlayerControlsIfNeeded();
    }
    
    private void SetTooltipsAsLastSibling()
    {
        itemToolTip.transform.SetAsLastSibling();
    }
}

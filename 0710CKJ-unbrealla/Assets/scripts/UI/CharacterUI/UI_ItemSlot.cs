using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class UI_ItemSlot : MonoBehaviour, IPointerDownHandler, IPointerEnterHandler, IPointerExitHandler
{
    public Inventory_Item itemInSlot { get; private set; }
    protected Inventory_Player inventory;
    protected UI ui;
    protected RectTransform rect;

    [Header("UI Slot Setup")]
    [SerializeField] private Image itemIcon;
    //[SerializeField] private TextMeshProUGUI itemStackSize;

    protected virtual void Awake()
    {
        ui = GetComponentInParent<UI>();
        rect = GetComponent<RectTransform>();
        inventory = FindAnyObjectByType<Inventory_Player>();
    }

    public virtual void OnPointerDown(PointerEventData eventData)
    {
        Debug.Log("OnPointerDown");
        if (itemInSlot == null)
        {
            Debug.Log("itemInSlot is null");
            return;
        }

        bool alternativeInput = Input.GetKey(KeyCode.LeftControl);

        if (alternativeInput)
        {
            Debug.Log("alternativeInput");
            // Ctrl + 点击 = 删除一个物品:item drop but I didn't start to write it yet.
            inventory.DropOneItem(itemInSlot);
            return;
        }
        
        if (itemInSlot.itemData.itemType == ItemType.Consumable)
        {
            Debug.Log("itemInSlot.itemData.itemType == ItemType.Consumable");
            if (itemInSlot.itemData.isConsumable == false)
                return;

            inventory.TryUseItem(itemInSlot);
        }

        if (itemInSlot == null)
            ui.itemToolTip.ShowToolTip(false, null);
    }

    public void UpdateSlot(Inventory_Item item)
    {
        itemInSlot = item;

        if (itemInSlot == null)
        {
            //itemStackSize.text = "";
            itemIcon.color = Color.clear;
            return;
        }

        Color color = Color.white; 
        color.a = .9f;
        itemIcon.color = color;
        itemIcon.sprite = itemInSlot.itemData.itemIcon;
        //itemStackSize.text = item.stackSize > 1 ? item.stackSize.ToString() : "";
    }

    public virtual void OnPointerEnter(PointerEventData eventData)
    {
        if (itemInSlot == null) return;

        ui.itemToolTip.ShowToolTip(true, rect, itemInSlot);
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        ui.itemToolTip.ShowToolTip(false, null);
    }
}
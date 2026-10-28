using UnityEngine;
using UnityEngine.UI;

public class InventoryUI : MonoBehaviour
{
    [Header("基本配置")]
    public Transform slotsParent; // 格子父物体
    public GameObject slotPrefab; // 只需要包含单个Image组件的预制体
    public Sprite emptySlotSprite; // 空格子背景图

    private Image[] slotImages; // 所有格子的Image组件

    void Start()
    {
        InitializeSlots();
        InventoryEvents.OnInventoryChanged.AddListener(UpdateUI);
        UpdateUI(); // 立即刷新
    }

    void InitializeSlots()
    {
        // 清空现有格子
        foreach (Transform child in slotsParent) Destroy(child.gameObject);

        // 创建所有格子
        slotImages = new Image[InventorySystem.MaxSlots];
        for (int i = 0; i < InventorySystem.MaxSlots; i++)
        {
            var slot = Instantiate(slotPrefab, slotsParent);
            slotImages[i] = slot.GetComponent<Image>();
            slotImages[i].sprite = emptySlotSprite; // 初始设为空格子
        }
    }

    void UpdateUI()
    {
        var items = InventorySystem.Instance.GetAllItems();
        int slotIndex = 0;

        // 填充有物品的格子
        foreach (var item in items)
        {
            for (int i = 0; i < item.slotSize && slotIndex < slotImages.Length; i++)
            {
                slotImages[slotIndex].sprite = item.icon;
                slotIndex++;
            }
        }

        // 剩余格子设为空
        for (; slotIndex < slotImages.Length; slotIndex++)
        {
            slotImages[slotIndex].sprite = emptySlotSprite;
        }
    }
}
using UnityEngine;
using System.Collections.Generic;

public class InventorySystem : MonoBehaviour
{
    public static InventorySystem Instance { get; private set; }

    [SerializeField] private InventoryData inventoryData;
    
    private List<InventoryData.ItemDefinition> items = new List<InventoryData.ItemDefinition>();
    
    public static readonly int MaxSlots = 18;
    private int usedSlots = 0;
    public int UsedSlots => usedSlots;

    void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            InitializeInventory();
        }
        else
        {
            Destroy(gameObject);
        }
    }

    void InitializeInventory()
    {
        foreach (var slot in inventoryData.initialItems)
        {
            AddItem(slot.itemID, slot.count);
        }
    }

    /// <summary> 获取剩余空格数 </summary>
    public int GetRemainingSlots() => MaxSlots - usedSlots;

    /// <summary> 尝试添加物品 </summary>
    public bool AddItem(string itemID, int count = 1)
    {
        var def = GetItemDefinition(itemID);
        if (def == null || usedSlots + def.slotSize * count > MaxSlots) 
            return false;

        for (int i = 0; i < count; i++)
        {
            items.Add(def);
            usedSlots += def.slotSize;
        }
        
        InventoryEvents.NotifyChange();
        return true;
    }

    public void AddItems(string itemId)
    {
        AddItem(itemId, 1);
    }

    /// <summary> 移除指定位置的物品 </summary>
    public void RemoveItem(int index)
    {
        if (index < 0 || index >= items.Count) return;
        
        usedSlots -= items[index].slotSize;
        items.RemoveAt(index);
        CompactInventory();
        InventoryEvents.NotifyChange();
    }

    /// <summary> 获取当前所有物品 </summary>
    public List<InventoryData.ItemDefinition> GetAllItems() => new List<InventoryData.ItemDefinition>(items);

    /// <summary> 根据ID查找物品定义 </summary>
    private InventoryData.ItemDefinition GetItemDefinition(string itemID)
    {
        return inventoryData.itemDatabase.Find(x => x.itemID == itemID);
    }

    /// <summary> 自动整理背包 </summary>
    private void CompactInventory()
    {
        // 可按需实现排序逻辑
        // items.Sort((a,b) => a.type.CompareTo(b.type));
    }
}
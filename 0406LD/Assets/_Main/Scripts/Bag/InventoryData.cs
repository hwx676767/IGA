using UnityEngine;
using System.Collections.Generic;

[CreateAssetMenu(fileName = "NewInventoryData", menuName = "Inventory/Data")]
public class InventoryData : ScriptableObject
{
    [System.Serializable]
    public class ItemDefinition
    {
        public string itemID;    // 物品唯一标识
        public Sprite icon;      // 物品图标
        public int slotSize = 1; // 占用格子数
        
        [Tooltip("物品分类")]
        public enum ItemType { Battery, Device1, Device2, Device3 }
        public ItemType type;
    }

    [Header("物品数据库")]
    public List<ItemDefinition> itemDatabase = new List<ItemDefinition>();

    [Header("初始物品")]
    public List<ItemSlot> initialItems = new List<ItemSlot>();

    [System.Serializable]
    public class ItemSlot
    {
        public string itemID; // 改用itemID而不是enum
        public int count;
    }
}
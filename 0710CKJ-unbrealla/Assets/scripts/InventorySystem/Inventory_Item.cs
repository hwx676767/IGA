using System;
using UnityEngine;

[Serializable]
public class Inventory_Item 
{
    public ItemDataSO itemData;
    public int stackSize = 1;
    
    public Inventory_Item(ItemDataSO itemData, int stackSize = 1)
    {
        this.itemData = itemData;
        this.stackSize = stackSize;
    }

    public bool CanAddStack() => stackSize < itemData.maxStackSize;
    public void AddStack() => stackSize++;
    public void RemoveStack() => stackSize--;
    
    // 简单的物品信息显示
    public string GetItemInfo()
    {
        string info = itemData.itemInfo;
            
        return info;
    }
}
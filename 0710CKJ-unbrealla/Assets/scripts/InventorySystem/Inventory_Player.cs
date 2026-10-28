using System.Collections.Generic;
using UnityEngine;

public class Inventory_Player : Inventory_Base
{
    private Player player;

    protected override void Awake()
    {
        base.Awake();
        player = GetComponent<Player>();
    }

    // Add item to inventory
    public override void AddItem(Inventory_Item item)
    {
        if (CanAddItem(item))
        {
            base.AddItem(item);
        }
    }

    // Remove one quantity of item
    public override void RemoveOneItem(Inventory_Item item)
    {
        base.RemoveOneItem(item);
    }

    public void DropOneItem(Inventory_Item item)
    {
        Debug.Log("Drop one item");
        player.DropItem(item);
        base.RemoveOneItem(item);
    }

    // Check if can add item (capacity check)
    public override bool CanAddItem(Inventory_Item item)
    {
        return base.CanAddItem(item);
    }

    // Find item in inventory
    public override Inventory_Item FindItem(Inventory_Item item)
    {
        return base.FindItem(item);
    }
    
    public override void SaveData(ref GameData data)
    {
        Debug.Log("Save data");
        data.inventory.Clear();

        foreach (var item in itemList)
        {
            if (item != null && item.itemData != null)
            {
                string saveId = item.itemData.saveId;


                if (data.inventory.ContainsKey(saveId) == false)
                    data.inventory[saveId] = 0;
                
            }
        }
    }

    public override void LoadData(GameData data)
    {
        

        foreach (var entry in data.inventory)
        {
            string saveId = entry.Key;
            if (saveId == null) Debug.Log("save id is null");

            ItemDataSO itemData = itemDataBase.GetItemData(saveId);

            if (itemData == null)
            {
                Debug.LogWarning("Item not found: " + saveId);
                continue;
            }

            Inventory_Item itemToLoad = new Inventory_Item(itemData);

            AddItem(itemToLoad);

        }

        TriggerUpdateUI();
    }
}
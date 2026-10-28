using System;
using System.Collections.Generic;
using UnityEngine;

public class Inventory_Base : MonoBehaviour, ISaveable
{
    public event Action OnInventoryChange;

    [Header("Inventory Settings")]
    public int maxInventorySize = 3;  // 改为3
    
    
    [Header("Weight Monitoring")]
    [SerializeField] private float currentWeight = 0f;  // 只是监控，不限制
    
    [Header("ITEM DATA BASE")]
    [SerializeField] protected ItemListDataSO itemDataBase;
    public List<Inventory_Item> itemList = new List<Inventory_Item>();

    protected virtual void Awake()
    {

    }

    public void UpdatePlayerWeight()
    {
        Player player = FindFirstObjectByType<Player>();
        if (player == null) return;
    
        // Calculate total weight = initial mass + inventory weight
        float totalWeight = player.InitialMass + GetCurrentWeight();
    
        // Update player's mass in Entity
        player.mass = (int)totalWeight;
        player.RigidBody.mass = totalWeight;
    
        // Update UI weight display
        UI_Weight weightUI = FindFirstObjectByType<UI_Weight>();
        if (weightUI != null)
        {
            weightUI.RefreshWeightDisplay();
        }
    
        Debug.Log($"Updated player weight: {totalWeight} (Initial: {player.InitialMass} + Inventory: {GetCurrentWeight()})");
    }

    public void TryUseItem(Inventory_Item itemToUse)
    {
        Debug.Log("Try Use Item");
        Inventory_Item consumable = itemList.Find(item => item == itemToUse);

        if (consumable == null)
            return;
        
        // 检查是否为消耗品
        if (consumable.itemData.itemType != ItemType.Consumable || !consumable.itemData.isConsumable)
        {
            Debug.Log("这个物品不能使用");
            return;
        }
    
        // 检查是否有消耗效果
        if (consumable.itemData.consumableEffect == null)
        {
            Debug.Log("这个消耗品没有效果");
            return;
        }

        // 执行消耗效果
        consumable.itemData.consumableEffect.OnConsume(FindFirstObjectByType<Player>().gameObject);


        RemoveOneItem(consumable);

        OnInventoryChange?.Invoke();
    }

    public virtual bool CanAddItem(Inventory_Item itemToAdd)
    {
        bool hasStackable = FindStackable(itemToAdd) != null;
        return hasStackable || itemList.Count < maxInventorySize;
    }
    
    public Inventory_Item FindStackable(Inventory_Item itemToAdd)
    {
        List<Inventory_Item> stackableItems = itemList.FindAll(item => item.itemData == itemToAdd.itemData);

        foreach (var stackableItem in stackableItems)
        {
            if (stackableItem.CanAddStack())
                return stackableItem;
        }

        return null;
    }

    public virtual void AddItem(Inventory_Item itemToAdd)
    {
        Inventory_Item itemInInventory = FindStackable(itemToAdd);

        if (itemInInventory != null)
            itemInInventory.AddStack();
        else
            itemList.Add(itemToAdd);
        
        UpdateWeight();  // Update inventory weight calculation
        UpdatePlayerWeight(); // Update player's total weight
        OnInventoryChange?.Invoke();
    }

    public virtual void RemoveOneItem(Inventory_Item itemToRemove)
    {
        Inventory_Item itemInInventory = itemList.Find(item => item == itemToRemove);

        if (itemInInventory.stackSize > 1)
            itemInInventory.RemoveStack();
        else
            itemList.Remove(itemToRemove);

        UpdateWeight();  // 更新重量
        UpdatePlayerWeight(); 
        OnInventoryChange?.Invoke();
    }

    public void RemoveFullStack(Inventory_Item itemToRemove)
    {
        for (int i = 0; i < itemToRemove.stackSize; i++)
        {
            RemoveOneItem(itemToRemove);
        }
    }

    public virtual Inventory_Item FindItem(Inventory_Item itemToFind)
    {
        return itemList.Find(item => item == itemToFind);
    }

    public void TriggerUpdateUI() => OnInventoryChange?.Invoke();

    // 新增：更新重量计算
    private void UpdateWeight()
    {
        currentWeight = 0f;
        foreach (var item in itemList)
        {
            currentWeight += item.itemData.weight * item.stackSize;
        }
    }

    // 新增：获取当前重量（用于UI显示等）
    public float GetCurrentWeight()
    {
        return currentWeight;
    }

    // 可选：在Inspector中显示重量信息
    void OnValidate()
    {
        if (Application.isPlaying)
            UpdateWeight();
    }
    
    public virtual void LoadData(GameData data)
    {
        
    }

    public virtual void SaveData(ref GameData data)
    {
       
    }
}
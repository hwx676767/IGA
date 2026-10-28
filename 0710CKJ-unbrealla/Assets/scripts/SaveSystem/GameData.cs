using System.Collections.Generic;
using System;
using UnityEngine;

[Serializable]
public class GameData
{
    public int gold;

    public List<Inventory_Item> itemList;
    public SerializableDictionary<string, int> inventory; // itemSaveId -> stackSize
    
    public Vector3 savedCheckpoint;
    
    public Transform lastPlayerTransform;

    public GameData()
    {
        inventory = new SerializableDictionary<string, int>();

    }
}

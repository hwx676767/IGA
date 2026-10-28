using UnityEngine;
using UnityEditor;

[CreateAssetMenu(menuName = "RPG Setup/Item Data/Material item", fileName = "Material data - ")]
public class ItemDataSO : ScriptableObject
{
    public string saveId { get; private set; }
    
    [Header("Drop Details")]
    [Range(0, 1000)]
    public int itemRarity = 100;
    [Range(0, 100)]
    public float dropChance;
    [Range(0, 100)]
    public float maxDropChance = 65f;
    
    [SerializeField]public GameObject dropPrefab;

    [Header("Item details")]
    public string itemName;
    public Sprite itemIcon;
    public ItemType itemType;
    public string itemInfo;
    public int maxStackSize = 1;
    public float weight = 1f;

    [Header("Consumable")]
    public bool isConsumable = false;
    public ConsumableEffect consumableEffect;

    private void OnValidate()
    {
        dropChance = GetDropChance();
#if UNITY_EDITOR
        string path = AssetDatabase.GetAssetPath(this);
        saveId = AssetDatabase.AssetPathToGUID(path);
#endif
    }

    public float GetDropChance()
    {
        float maxRarity = 1000;
        float chance = (maxRarity - itemRarity + 1) / maxRarity * 100;

        return Mathf.Min(chance, maxDropChance);
    }
}
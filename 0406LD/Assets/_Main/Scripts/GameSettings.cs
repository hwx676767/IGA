using UnityEngine;

public class GameSettings : MonoBehaviour
{
    public static GameSettings Instance { get; private set; }

    [Header("层级设置")]
    public float layerHeight = 10f;
    
    [Header("边界设置")] 
    public float mapSize = 50f;
    public bool showBoundaryGizmos = true;
    public Color boundaryColor = Color.cyan;

    [Header("生成设置")]
    public int minItemsPerLayer = 5;
    public int maxItemsPerLayer = 15;
    
    [Header("预制体")]
    public GameObject layerContainerPrefab;
    public GameObject itemPrefab;

    [Header("特殊物品生成设置")]
    public int minBatteriesPerLayer = 3;
    public int maxBatteriesPerLayer = 5;
    public int minDevicesPerLayer = 1;
    public int maxDevicesPerLayer = 2;

    void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
        }
        else
        {
            Destroy(gameObject);
        }
    }

    void OnDrawGizmos()
    {
        if (!showBoundaryGizmos) return;
        
        Gizmos.color = boundaryColor;
        for (int i = -1; i <= 1; i++)
        {
            Vector3 center = new Vector3(0, i * layerHeight, 0);
            Gizmos.DrawWireCube(center, new Vector3(mapSize * 2, 0.1f, mapSize * 2));
        }
    }
}
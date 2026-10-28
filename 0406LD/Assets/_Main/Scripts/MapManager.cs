using UnityEngine;
using System.Collections.Generic;

public class MapManager : MonoBehaviour
{
    public static MapManager Instance { get; private set; }

    [Header("物品预制体")]
    public GameObject batteryPrefab;
    public GameObject magnetPrefab;
    public GameObject transformerPrefab;
    public GameObject detectorPrefab;
    public GameObject doorPrefab;
    public GameObject standardItemPrefab;

    [Header("基础物品设置")]
    public int minStandardItems = 8;
    public int maxStandardItems = 15;

    [Header("特殊物品设置")]
    public int minBatteries = 3;
    public int maxBatteries = 6;
    public int minDevices = 1;
    public int maxDevices = 3;
    public int minDetectors = 1;
    public int maxDetectors = 2;

    [Header("地图设置")]
    public float minDistanceBetweenItems = 1.5f;
    public float mapSize = 10f;
    public float layerHeight = 5f;

    private Dictionary<int, LayerData> activeLayers = new Dictionary<int, LayerData>();
    private int _currentCenterLayer;
    public int CurrentCenterLayer
    {
        get => _currentCenterLayer;
        private set
        {
            _currentCenterLayer = value;
            OnLayerChanged?.Invoke(value);
        }
    }

    public event System.Action<int> OnLayerChanged;

    void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            InitializeLayers();
        }
        else
        {
            Destroy(gameObject);
        }
    }

    void InitializeLayers()
    {
        GenerateLayer(1);
        GenerateLayer(0);
        GenerateLayer(-1);
        CurrentCenterLayer = 0;
        // 初始化后立即更新UI
        LevelDataManager.Instance.UpdateDisplay(CurrentCenterLayer);
    }

    public void Descend()
    {
        CurrentCenterLayer--;
        UnloadLayer(CurrentCenterLayer + 2);
        GenerateLayer(CurrentCenterLayer - 1);
        
        // 层级变化后更新UI
        LevelDataManager.Instance.UpdateDisplay(CurrentCenterLayer);
    }

    void GenerateLayer(int layerNumber)
    {
        if (activeLayers.ContainsKey(layerNumber)) return;

        LayerData layerData = new LayerData(layerNumber);
        activeLayers[layerNumber] = layerData;

        GenerateStandardItems(layerData);
        GenerateSpecialItemsByLayer(layerNumber, layerData);
        GenerateDoor(layerNumber, layerData);
        
        // 注册新生成的层级到LevelDataManager
        LevelDataManager.Instance.RegisterLayer(layerNumber, layerData.items);
    }

    void GenerateStandardItems(LayerData layerData)
    {
        int count = Random.Range(minStandardItems, maxStandardItems + 1);
        for (int i = 0; i < count; i++)
        {
            Vector3 pos = GetRandomPositionInLayer(layerData.layerNumber, layerData.itemPositions);
            if (pos == Vector3.negativeInfinity) continue;

            GameObject item = Instantiate(standardItemPrefab, pos, Quaternion.identity, layerData.container.transform);
            layerData.AddItem(item);
        }
    }

    void GenerateSpecialItemsByLayer(int layerNumber, LayerData layerData)
    {
        // 所有层都有电池
        GenerateBatteries(layerData);

        if (layerNumber <= -4 && layerNumber >= -6) // 设备层
        {
            Debug.Log($"生成设备在层级：{layerNumber}");
            GenerateDevices(layerData);
        }
        else if (layerNumber <= -7) // 探测器层
        {
            GenerateDevices(layerData);
            GenerateDetectors(layerData);
        }
    }

    void GenerateBatteries(LayerData layerData)
    {
        int count = Random.Range(minBatteries, maxBatteries + 1);
        for (int i = 0; i < count; i++)
        {
            Vector3 pos = GetRandomPositionInLayer(layerData.layerNumber, layerData.itemPositions);
            if (pos == Vector3.negativeInfinity) continue;

            GameObject battery = Instantiate(batteryPrefab, pos, Quaternion.identity, layerData.container.transform);
            layerData.AddItem(battery);
        }
    }

    void GenerateDevices(LayerData layerData)
    {
        int count = Random.Range(minDevices, maxDevices + 1);
        for (int i = 0; i < count; i++)
        {
            Vector3 pos = GetRandomPositionInLayer(layerData.layerNumber, layerData.itemPositions);
            if (pos == Vector3.negativeInfinity) continue;

            GameObject device = Random.value > 0.5f ? magnetPrefab : transformerPrefab;
            device = Instantiate(device, pos, Quaternion.identity, layerData.container.transform);
            Debug.Log(device.name);
            layerData.AddItem(device);
        }
    }

    void GenerateDetectors(LayerData layerData)
    {
        int count = Random.Range(minDetectors, maxDetectors + 1);
        for (int i = 0; i < count; i++)
        {
            Vector3 pos = GetRandomPositionInLayer(layerData.layerNumber, layerData.itemPositions);
            if (pos == Vector3.negativeInfinity) continue;

            GameObject detector = Instantiate(detectorPrefab, pos, Quaternion.identity, layerData.container.transform);
            layerData.AddItem(detector);
        }
    }

    void GenerateDoor(int layerNumber, LayerData layerData)
    {
        Vector3 doorPos = GetEdgePosition(layerNumber, layerData.itemPositions);
        GameObject door = Instantiate(doorPrefab, doorPos, Quaternion.identity, layerData.container.transform);
        layerData.AddItem(door);
    }

    Vector3 GetRandomPositionInLayer(int layerNumber, List<Vector3> occupiedPositions, int maxAttempts = 30)
    {
        for (int i = 0; i < maxAttempts; i++)
        {
            Vector3 candidate = new Vector3(
                Random.Range(-mapSize, mapSize),
                layerNumber * layerHeight,
                Random.Range(-mapSize, mapSize)
            );

            if (IsPositionValid(candidate, occupiedPositions))
                return candidate;
        }
        return Vector3.negativeInfinity;
    }

    Vector3 GetEdgePosition(int layerNumber, List<Vector3> occupiedPositions)
    {
        // 尝试4个边缘位置
        Vector3[] edgePositions = {
            new Vector3(mapSize * 0.8f, layerNumber * layerHeight, 0),
            new Vector3(-mapSize * 0.8f, layerNumber * layerHeight, 0),
            new Vector3(0, layerNumber * layerHeight, mapSize * 0.8f),
            new Vector3(0, layerNumber * layerHeight, -mapSize * 0.8f)
        };

        // 随机顺序检查边缘位置
        for (int i = 0; i < edgePositions.Length; i++)
        {
            int randomIndex = Random.Range(0, edgePositions.Length);
            if (IsPositionValid(edgePositions[randomIndex], occupiedPositions))
                return edgePositions[randomIndex];
        }

        // 如果所有边缘位置都无效，返回第一个
        return edgePositions[0];
    }

    bool IsPositionValid(Vector3 position, List<Vector3> occupiedPositions)
    {
        foreach (Vector3 occupiedPos in occupiedPositions)
        {
            if (Vector3.Distance(position, occupiedPos) < minDistanceBetweenItems)
                return false;
        }
        return true;
    }

    void UnloadLayer(int layerNumber)
    {
        if (activeLayers.ContainsKey(layerNumber))
        {
            Destroy(activeLayers[layerNumber].container);
            activeLayers.Remove(layerNumber);
        }
    }

    public class LayerData
    {
        public GameObject container;
        public int layerNumber;
        public List<GameObject> items;
        public List<Vector3> itemPositions;

        public LayerData(int layerNum)
        {
            layerNumber = layerNum;
            container = new GameObject($"Layer_{layerNum}");
            container.transform.position = new Vector3(0, layerNum * MapManager.Instance.layerHeight, 0);
            items = new List<GameObject>();
            itemPositions = new List<Vector3>();
        }

        public void AddItem(GameObject item)
        {
            items.Add(item);
            itemPositions.Add(item.transform.position);
        }
    }
}
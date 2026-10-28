using UnityEngine;

public class MapGenerator : MonoBehaviour 
{
    // 地图尺寸 
    public int width = 10;
    public int height = 6;

    // 结点预制体
    [SerializeField] private GameObject nodePrefab;

    // 颜色配置
    public Color walkableColor = Color.green;
    public Color blockedColor = Color.red;
    public Color highGroundColor = Color.yellow;

    // 存储所有结点的GameObject和位置
    private GameObject[,] nodes;
    private Vector2[,] nodePositions;
    private int[,] nodeStates; // 0: Walkable, 1: Blocked, 2: HighGround

    // 6x10网格的结点位置 [行(y),列(x)]
    private readonly Vector2[,] predefinedPositions = new Vector2[6, 10] {
        // 第0行 (y=0)
        { new Vector2(-5.7f, -2.5f), new Vector2(-4.4f, -2.5f), new Vector2(-3.1f, -2.5f), new Vector2(-1.8f, -2.5f), new Vector2(-0.5f, -2.5f), new Vector2(0.8f, -2.5f), new Vector2(2.1f, -2.5f), new Vector2(3.4f, -2.5f), new Vector2(4.7f, -2.5f), new Vector2(6.0f, -2.5f) },
        // 第1行 (y=1)
        { new Vector2(-5.4f, -1.5f), new Vector2(-4.1f, -1.5f), new Vector2(-2.8f, -1.5f), new Vector2(-1.5f, -1.5f), new Vector2(-0.5f, -1.5f), new Vector2(0.7f, -1.5f), new Vector2(1.9f, -1.5f), new Vector2(3.1f, -1.5f), new Vector2(4.4f, -1.5f), new Vector2(5.6f, -1.5f) },
        // 第2行 (y=2)
        { new Vector2(-5.0f, -0.7f), new Vector2(-3.8f, -0.7f), new Vector2(-2.6f, -0.7f), new Vector2(-1.4f, -0.7f), new Vector2(-0.4f, -0.7f), new Vector2(0.7f, -0.7f), new Vector2(1.8f, -0.7f), new Vector2(2.9f, -0.7f), new Vector2(4.2f, -0.7f), new Vector2(5.1f, -0.7f) },
        // 第3行 (y=3)
        { new Vector2(-4.7f, 0.0f), new Vector2(-3.7f, 0.0f), new Vector2(-2.5f, 0.0f), new Vector2(-1.4f, 0.0f), new Vector2(-0.4f, 0.0f), new Vector2(0.6f, 0.0f), new Vector2(1.7f, 0.0f), new Vector2(2.7f, 0.0f), new Vector2(3.8f, 0.0f), new Vector2(4.9f, 0.0f) },
        // 第4行 (y=4)
        { new Vector2(-4.4f, 0.7f), new Vector2(-3.4f, 0.7f), new Vector2(-2.4f, 0.7f), new Vector2(-1.4f, 0.7f), new Vector2(-0.4f, 0.7f), new Vector2(0.6f, 0.7f), new Vector2(1.6f, 0.7f), new Vector2(2.6f, 0.7f), new Vector2(3.6f, 0.7f), new Vector2(4.6f, 0.7f) },
        // 第5行 (y=5)
        { new Vector2(-4.1f, 1.4f), new Vector2(-3.2f, 1.4f), new Vector2(-2.3f, 1.4f), new Vector2(-1.4f, 1.4f), new Vector2(-0.5f, 1.4f), new Vector2(0.4f, 1.4f), new Vector2(1.3f, 1.4f), new Vector2(2.2f, 1.4f), new Vector2(3.1f, 1.4f), new Vector2(4.3f, 1.4f) }
    };

    // 单例
    public static MapGenerator Instance { get; private set; }

    // 初始化标志
    private bool isInitialized = false;

    void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);

            // 新增：将初始化移到Awake，确保更早完成
            if (nodePrefab == null)
            {
                Debug.LogError("Node prefab is not assigned in MapGenerator!");
                return;
            }
            InitializeMap();
        }
        else
        {
            Debug.LogWarning("发现重复MapGenerator，销毁多余实例。");
            Destroy(gameObject);
            return;
        }
    }

    void Start()
    {
        // Start现在为空，初始化已在Awake完成
        Debug.Log("MapGenerator Start: 初始化已在Awake完成。");
    }

    void InitializeMap()
    {
        // 初始化数组
        nodes = new GameObject[width, height];
        nodePositions = new Vector2[width, height];
        nodeStates = new int[width, height];

        // 初始化所有结点为Walkable
        for (int y = 0; y < height; y++)
            for (int x = 0; x < width; x++)
                nodeStates[x, y] = 0;

        // 设置高地(HighGround)
        SetHighGroundPositions();
        
        // 设置障碍物(Blocked)
        SetBlockedPositions();

        // 生成结点
        GenerateNodes();

        isInitialized = true;
        Debug.Log("MapGenerator 初始化完成！");
    }

    void SetHighGroundPositions()
    {
        // 高地坐标
        int[,] highGrounds = {
            {1, 0}, {2, 0}, {5, 0},{6, 0}, {8, 0},
            {5, 2}, {6, 2}, {8, 2},
            {6, 3}
        };

        for (int i = 0; i < highGrounds.GetLength(0); i++)
        {
            int x = highGrounds[i, 0];
            int y = highGrounds[i, 1];
            if (x >= 0 && x < width && y >= 0 && y < height)
                nodeStates[x, y] = 2;
        }
    }

    void SetBlockedPositions()
    {
        // 障碍物坐标
        int[,] blocked = {
            {4, 2}, {9, 1}, {9, 0}, {5, 3}, {6, 4}, {5, 4},
            {0, 5}, {1, 5}, {2, 5}, {3, 5}, {5, 5}, {6, 5}, {7, 5}, {8, 5},
            {0, 3}, {0, 0}, {3, 0}, {4, 0}, {7, 0},
            {3, 4}, {2, 4}, {1, 4}, {0, 4}, {2, 3}, {1, 3}
        };

        for (int i = 0; i < blocked.GetLength(0); i++)
        {
            int x = blocked[i, 0];
            int y = blocked[i, 1];
            if (x >= 0 && x < width && y >= 0 && y < height)
                nodeStates[x, y] = 1;
        }
    }

    void GenerateNodes()
    {
        for (int y = 0; y < height; y++)
        {
            for (int x = 0; x < width; x++)
            {
                // 设置结点位置
                nodePositions[x, y] = predefinedPositions[y, x];
                
                // 实例化结点
                nodes[x, y] = Instantiate(nodePrefab, nodePositions[x, y], Quaternion.identity, transform);
                
                // 设置颜色
                var sr = nodes[x, y].GetComponent<SpriteRenderer>();
                if (sr == null) continue;
                
                sr.color = nodeStates[x, y] switch
                {
                    1 => blockedColor,
                    2 => highGroundColor,
                    _ => walkableColor
                };
            }
        }
    }

    public Vector2 GetNodePosition(int x, int y)
    {
        if (x >= 0 && x < width && y >= 0 && y < height && isInitialized)
            return nodePositions[x, y];
        return Vector2.zero;
    }

    public int GetNodeState(int x, int y)
    {
        if (x >= 0 && x < width && y >= 0 && y < height && isInitialized)
            return nodeStates[x, y];
        return 1; // 默认Blocked
    }

    public Vector2Int WorldToGrid(Vector2 worldPos)
    {
        if (!isInitialized || nodePositions == null)
        {
            // 新增：添加调用栈追踪，帮助调试调用源头
            Debug.LogWarning("MapGenerator 尚未初始化，请稍后重试。调用栈: " + System.Environment.StackTrace);
            return Vector2Int.zero;
        }

        Vector2Int closest = new Vector2Int(0, 0);
        float minDist = float.MaxValue;
        
        for (int y = 0; y < height; y++)
        {
            for (int x = 0; x < width; x++)
            {
                float dist = Vector2.Distance(worldPos, nodePositions[x, y]);
                if (dist < minDist)
                {
                    minDist = dist;
                    closest = new Vector2Int(x, y);
                }
            }
        }
        return closest;
    }
}
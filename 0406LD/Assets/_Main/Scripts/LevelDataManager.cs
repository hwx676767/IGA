using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic;
using UnityEngine.SceneManagement;

public class LevelDataManager : MonoBehaviour
{
    public static LevelDataManager Instance { get; private set; }

    // 所有层级数据存储 <层号, 层数据>
    public Dictionary<int, LevelData> allLevels = new Dictionary<int, LevelData>();

    [Header("UI绑定")]
    public Text[] layerCountTexts = new Text[3]; // 0:上层 1:当前层 2:下层
    public Text[] quadrantTexts = new Text[4];   // 四个象限计数器

    [Header("调试")]
    public bool debugLogs = true;

    private bool isInitialized = false;

    void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            //DontDestroyOnLoad(gameObject);
            Initialize();
        }
        else
        {
            Destroy(gameObject);
        }
    }


    void Initialize()
    {
        if (isInitialized) return;

        // 清空现有数据
        allLevels.Clear();

        // 重新查找UI组件（确保场景切换后引用正确）
        FindUIComponents();

        isInitialized = true;

        if (debugLogs)
            Debug.Log("LevelDataManager 初始化完成");
    }

    void FindUIComponents()
    {
        // 查找NumPanel父对象
        GameObject numPanel = GameObject.Find("NumPanel");
    
        if (numPanel != null)
        {
            if (debugLogs)
                Debug.Log($"找到NumPanel，它有{numPanel.transform.childCount}个子对象");

            // 获取第一个子对象作为layerCountParent
            if (numPanel.transform.childCount > 0)
            {
                Transform layerCountParent = numPanel.transform.GetChild(0);
                layerCountTexts = new Text[3];
            
                // 假设第一个子对象下有3个Text组件对应三层显示
                for (int i = 0; i < Mathf.Min(3, layerCountParent.childCount); i++)
                {
                    layerCountTexts[i] = layerCountParent.GetChild(i)?.GetComponent<Text>();
                    if (debugLogs)
                        Debug.Log($"LayerText {i}: {(layerCountTexts[i] != null ? "找到" : "未找到")}");
                }
            }

            // 获取第二个子对象作为quadrantParent
            if (numPanel.transform.childCount > 1)
            {
                Transform quadrantParent = numPanel.transform.GetChild(1);
                quadrantTexts = new Text[4];
            
                // 假设第二个子对象下有4个Text组件对应四个象限
                for (int i = 0; i < Mathf.Min(4, quadrantParent.childCount); i++)
                {
                    quadrantTexts[i] = quadrantParent.GetChild(i)?.GetComponent<Text>();
                    if (debugLogs)
                        Debug.Log($"QuadrantText {i}: {(quadrantTexts[i] != null ? "找到" : "未找到")}");
                }
            }
        }
        else
        {
            Debug.LogError("未找到NumPanel对象！请确保场景中有名为'NumPanel'的GameObject");
        }
    }

    void OnEnable()
    {
        SceneManager.sceneLoaded += OnSceneLoaded;
    }

    void OnDisable()
    {
        SceneManager.sceneLoaded -= OnSceneLoaded;
    }

    void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        // 每次场景加载时重新初始化
        Initialize();
    }



    /// <summary>
    /// 注册新生成的层级及其物品
    /// </summary>
    public void RegisterLayer(int layerNumber, List<GameObject> items)
    {
        if (!allLevels.ContainsKey(layerNumber))
        {
            allLevels[layerNumber] = new LevelData()
            {
                layerNumber = layerNumber,
                items = new List<GameObject>(items) // 创建副本防止外部修改
            };

            if (debugLogs) 
                Debug.Log($"注册层 {layerNumber}，物品数: {items.Count}");
        }
    }

    /// <summary>
    /// 注销层级（当层被销毁时调用）
    /// </summary>
    public void UnregisterLayer(int layerNumber)
    {
        if (allLevels.Remove(layerNumber) && debugLogs)
        {
            Debug.Log($"注销层 {layerNumber}");
        }
    }

    /// <summary>
    /// 移除单个物品（当物品被收集/销毁时调用）
    /// </summary>
    /*
     * // 在物品交互脚本中：
void OnCollected() 
{
    int layer = Mathf.RoundToInt(transform.position.y / GameSettings.Instance.layerHeight);
    LevelDataManager.Instance.RemoveItem(layer, gameObject);
    Destroy(gameObject);
}
     */
    public void RemoveItem(int layerNumber, GameObject item)
    {
        if (allLevels.TryGetValue(layerNumber, out LevelData data))
        {
            data.items.Remove(item);
            if (debugLogs) 
                Debug.Log($"层 {layerNumber} 移除物品，剩余: {data.items.Count}");
        }
    }

    /// <summary>
    /// 更新所有UI显示（切换层时调用）
    /// </summary>
    public void UpdateDisplay(int currentCenterLayer)
    {
        UpdateLayerCounts(currentCenterLayer);
        UpdateQuadrantCounts(currentCenterLayer);
    }

    /// <summary>
    /// 更新三层物品数量显示
    /// </summary>
    void UpdateLayerCounts(int currentCenterLayer)
    {
        for (int i = -1; i <= 1; i++)
        {
            int layerToShow = currentCenterLayer + i;
            int uiIndex = i + 1; // 转换为UI数组索引

            if (allLevels.TryGetValue(layerToShow, out LevelData data))
            {
                layerCountTexts[uiIndex].text = $"L{layerToShow}: {data.items.Count}";
            }
            else
            {
                layerCountTexts[uiIndex].text = $"L{layerToShow}: 0";
            }
        }
    }

    /// <summary>
    /// 更新当前层象限统计
    /// </summary>
    void UpdateQuadrantCounts(int currentCenterLayer)
    {
        if (!allLevels.TryGetValue(currentCenterLayer, out LevelData currentData))
        {
            // 清空显示
            foreach (var text in quadrantTexts) text.text = "Q:0";
            return;
        }

        int[] quadrantCounts = new int[4];
        foreach (var item in currentData.items)
        {
            if (item == null) continue; // 防止物品已销毁
            
            Vector3 pos = item.transform.position;
            if (pos.x >= 0)
            {
                quadrantCounts[pos.z >= 0 ? 0 : 3]++;
            }
            else
            {
                quadrantCounts[pos.z >= 0 ? 1 : 2]++;
            }
        }

        // 更新UI文本
        for (int i = 0; i < 4; i++)
        {
            quadrantTexts[i].text = $"Q{i+1}:{quadrantCounts[i]}";
        }
    }

    /// <summary>
    /// 获取指定层的物品列表（只读）
    /// </summary>
    public IReadOnlyList<GameObject> GetItemsInLayer(int layerNumber)
    {
        return allLevels.TryGetValue(layerNumber, out LevelData data) ? 
            data.items.AsReadOnly() : null;
    }
}

/// <summary>
/// 单层数据存储结构
/// </summary>
[System.Serializable]
public class LevelData
{
    public int layerNumber;
    public List<GameObject> items = new List<GameObject>();

    // 可扩展添加其他层属性
    // public bool isExplored;
    // public Color layerColor;
}
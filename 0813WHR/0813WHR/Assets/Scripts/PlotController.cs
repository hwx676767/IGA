using UnityEngine;

public class PlotController : MonoBehaviour
{
    [SerializeField] private int maxCardsPerPlot = 3; // 每个地块最大卡牌数
    private int[] plotCardCounts; // 存储 36 个地块的当前卡牌数
    private GameObject[] plotPrefabs; // 存储 36 个地块的预制体实例

    void Awake()
    {
        plotCardCounts = new int[36]; // 初始卡牌数为0
        plotPrefabs = new GameObject[36];
    }

    public bool CanAddCard(int plotIndex)
    {
        if (plotIndex < 0 || plotIndex >= plotCardCounts.Length)
        {
            Debug.LogError($"无效的地块索引: {plotIndex}");
            return false;
        }
        return plotCardCounts[plotIndex] < maxCardsPerPlot;
    }

    public void AddCard(int plotIndex)
    {
        if (plotIndex < 0 || plotIndex >= plotCardCounts.Length)
        {
            Debug.LogError($"无效的地块索引: {plotIndex}");
            return;
        }
        plotCardCounts[plotIndex]++;
        Debug.Log($"地块 {plotIndex} 添加卡牌。当前数量：{plotCardCounts[plotIndex]}/{maxCardsPerPlot}");
    }

    public void SetPrefab(int plotIndex, GameObject prefab)
    {
        if (plotIndex < 0 || plotIndex >= plotPrefabs.Length)
        {
            Debug.LogError($"无效的地块索引: {plotIndex}");
            return;
        }
        plotPrefabs[plotIndex] = prefab;
    }

    public GameObject GetPrefab(int plotIndex)
    {
        if (plotIndex < 0 || plotIndex >= plotPrefabs.Length)
        {
            Debug.LogError($"无效的地块索引: {plotIndex}");
            return null;
        }
        return plotPrefabs[plotIndex];
    }

    public void ClearPrefab(int plotIndex)
    {
        if (plotIndex < 0 || plotIndex >= plotPrefabs.Length)
        {
            Debug.LogError($"无效的地块索引: {plotIndex}");
            return;
        }
        if (plotPrefabs[plotIndex] != null)
        {
            Destroy(plotPrefabs[plotIndex]);
            plotPrefabs[plotIndex] = null;
            Debug.Log($"地块 {plotIndex} 的预制体已清理");
        }
    }
}
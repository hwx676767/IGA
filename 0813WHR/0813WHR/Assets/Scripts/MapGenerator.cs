using UnityEngine;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections;
using Random = UnityEngine.Random;

public class MapGenerator : MonoBehaviour
{
    [SerializeField] private List<GameObject> prefabs; // 普通地块Prefab列表
    [SerializeField] private GameObject startPrefab; // 起点Prefab（可选）
    [SerializeField] private GameObject endPrefab; // 终点Prefab（可选）
    [SerializeField] public GameObject nullPlotPrefab; // 空地块Prefab（公开）

    // 36个地块位置（菱形布局）
    private List<Vector2> positions = new List<Vector2>
    {
        new Vector2(0f, -4.3f), new Vector2(0f, 4.2f), // 终点
        new Vector2(0f, -2.6f), new Vector2(0f, -0.9f), new Vector2(0f, 0.8f), new Vector2(0f, 2.5f),
        new Vector2(-1.5f, 0f), new Vector2(-1.5f, -1.7f), new Vector2(-1.5f, -3.4f), new Vector2(-1.5f, 1.7f), new Vector2(-1.5f, 3.4f),
        new Vector2(1.5f, 0f), new Vector2(1.5f, -1.7f), new Vector2(1.5f, -3.4f), new Vector2(1.5f, 1.7f), new Vector2(1.5f, 3.4f),
        new Vector2(4.5f, 0f), new Vector2(4.5f, 1.7f), new Vector2(4.5f, -1.7f),
        new Vector2(-4.5f, 0f), new Vector2(-4.5f, 1.7f), new Vector2(-4.5f, -1.7f),
        new Vector2(3f, -0.9f), new Vector2(6f, -0.9f), new Vector2(-3f, -0.9f), new Vector2(-6f, -0.9f),
        new Vector2(3f, -2.6f), new Vector2(-3f, -2.6f),
        new Vector2(3f, 0.8f), new Vector2(6f, 0.8f), new Vector2(-3f, 0.8f), new Vector2(-6f, 0.8f),
        new Vector2(3f, 2.5f), new Vector2(-3f, 2.5f),
        new Vector2(7.5f, 0f), new Vector2(-7.5f, 0f)
    };
    
    public List<Vector2> GetPositions()
    {
        return positions;
    }

    private Vector2 startPosition; // 起点坐标
    private Vector2 endPosition; // 终点坐标
    public event Action<List<Vector2>> OnPathFound; // 寻路完成事件

    void Start()
    {
        StartCoroutine(GenerateMapCoroutine());
    }

    private IEnumerator GenerateMapCoroutine()
    {
        yield return new WaitForSeconds(3f); // 延迟3秒
        GenerateMap();
    }

    private void GenerateMap()
    {
        if (prefabs.Count == 0)
        {
            Debug.LogError("普通地块Prefab列表为空，无法生成地块！");
            return;
        }
        if (nullPlotPrefab == null)
        {
            Debug.LogError("NullPlotPrefab 未赋值，无法生成空地块！");
            return;
        }

        // 计算最大和最小Y值以确定sortingOrder范围
        float minY = positions.Min(p => p.y);
        float maxY = positions.Max(p => p.y);
        float yRange = maxY - minY;
        if (yRange == 0) yRange = 1; // 防止除零

        // 初始化所有位置为未占用
        bool[] isOccupied = new bool[positions.Count];

        // 随机选择起点索引（0-35，排除终点索引1）
        List<int> availableIndices = Enumerable.Range(0, positions.Count).Where(i => i != 1).ToList();
        int startIndex = availableIndices[Random.Range(0, availableIndices.Count)];
        
        // 生成起点地块
        GameObject startObj = startPrefab ? startPrefab : prefabs[Random.Range(0, prefabs.Count)];
        GameObject startInstance = Instantiate(startObj, positions[startIndex], Quaternion.identity, transform); // 设置父物体
        SetPlotProperties(startInstance, startIndex, positions[startIndex].y, minY, yRange);
        isOccupied[startIndex] = true;
        startPosition = positions[startIndex]; // 记录起点坐标
        Debug.Log($"起点生成在 {startPosition} (plotIndex: {startIndex})");

        // 生成终点地块（索引1）
        GameObject endObj = endPrefab ? endPrefab : prefabs[Random.Range(0, prefabs.Count)];
        GameObject endInstance = Instantiate(endObj, positions[1], Quaternion.identity, transform); // 设置父物体
        SetPlotProperties(endInstance, 1, positions[1].y, minY, yRange);
        isOccupied[1] = true;
        endPosition = positions[1]; // 记录终点坐标
        Debug.Log($"终点生成在 {endPosition} (plotIndex: 1)");

        // 随机生成1-3个普通地块（排除起点和终点）
        availableIndices.Remove(startIndex);
        availableIndices = availableIndices.OrderBy(x => Random.value).Take(Random.Range(1, 4)).ToList();

        foreach (int index in availableIndices)
        {
            GameObject prefab = prefabs[Random.Range(0, prefabs.Count)];
            GameObject instance = Instantiate(prefab, positions[index], Quaternion.identity, transform); // 设置父物体
            SetPlotProperties(instance, index, positions[index].y, minY, yRange);
            isOccupied[index] = true;
            Debug.Log($"普通地块生成在 {positions[index]} (plotIndex: {index})");
        }

        // 填充剩余位置为NullPlot
        for (int index = 0; index < positions.Count; index++)
        {
            if (!isOccupied[index])
            {
                GameObject nullInstance = Instantiate(nullPlotPrefab, positions[index], Quaternion.identity, transform); // 设置父物体
                SetPlotProperties(nullInstance, index, positions[index].y, minY, yRange);
                Debug.Log($"空地块生成在 {positions[index]} (plotIndex: {index})");
            }
        }

    }

    public void FindPath()
    {
        AStarPathfinding pathfinding = FindObjectOfType<AStarPathfinding>();
        if (pathfinding != null)
        {
            List<Vector2> path = pathfinding.FindShortestPath(startPosition, endPosition);
            if (path != null)
            {
                Debug.Log("最短路径：" + string.Join(" -> ", path));
                pathfinding.VisualizePath(path);
            }
            else
            {
                Debug.Log("未找到从起点到终点的路径！");
            }
            OnPathFound?.Invoke(path); // 触发事件
        }
        else
        {
            Debug.LogError("未找到 AStarPathfinding 组件！");
            OnPathFound?.Invoke(null); // 触发事件，传递 null
        }
    }

    private void SetPlotProperties(GameObject plot, int plotIndex, float yPos, float minY, float yRange)
    {
        // 设置plotIndex
        InteractiveObject interactive = plot.GetComponent<InteractiveObject>();
        if (interactive != null)
        {
            interactive.GetType().GetField("plotIndex", System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance).SetValue(interactive, plotIndex);
        }
        else
        {
            Debug.LogWarning($"地块 {plot.name} 缺少 InteractiveObject 组件，无法设置 plotIndex");
        }

        // 设置渲染层级：Y轴越小，sortingOrder越大
        SpriteRenderer renderer = plot.GetComponent<SpriteRenderer>();
        int sortingOrder = 0;
        if (renderer != null)
        {
            float maxY = positions.Max(p => p.y);
            sortingOrder = Mathf.RoundToInt((maxY - yPos) / yRange * 100f);
            renderer.sortingOrder = sortingOrder;
            Debug.Log($"地块 {plot.name} (Y: {yPos}) 设置 sortingOrder: {sortingOrder}");
        }
        else
        {
            Debug.LogWarning($"地块 {plot.name} 缺少 SpriteRenderer 组件，无法设置 sortingOrder");
        }

        // 设置子物体 HoverImage 和 Overline 的 sortingOrder
        Transform hoverTransform = plot.transform.Find("HoverImage");
        if (hoverTransform != null)
        {
            SpriteRenderer hoverRenderer = hoverTransform.GetComponent<SpriteRenderer>();
            if (hoverRenderer != null)
            {
                hoverRenderer.sortingOrder = sortingOrder + 1;
                Debug.Log($"地块 {plot.name} 的 HoverImage 设置 sortingOrder: {sortingOrder + 1}");
            }
            else
            {
                Debug.LogWarning($"地块 {plot.name} 的 HoverImage 缺少 SpriteRenderer 组件");
            }
        }
        else
        {
            Debug.LogWarning($"地块 {plot.name} 下未找到 HoverImage 子物体");
        }

        Transform overlineTransform = plot.transform.Find("Overline");
        if (overlineTransform != null)
        {
            SpriteRenderer overlineRenderer = overlineTransform.GetComponent<SpriteRenderer>();
            if (overlineRenderer != null)
            {
                overlineRenderer.sortingOrder = sortingOrder - 1;
                Debug.Log($"地块 {plot.name} 的 Overline 设置 sortingOrder: {sortingOrder - 1}");
            }
            else
            {
                Debug.LogWarning($"地块 {plot.name} 的 Overline 缺少 SpriteRenderer 组件");
            }
        }
        else
        {
            Debug.LogWarning($"地块 {plot.name} 下未找到 Overline 子物体");
        }
    }

    public Vector2 GetStartPosition() => startPosition;
    public Vector2 GetEndPosition() => endPosition;
}
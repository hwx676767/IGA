using UnityEngine;
using System.Collections.Generic;

public class Pathfinding : MonoBehaviour
{
    public MapGenerator mapGenerator;

    public Vector2 path1Start = new Vector2(-0.4f, -1.4f);
    public Vector2 path1End = new Vector2(-5.4f, -1.5f);
    public Vector2 path2Start = new Vector2(4.4f, -1.4f);
    public Vector2 path2End = new Vector2(-5.0f, -0.7f);

    public List<List<Vector2Int>> paths { get; private set; } = new List<List<Vector2Int>>();

    void Start()
    {
        // 转换世界坐标到网格坐标
        Vector2Int path1StartGrid = mapGenerator.WorldToGrid(path1Start);
        Vector2Int path1EndGrid = mapGenerator.WorldToGrid(path1End);
        Vector2Int path2StartGrid = mapGenerator.WorldToGrid(path2Start);
        Vector2Int path2EndGrid = mapGenerator.WorldToGrid(path2End);

        // 生成并存储路径
        paths.Add(FindPath(path1StartGrid, path1EndGrid));
        paths.Add(FindPath(path2StartGrid, path2EndGrid));

        // 绘制路径
        DrawPath(paths[0], Color.blue);
        DrawPath(paths[1], Color.magenta);

        if (paths[0].Count == 0 || paths[1].Count == 0)
        {
            Debug.LogError("Failed to initialize one or both paths!");
        }
    }

    // A*算法实现
    List<Vector2Int> FindPath(Vector2Int start, Vector2Int end)
    {
        List<Vector2Int> path = new List<Vector2Int>();
        if (!IsValidPosition(start) || !IsValidPosition(end)) return path;

        // 优先队列
        PriorityQueue<Vector2Int, float> openList = new PriorityQueue<Vector2Int, float>();
        Dictionary<Vector2Int, Vector2Int> cameFrom = new Dictionary<Vector2Int, Vector2Int>();
        Dictionary<Vector2Int, float> gScore = new Dictionary<Vector2Int, float>();
        Dictionary<Vector2Int, float> fScore = new Dictionary<Vector2Int, float>();

        openList.Enqueue(start, 0);
        gScore[start] = 0;
        fScore[start] = Heuristic(start, end);

        while (openList.Count > 0)
        {
            Vector2Int current = openList.Dequeue();
            if (current == end)
            {
                // 重建路径
                while (cameFrom.ContainsKey(current))
                {
                    path.Add(current);
                    current = cameFrom[current];
                }
                path.Add(start);
                path.Reverse();
                return path;
            }

            // 检查邻居
            foreach (Vector2Int neighbor in GetNeighbors(current))
            {
                float moveCost = mapGenerator.GetNodeState(neighbor.x, neighbor.y) == 2 ? 2f : 1f; // HighGround成本更高
                float tentativeGScore = gScore[current] + moveCost;

                if (!gScore.ContainsKey(neighbor) || tentativeGScore < gScore[neighbor])
                {
                    cameFrom[neighbor] = current;
                    gScore[neighbor] = tentativeGScore;
                    fScore[neighbor] = tentativeGScore + Heuristic(neighbor, end);
                    openList.Enqueue(neighbor, fScore[neighbor]);
                }
            }
        }
        return path; // 无路径
    }

    // 获取邻居（上下左右）
    List<Vector2Int> GetNeighbors(Vector2Int pos)
    {
        List<Vector2Int> neighbors = new List<Vector2Int>();
        int[] dx = { 0, 0, 1, -1 };
        int[] dy = { 1, -1, 0, 0 };
        for (int i = 0; i < 4; i++)
        {
            Vector2Int neighbor = new Vector2Int(pos.x + dx[i], pos.y + dy[i]);
            if (IsValidPosition(neighbor) && mapGenerator.GetNodeState(neighbor.x, neighbor.y) != 1) // 非Blocked
                neighbors.Add(neighbor);
        }
        return neighbors;
    }
    
    public Vector2 GetWorldPosition(int pathIndex, int pointIndex)
    {
        if (pathIndex < 0 || pathIndex >= paths.Count || pointIndex < 0 || pointIndex >= paths[pathIndex].Count)
        {
            Debug.LogError($"Invalid pathIndex {pathIndex} or pointIndex {pointIndex}");
            return Vector2.zero;
        }
        Vector2Int gridPos = paths[pathIndex][pointIndex];
        return mapGenerator.GetNodePosition(gridPos.x, gridPos.y);
    }

    // 启发式函数（曼哈顿距离）
    float Heuristic(Vector2Int a, Vector2Int b)
    {
        return Mathf.Abs(a.x - b.x) + Mathf.Abs(a.y - b.y);
    }

    // 检查位置有效性
    bool IsValidPosition(Vector2Int pos)
    {
        return pos.x >= 0 && pos.x < mapGenerator.width && pos.y >= 0 && pos.y < mapGenerator.height;
    }

    // 绘制路径（使用Debug.DrawLine）
    void DrawPath(List<Vector2Int> path, Color color)
    {
        if (path.Count < 2) return;

        for (int i = 0; i < path.Count - 1; i++)
        {
            Vector2 startPos = mapGenerator.GetNodePosition(path[i].x, path[i].y);
            Vector2 endPos = mapGenerator.GetNodePosition(path[i + 1].x, path[i + 1].y);
            Debug.DrawLine(new Vector3(startPos.x, startPos.y, 0), new Vector3(endPos.x, endPos.y, 0), color, 100f); // 持续100秒用于调试
        }
    }
}

// 优先队列实现 
public class PriorityQueue<T, P> where P : System.IComparable<P>
{
    private List<(T item, P priority)> elements = new List<(T, P)>();

    public int Count => elements.Count;

    public void Enqueue(T item, P priority)
    {
        elements.Add((item, priority));
        elements.Sort((a, b) => a.priority.CompareTo(b.priority));
    }

    public T Dequeue()
    {
        if (elements.Count == 0) throw new System.InvalidOperationException("Queue is empty");
        var item = elements[0].item;
        elements.RemoveAt(0);
        return item;
    }
}
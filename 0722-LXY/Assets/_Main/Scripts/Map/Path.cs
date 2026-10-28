using UnityEngine;
using System.Collections.Generic;

public class Path : MonoBehaviour
{
    public List<List<Vector2Int>> paths = new List<List<Vector2Int>>();
    private GameMap gameMap;

    private void Start()
    {
        gameMap = FindObjectOfType<GameMap>();
        ValidatePaths();
    }

    public Vector3 GetWorldPosition(int pathIndex, int waypointIndex)
    {
        if (pathIndex < 0 || pathIndex >= paths.Count || waypointIndex < 0 || waypointIndex >= paths[pathIndex].Count)
        {
            Debug.LogError($"Invalid pathIndex {pathIndex} or waypointIndex {waypointIndex}");
            return Vector3.zero;
        }
        return gameMap.GridToWorld(paths[pathIndex][waypointIndex]);
    }

    public int GetPathWaypointCount(int pathIndex)
    {
        if (pathIndex < 0 || pathIndex >= paths.Count)
            return 0;
        return paths[pathIndex].Count;
    }

    public void ValidatePaths()
    {
        if (gameMap == null)
        {
            Debug.LogError("GameMap not found!");
            return;
        }

        for (int pathIndex = 0; pathIndex < paths.Count; pathIndex++)
        {
            var path = paths[pathIndex];
            for (int i = 0; i < path.Count; i++)
            {
                if (gameMap.GetTileType(path[i]) != TileType.Walkable)
                {
                    Debug.LogError($"Invalid path point at {path[i]} in path {pathIndex}: not walkable!");
                }
                if (i > 0)
                {
                    Vector2Int diff = path[i] - path[i - 1];
                    if (Mathf.Abs(diff.x) + Mathf.Abs(diff.y) != 1)
                    {
                        Debug.LogError($"Invalid path step at {path[i]} in path {pathIndex}: not four-directional!");
                    }
                }
            }
        }
    }

    private void OnDrawGizmos()
    {
        if (paths == null || gameMap == null) return;

        Color[] pathColors = { Color.blue, Color.red };
        for (int pathIndex = 0; pathIndex < paths.Count; pathIndex++)
        {
            Gizmos.color = pathColors[pathIndex % pathColors.Length];
            var path = paths[pathIndex];
            for (int i = 0; i < path.Count - 1; i++)
            {
                Vector3 p1 = gameMap.GridToWorld(path[i]);
                Vector3 p2 = gameMap.GridToWorld(path[i + 1]);
                Gizmos.DrawLine(p1, p2);
            }
        }
    }
}
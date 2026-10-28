using UnityEngine;
using UnityEditor;
using UnityEngine.Tilemaps;
using System.Collections.Generic;

[CustomEditor(typeof(Path))]
public class PathGeneratorEditor : Editor
{
    private Path path;
    private Vector2Int startPos1, endPos1;
    private Vector2Int startPos2, endPos2;
    private int selectedPathIndex = 0;

    private void OnEnable()
    {
        path = (Path)target;
    }

    public override void OnInspectorGUI()
    {
        base.OnInspectorGUI();

        EditorGUILayout.Space();
        EditorGUILayout.LabelField("Path Generator", EditorStyles.boldLabel);

        selectedPathIndex = EditorGUILayout.IntSlider("Selected Path", selectedPathIndex, 0, 1);

        EditorGUILayout.LabelField("Path 1", EditorStyles.boldLabel);
        startPos1 = EditorGUILayout.Vector2IntField("Start Position 1", startPos1);
        endPos1 = EditorGUILayout.Vector2IntField("End Position 1", endPos1);

        EditorGUILayout.LabelField("Path 2", EditorStyles.boldLabel);
        startPos2 = EditorGUILayout.Vector2IntField("Start Position 2", startPos2);
        endPos2 = EditorGUILayout.Vector2IntField("End Position 2", endPos2);

        if (GUILayout.Button("Generate Paths"))
        {
            GeneratePaths();
        }

        if (GUILayout.Button("Clear Paths"))
        {
            path.paths.Clear();
            EditorUtility.SetDirty(path);
        }
    }

    private void OnSceneGUI()
    {
        HandleUtility.AddDefaultControl(GUIUtility.GetControlID(FocusType.Passive));
        if (Event.current.type == EventType.MouseDown && Event.current.button == 0)
        {
            Vector3 mousePos = HandleUtility.GUIPointToWorldRay(Event.current.mousePosition).origin;
            GameMap gameMap = FindObjectOfType<GameMap>();
            if (gameMap == null)
            {
                Debug.LogError("GameMap not found in scene!");
                return;
            }
            Vector2Int gridPos = gameMap.WorldToGrid(mousePos);
            if (selectedPathIndex == 0)
            {
                if (Event.current.shift)
                {
                    startPos1 = gridPos;
                    Debug.Log($"Selected Start 1: {startPos1}, Type: {gameMap.GetTileType(gridPos)}");
                }
                else
                {
                    endPos1 = gridPos;
                    Debug.Log($"Selected End 1: {endPos1}, Type: {gameMap.GetTileType(gridPos)}");
                }
            }
            else
            {
                if (Event.current.shift)
                {
                    startPos2 = gridPos;
                    Debug.Log($"Selected Start 2: {startPos2}, Type: {gameMap.GetTileType(gridPos)}");
                }
                else
                {
                    endPos2 = gridPos;
                    Debug.Log($"Selected End 2: {endPos2}, Type: {gameMap.GetTileType(gridPos)}");
                }
            }
            Event.current.Use();
            EditorUtility.SetDirty(target);
        }

        GameMap gameMapForGizmos = FindObjectOfType<GameMap>();
        if (gameMapForGizmos != null)
        {
            Handles.color = Color.red;
            Handles.DrawWireCube(gameMapForGizmos.GridToWorld(startPos1), Vector3.one * 0.8f);
            Handles.color = Color.yellow;
            Handles.DrawWireCube(gameMapForGizmos.GridToWorld(endPos1), Vector3.one * 0.8f);
            Handles.color = Color.green;
            Handles.DrawWireCube(gameMapForGizmos.GridToWorld(startPos2), Vector3.one * 0.8f);
            Handles.color = Color.cyan;
            Handles.DrawWireCube(gameMapForGizmos.GridToWorld(endPos2), Vector3.one * 0.8f);
        }
    }

    private void GeneratePaths()
    {
        GameMap gameMap = FindObjectOfType<GameMap>();
        if (gameMap == null)
        {
            Debug.LogError("GameMap not found in scene!");
            return;
        }

        path.paths.Clear();

        Debug.Log($"Path 1: Start={startPos1}, Type={gameMap.GetTileType(startPos1)}, End={endPos1}, Type={gameMap.GetTileType(endPos1)}");
        if (gameMap.GetTileType(startPos1) != TileType.Walkable)
        {
            Debug.LogError($"Start position 1 {startPos1} is not Walkable!");
            return;
        }
        if (gameMap.GetTileType(endPos1) != TileType.Walkable)
        {
            Debug.LogError($"End position 1 {endPos1} is not Walkable!");
            return;
        }
        List<Vector2Int> path1 = FindPath(gameMap, startPos1, endPos1);
        if (path1 == null)
        {
            Debug.LogError("No valid path found for Path 1!");
            return;
        }
        path.paths.Add(path1);

        Debug.Log($"Path 2: Start={startPos2}, Type={gameMap.GetTileType(startPos2)}, End={endPos2}, Type={gameMap.GetTileType(endPos2)}");
        if (gameMap.GetTileType(startPos2) != TileType.Walkable)
        {
            Debug.LogError($"Start position 2 {startPos2} is not Walkable!");
            return;
        }
        if (gameMap.GetTileType(endPos2) != TileType.Walkable)
        {
            Debug.LogError($"End position 2 {endPos2} is not Walkable!");
            return;
        }
        List<Vector2Int> path2 = FindPath(gameMap, startPos2, endPos2);
        if (path2 == null)
        {
            Debug.LogError("No valid path found for Path 2!");
            return;
        }
        path.paths.Add(path2);

        path.ValidatePaths();
        EditorUtility.SetDirty(path);
        Debug.Log("Paths generated successfully!");
    }

    private List<Vector2Int> FindPath(GameMap gameMap, Vector2Int start, Vector2Int end)
    {
        if (gameMap.GetTileType(start) != TileType.Walkable || gameMap.GetTileType(end) != TileType.Walkable)
        {
            Debug.LogError($"Invalid start or end tile: Start={gameMap.GetTileType(start)}, End={gameMap.GetTileType(end)}");
            return null;
        }

        Queue<Vector2Int> queue = new Queue<Vector2Int>();
        Dictionary<Vector2Int, Vector2Int> cameFrom = new Dictionary<Vector2Int, Vector2Int>();
        queue.Enqueue(start);
        cameFrom[start] = start;

        Vector2Int[] directions = { Vector2Int.up, Vector2Int.down, Vector2Int.left, Vector2Int.right };

        while (queue.Count > 0)
        {
            Vector2Int current = queue.Dequeue();
            if (current == end)
                break;

            foreach (var dir in directions)
            {
                Vector2Int next = current + dir;
                if (gameMap.GetTileType(next) == TileType.Walkable && !cameFrom.ContainsKey(next))
                {
                    queue.Enqueue(next);
                    cameFrom[next] = current;
                }
            }
        }

        if (!cameFrom.ContainsKey(end))
        {
            Debug.LogError("Cannot reach end position!");
            return null;
        }

        List<Vector2Int> path = new List<Vector2Int>();
        Vector2Int pos = end;
        while (pos != start)
        {
            path.Add(pos);
            pos = cameFrom[pos];
        }
        path.Add(start);
        path.Reverse();
        return path;
    }
}
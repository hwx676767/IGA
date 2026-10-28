using UnityEngine;
using System.Collections.Generic;
using System.Linq;
using System.Collections;

public class AStarPathfinding : MonoBehaviour
{
    private MapGenerator mapGenerator;
    private List<Vector2> positions;

    private void Awake()
    {
        mapGenerator = GetComponent<MapGenerator>();
        if (mapGenerator == null)
        {
            Debug.LogError("AStarPathfinding requires MapGenerator component on the same GameObject!");
        }
    }

    public List<Vector2> FindShortestPath(Vector2 start, Vector2 end)
    {
        positions = mapGenerator.GetPositions();

        if (!positions.Contains(start) || !positions.Contains(end))
        {
            Debug.LogError("Start or end position is not in the map's position list!");
            return null;
        }

        List<Vector2> openList = new List<Vector2> { start };
        HashSet<Vector2> closedList = new HashSet<Vector2>();

        Dictionary<Vector2, float> gScore = new Dictionary<Vector2, float> { { start, 0 } };
        Dictionary<Vector2, float> fScore = new Dictionary<Vector2, float> { { start, Heuristic(start, end) } };
        Dictionary<Vector2, Vector2> cameFrom = new Dictionary<Vector2, Vector2>();

        while (openList.Count > 0)
        {
            Vector2 current = openList.OrderBy(pos => fScore.ContainsKey(pos) ? fScore[pos] : float.MaxValue).First();

            if (current == end)
            {
                return ReconstructPath(cameFrom, current);
            }

            openList.Remove(current);
            closedList.Add(current);

            List<Vector2> neighbors = GetNeighbors(current);

            foreach (Vector2 neighbor in neighbors)
            {
                if (closedList.Contains(neighbor))
                    continue;

                float tentativeGScore = gScore[current] + Vector2.Distance(current, neighbor);

                if (!openList.Contains(neighbor))
                {
                    openList.Add(neighbor);
                }
                else if (tentativeGScore >= (gScore.ContainsKey(neighbor) ? gScore[neighbor] : float.MaxValue))
                {
                    continue;
                }

                cameFrom[neighbor] = current;
                gScore[neighbor] = tentativeGScore;
                fScore[neighbor] = gScore[neighbor] + Heuristic(neighbor, end);
            }
        }

        return null;
    }

    private List<Vector2> GetNeighbors(Vector2 position)
    {
        List<Vector2> neighbors = new List<Vector2>();
        foreach (Vector2 pos in positions)
        {
            if (Vector2.Distance(position, pos) < 2.0f && pos != position)
            {
                GameObject tile = GetTileAtPosition(pos);
                if (tile != null && (tile != mapGenerator.nullPlotPrefab || pos == mapGenerator.GetEndPosition()))
                {
                    neighbors.Add(pos);
                }
            }
        }
        return neighbors;
    }

    private GameObject GetTileAtPosition(Vector2 position)
    {
        foreach (Transform child in mapGenerator.transform)
        {
            if (Vector2.Distance(child.position, position) < 0.01f)
            {
                return child.gameObject;
            }
        }
        return null;
    }

    private float Heuristic(Vector2 a, Vector2 b)
    {
        return Mathf.Abs(a.x - b.x) + Mathf.Abs(a.y - b.y);
    }

    private List<Vector2> ReconstructPath(Dictionary<Vector2, Vector2> cameFrom, Vector2 current)
    {
        List<Vector2> path = new List<Vector2> { current };
        while (cameFrom.ContainsKey(current))
        {
            current = cameFrom[current];
            path.Add(current);
        }
        path.Reverse();
        return path;
    }

    public void VisualizePath(List<Vector2> path)
    {
        if (path == null || path.Count == 0)
        {
            Debug.LogWarning("No path to visualize!");
            return;
        }

        StartCoroutine(VisualizePathCoroutine(path));
    }

    private IEnumerator VisualizePathCoroutine(List<Vector2> path)
    {
        foreach (Vector2 position in path)
        {
            GameObject tile = GetTileAtPosition(position);
            if (tile != null)
            {
                // Get the original sortingOrder and state
                SpriteRenderer tileRenderer = tile.GetComponent<SpriteRenderer>();
                int originalOrder = tileRenderer != null ? tileRenderer.sortingOrder : 0;

                Transform hoverTransform = tile.transform.Find("HoverImage");
                SpriteRenderer hoverRenderer = hoverTransform != null ? hoverTransform.GetComponent<SpriteRenderer>() : null;
                int hoverOriginalOrder = hoverRenderer != null ? hoverRenderer.sortingOrder : 0;

                Transform overlineTransform = tile.transform.Find("Overline");
                SpriteRenderer overlineRenderer = overlineTransform != null ? overlineTransform.GetComponent<SpriteRenderer>() : null;
                int overlineOriginalOrder = overlineRenderer != null ? overlineRenderer.sortingOrder : 0;
                bool overlineWasEnabled = overlineRenderer != null ? overlineRenderer.enabled : false;

                // Hide all renderers initially
                //if (tileRenderer != null) tileRenderer.enabled = false;
                if (hoverRenderer != null) hoverRenderer.enabled = false;
                if (overlineRenderer != null) overlineRenderer.enabled = false;

                // Show and increase sortingOrder by 100
                if (tileRenderer != null)
                {
                    tileRenderer.sortingOrder += 100;
                }
                if (hoverRenderer != null)
                {
                    hoverRenderer.sortingOrder += 100;
                }
                if (overlineRenderer != null)
                {
                    overlineRenderer.enabled = true; // Activate Overline
                    overlineRenderer.sortingOrder += 100;
                }

                // Wait for the "bubble" effect
                yield return new WaitForSeconds(0.2f);

                // Hide current tile before moving to next
                //if (tileRenderer != null) tileRenderer.enabled = false;
                if (hoverRenderer != null) hoverRenderer.enabled = false;
                if (overlineRenderer != null) overlineRenderer.enabled = false;
            }
        }

        // Restore the last tile's state (end position)
        GameObject lastTile = GetTileAtPosition(path[path.Count - 1]);
        if (lastTile != null)
        {
            SpriteRenderer lastTileRenderer = lastTile.GetComponent<SpriteRenderer>();
            Transform lastHoverTransform = lastTile.transform.Find("HoverImage");
            SpriteRenderer lastHoverRenderer = lastHoverTransform != null ? lastHoverTransform.GetComponent<SpriteRenderer>() : null;
            Transform lastOverlineTransform = lastTile.transform.Find("Overline");
            SpriteRenderer lastOverlineRenderer = lastOverlineTransform != null ? lastOverlineTransform.GetComponent<SpriteRenderer>() : null;

            if (lastTileRenderer != null) lastTileRenderer.enabled = true;
            if (lastHoverRenderer != null) lastHoverRenderer.enabled = true;
            if (lastOverlineRenderer != null) lastOverlineRenderer.enabled = true;
        }
    }
}
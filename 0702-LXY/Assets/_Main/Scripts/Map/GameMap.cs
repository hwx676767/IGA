using UnityEngine;
using UnityEngine.Tilemaps;
using System.Collections.Generic;

public enum TileType
{
    Walkable, // 敌人可移动
    Blocked,  // 障碍物
    HighGround // 可部署干员
}

public class GameMap : MonoBehaviour
{
    public Grid grid;
    public Tilemap walkableMap;
    public Tilemap blockedMap;
    public Tilemap highGroundMap;
    private Dictionary<Vector2Int, Operator> occupiedTiles = new Dictionary<Vector2Int, Operator>(); // 记录占用的格子

    public TileType GetTileType(Vector2Int gridPos)
    {
        if (highGroundMap.HasTile((Vector3Int)gridPos))
            return TileType.HighGround;
        if (blockedMap.HasTile((Vector3Int)gridPos))
            return TileType.Blocked;
        if (walkableMap.HasTile((Vector3Int)gridPos))
            return TileType.Walkable;
        return TileType.Blocked;
    }

    public Vector3 GridToWorld(Vector2Int gridPos)
    {
        return grid.GetCellCenterWorld((Vector3Int)gridPos);
    }

    public Vector2Int WorldToGrid(Vector3 worldPos)
    {
        return (Vector2Int)grid.WorldToCell(worldPos);
    }

    // 检查格子是否可放置
    public bool CanPlaceOperator(Vector2Int gridPos, TileType requiredTileType)
    {
        return GetTileType(gridPos) == requiredTileType && !occupiedTiles.ContainsKey(gridPos);
    }

    // 占用格子
    public void OccupyTile(Vector2Int gridPos, Operator operatorInstance)
    {
        if (CanPlaceOperator(gridPos, operatorInstance.placedTileType))
        {
            occupiedTiles[gridPos] = operatorInstance;
        }
    }

    // 释放格子（例如移除干员）
    public void ReleaseTile(Vector2Int gridPos)
    {
        occupiedTiles.Remove(gridPos);
    }

    private void OnDrawGizmos()
    {
        if (walkableMap == null || blockedMap == null || highGroundMap == null) return;

        foreach (var pos in walkableMap.cellBounds.allPositionsWithin)
        {
            if (walkableMap.HasTile(pos))
            {
                Gizmos.color = occupiedTiles.ContainsKey((Vector2Int)pos) ? Color.red : Color.green;
                Gizmos.DrawWireCube(walkableMap.GetCellCenterWorld(pos), Vector3.one * 0.9f);
            }
        }
        foreach (var pos in blockedMap.cellBounds.allPositionsWithin)
        {
            if (blockedMap.HasTile(pos))
            {
                Gizmos.color = Color.gray;
                Gizmos.DrawWireCube(blockedMap.GetCellCenterWorld(pos), Vector3.one * 0.9f);
            }
        }
        foreach (var pos in highGroundMap.cellBounds.allPositionsWithin)
        {
            if (highGroundMap.HasTile(pos))
            {
                Gizmos.color = occupiedTiles.ContainsKey((Vector2Int)pos) ? Color.red : Color.blue;
                Gizmos.DrawWireCube(highGroundMap.GetCellCenterWorld(pos), Vector3.one * 0.9f);
            }
        }
    }
}
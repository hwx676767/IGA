using RTSBuildingSystem;
using UnityEngine;

public class PlacementArea : MonoBehaviour
{
    public TerrainType terrainType;  

    public bool IsBuildable(TerrainType buildingTerrainType)
    {
        if (terrainType == buildingTerrainType)
        {
            return true;
        }
        
        return false;
    }
}
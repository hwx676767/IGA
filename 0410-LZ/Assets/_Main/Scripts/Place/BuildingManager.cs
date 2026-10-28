using System.Collections.Generic;
using UnityEngine;

namespace RTSBuildingSystem
{
    public enum BuildingCategory
    {
        Plant,      // 植物类建筑
        Suburb,     // 郊区类建筑
        Room        // 房间类建筑
    }

    public class BuildingManager : MonoBehaviour
    {
        [Header("建筑列表管理")]
        [SerializeField] private List<PlacementObject> allBuildings = new List<PlacementObject>();
        
        // 按类型分类的建筑列表
        private List<PlacementObject> plantBuildings = new List<PlacementObject>();
        private List<PlacementObject> suburbBuildings = new List<PlacementObject>();
        private List<PlacementObject> roomBuildings = new List<PlacementObject>();
        
        // 公开的属性（只读）
        public IReadOnlyList<PlacementObject> AllBuildings => allBuildings;
        public IReadOnlyList<PlacementObject> PlantBuildings => plantBuildings;
        public IReadOnlyList<PlacementObject> SuburbBuildings => suburbBuildings;
        public IReadOnlyList<PlacementObject> RoomBuildings => roomBuildings;
        
        // 单例
        public static BuildingManager Instance { get; private set; }
        
        private void Awake()
        {
            if (Instance == null)
            {
                Instance = this;
            }
            else
            {
                Destroy(gameObject);
            }
        }
        
        /// <summary>
        /// 注册建筑（自动识别类型）
        /// </summary>
        public void RegisterBuilding(PlacementObject building)
        {
            if (building == null || allBuildings.Contains(building)) return;
            
            allBuildings.Add(building);
            
            // 根据建筑类型添加到对应列表
            AddToCategoryList(building);
            
            Debug.Log($"建筑已注册: {building.gameObject.name} (类型: {GetBuildingCategory(building)})");
        }
        
        /// <summary>
        /// 注销建筑
        /// </summary>
        public void UnregisterBuilding(PlacementObject building)
        {
            if (building == null) return;
            
            allBuildings.Remove(building);
            
            // 从所有分类列表中移除
            plantBuildings.Remove(building);
            suburbBuildings.Remove(building);
            roomBuildings.Remove(building);
            
            Debug.Log($"建筑已注销: {building.gameObject.name}");
        }
        
        /// <summary>
        /// 根据建筑类型添加到对应列表
        /// </summary>
        private void AddToCategoryList(PlacementObject building)
        {
            BuildingCategory category = GetBuildingCategory(building);
            
            switch (category)
            {
                case BuildingCategory.Plant:
                    plantBuildings.Add(building);
                    break;
                case BuildingCategory.Suburb:
                    suburbBuildings.Add(building);
                    break;
                case BuildingCategory.Room:
                    roomBuildings.Add(building);
                    break;
            }
        }
        
        /// <summary>
        /// 获取建筑类型（通过allowedTerrains判断）
        /// </summary>
        private BuildingCategory GetBuildingCategory(PlacementObject building)
        {
            // 通过allowedTerrains判断建筑类型
            if (building.allowedTerrains.Contains(TerrainType.Plant))
                return BuildingCategory.Plant;
            else if (building.allowedTerrains.Contains(TerrainType.Suburb))
                return BuildingCategory.Suburb;
            else if (building.allowedTerrains.Contains(TerrainType.Room))
                return BuildingCategory.Room;
            
            // 默认返回Plant
            return BuildingCategory.Plant;
        }
        
        /// <summary>
        /// 右键拆除（简单直接）
        /// </summary>
        private void Update()
        {
            if (Input.GetMouseButtonDown(1))
            {
                Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
                RaycastHit hit;
                
                if (Physics.Raycast(ray, out hit))
                {
                    PlacementObject building = hit.collider.GetComponentInParent<PlacementObject>();
                    if (building != null)
                    {
                        building.Demolish();
                    }
                }
            }
        }
        
        /// <summary>
        /// 获取指定类型的建筑列表
        /// </summary>
        public List<PlacementObject> GetBuildingsByCategory(BuildingCategory category)
        {
            switch (category)
            {
                case BuildingCategory.Plant:
                    return new List<PlacementObject>(plantBuildings);
                case BuildingCategory.Suburb:
                    return new List<PlacementObject>(suburbBuildings);
                case BuildingCategory.Room:
                    return new List<PlacementObject>(roomBuildings);
                default:
                    return new List<PlacementObject>();
            }
        }
        
        /// <summary>
        /// 获取指定类型建筑的数量
        /// </summary>
        public int GetBuildingCount(BuildingCategory category)
        {
            switch (category)
            {
                case BuildingCategory.Plant:
                    return plantBuildings.Count;
                case BuildingCategory.Suburb:
                    return suburbBuildings.Count;
                case BuildingCategory.Room:
                    return roomBuildings.Count;
                default:
                    return 0;
            }
        }
        
        /// <summary>
        /// 清空所有建筑
        /// </summary>
        public void ClearAllBuildings()
        {
            List<PlacementObject> buildingsToClear = new List<PlacementObject>(allBuildings);
            foreach (var building in buildingsToClear)
            {
                if (building != null)
                    building.Demolish();
            }
        }
    }
}
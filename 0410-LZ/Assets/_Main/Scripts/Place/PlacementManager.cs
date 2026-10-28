using UnityEngine;
using UnityEngine.EventSystems;
using System.Collections.Generic;

namespace RTSBuildingSystem
{
    public class PlacementManager : MonoBehaviour
    {
        public static PlacementManager instance;

        [Header("当前选中")]
        public PlaceCard currentCard;
        public GameObject currentBuilding;

        [Header("网格设置")]
        public float gridSize = 1f;

        private Camera cam;
        private PlacementObject currentObjectScript;

        private int currentRotationIndex = 0;
        private readonly float[] allowedRotations = { 0f, 90f, 180f, 270f };

        // 已占用格子
        private HashSet<Vector2Int> occupiedGrid = new HashSet<Vector2Int>();

        private void Awake() => instance = this;

        private void Start()
        {
            cam = Camera.main;
        }

        private void Update()
        {
            if (currentBuilding == null) return;

            FollowMouse();

            if (Input.GetMouseButtonDown(1))
                CancelCurrentPlacement();

            if (Input.GetMouseButtonDown(0) && !EventSystem.current.IsPointerOverGameObject())
                TryPlaceBuilding();

            HandleRotationInput();
        }

        // ===================== 鼠标跟随 =====================

        private void FollowMouse()
        {
            Ray ray = cam.ScreenPointToRay(Input.mousePosition);

            if (Physics.Raycast(ray, out RaycastHit hit, 500f))
            {
                Vector2Int gridPos = WorldToGrid(hit.point);
                Vector3 worldPos = GridToWorld(gridPos);

                worldPos.y = hit.point.y;

                currentBuilding.transform.position = worldPos;

                UpdateOverlayColor(gridPos);
            }
        }

        // ===================== 网格转换 =====================

        private Vector2Int WorldToGrid(Vector3 worldPos)
        {
            int x = Mathf.RoundToInt(worldPos.x / gridSize);
            int y = Mathf.RoundToInt(worldPos.z / gridSize);
            return new Vector2Int(x, y);
        }

        private Vector3 GridToWorld(Vector2Int gridPos)
        {
            return new Vector3(gridPos.x * gridSize, 0, gridPos.y * gridSize);
        }

        // ===================== 旋转 =====================

        private void HandleRotationInput()
        {
            bool rotated = false;

            if (Input.GetKeyDown(KeyCode.A))
            {
                currentRotationIndex = (currentRotationIndex + 3) % 4;
                rotated = true;
            }

            if (Input.GetKeyDown(KeyCode.D))
            {
                currentRotationIndex = (currentRotationIndex + 1) % 4;
                rotated = true;
            }

            if (rotated)
            {
                ApplyRotation();
                UpdateOccupiedCells();
            }
        }

        // 旋转模型
        private void ApplyRotation()
        {
            currentBuilding.transform.rotation =
                Quaternion.Euler(0, allowedRotations[currentRotationIndex], 0);
        }

        private void UpdateOccupiedCells()
        {
            if (currentObjectScript == null) return;

            currentObjectScript.UpdateOccupiedCells(currentRotationIndex);
        }

        // ===================== 占用检测 =====================

        private List<Vector2Int> GetWorldOccupiedCells(Vector2Int origin)
        {
            List<Vector2Int> result = new List<Vector2Int>();

            foreach (var cell in currentObjectScript.OccupiedCells)
            {
                result.Add(origin + cell);
            }

            return result;
        }

        private bool IsPositionValid(Vector2Int origin)
        {
            var cells = GetWorldOccupiedCells(origin);

            foreach (var cell in cells)
            {
                if (occupiedGrid.Contains(cell))
                    return false;
            }

            return true;
        }

        // ===================== 地形检测 =====================

        /// <summary>
        /// 检查所有占用的格子是否都支持当前建筑的地形类型
        /// </summary>
        private bool IsTerrainValid(List<Vector2Int> occupiedCells)
        {
            // 如果没有设置允许的地形类型，则默认所有地形都允许
            if (currentObjectScript.allowedTerrains == null || currentObjectScript.allowedTerrains.Count == 0)
                return true;

            foreach (var cell in occupiedCells)
            {
                Vector3 worldPos = GridToWorld(cell);

                // 从指定位置向下发射射线检测地块
                Ray ray = new Ray(worldPos + Vector3.up * 10f, Vector3.down);

                if (Physics.Raycast(ray, out RaycastHit hit, 20f))
                {
                    // 尝试获取地块组件
                    PlacementArea placementArea = hit.collider.GetComponent<PlacementArea>();

                    if (placementArea == null)
                    {
                        // 如果找不到 PlacementArea 组件，可能该位置没有地块
                        Debug.Log($"位置 {cell} 没有找到地块组件");
                        return false;
                    }

                    // 检查当前建筑是否允许该地块类型
                    if (!currentObjectScript.allowedTerrains.Contains(placementArea.terrainType))
                    {
                        Debug.Log($"位置 {cell} 的地形类型 {placementArea.terrainType} 不被允许");
                        return false;
                    }
                }
                else
                {
                    Debug.Log($"位置 {cell} 没有检测到地面");
                    return false;
                }
            }

            return true;
        }

        // ===================== 高亮预览 =====================

        private void UpdateOverlayColor(Vector2Int origin)
        {
            if (currentObjectScript?.previewOverlay == null) return;

            var occupiedCells = GetWorldOccupiedCells(origin);
            bool canPlace = IsPositionValid(origin) && IsTerrainValid(occupiedCells);

            Color color = canPlace
                ? new Color(0, 1, 0, 0.4f)
                : new Color(1, 0, 0, 0.4f);

            var renderer = currentObjectScript.previewOverlay.GetComponent<MeshRenderer>();

            if (renderer != null)
            {
                foreach (var mat in renderer.materials)
                    mat.color = color;
            }
        }

        // ===================== 放置 =====================

        private void TryPlaceBuilding()
        {
            Vector2Int gridPos = WorldToGrid(currentBuilding.transform.position);
            
            // 获取当前建筑占用的所有格子
            var occupiedCells = GetWorldOccupiedCells(gridPos);
            
            // 地块判断 + 格子占用判断
            if (IsPositionValid(gridPos) && IsTerrainValid(occupiedCells))
                PlaceBuilding(gridPos);
            else
                Debug.Log("位置被占用或地形不匹配！");
        }

        private void PlaceBuilding(Vector2Int origin)
        {
            GameObject obj = Instantiate(
                currentBuilding,
                currentBuilding.transform.position,
                currentBuilding.transform.rotation
            );

            PlacementObject placed = obj.GetComponent<PlacementObject>();
            placed?.OnPlaced();

            foreach (var cell in GetWorldOccupiedCells(origin))
                occupiedGrid.Add(cell);

            Debug.Log("放置成功");
            
            // 放置成功后自动取消当前放置状态
            CancelCurrentPlacement();
        }

        // ===================== 选择建筑 =====================

        public void SelectBuilding()
        {
            if (currentBuilding != null)
                Destroy(currentBuilding);

            if (currentCard?.buildingPrefab == null)
                return;

            currentBuilding = Instantiate(currentCard.buildingPrefab);
            currentObjectScript = currentBuilding.GetComponent<PlacementObject>();

            currentRotationIndex = 0;

            ApplyRotation();
            UpdateOccupiedCells();
        }

        // ===================== 取消 =====================

        private void CancelCurrentPlacement()
        {
            if (currentCard != null)
                currentCard.Select(false);

            if (currentBuilding != null)
                Destroy(currentBuilding);

            currentBuilding = null;
            currentCard = null;
            currentObjectScript = null;
        }
    }
}
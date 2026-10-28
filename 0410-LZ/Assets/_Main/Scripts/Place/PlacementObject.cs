using System.Collections.Generic;
using UnityEngine;

namespace RTSBuildingSystem
{
    public enum TerrainType
    {
        Plant,
        Suburb,
        Room,
        Default
    }

    public class PlacementObject : MonoBehaviour
    {
        [Header("建筑信息")]
        public string buildingID;
        public string buildingName;

        [Header("允许地形")]
        public List<TerrainType> allowedTerrains = new();

        [Header("模型")]
        public GameObject placedGFX;
        public GameObject previewOverlay;

        [Header("预览材质")]
        public Material previewMaterial;

        [Header("颜色")]
        public Color validColor = new Color(0, 1, 0, 0.5f);
        public Color invalidColor = new Color(1, 0, 0, 0.5f);

        [Header("调试")]
        public bool debugLog = false;

        [Header("占用格")]
        public List<Vector2Int> baseOccupiedCells = new();

        [SerializeField]
        private List<Vector2Int> occupiedCells = new();
        public List<Vector2Int> OccupiedCells => occupiedCells;

        private List<Renderer> previewRenderers = new();
        private Dictionary<Renderer, Material[]> originalMats = new();

        private BoxCollider[] colliders;

        private static BuildingManager buildingManager;

        [Header("Gizmos")]
        public bool showGizmos = true;
        public Color gizmoColor = new Color(0, 0.8f, 1, 0.5f);

        // ===================== 初始化 =====================

        private void Awake()
        {
            if (buildingManager == null)
                buildingManager = FindObjectOfType<BuildingManager>();

            colliders = GetComponentsInChildren<BoxCollider>();

            foreach (var col in colliders)
                if (col) col.enabled = false;

            if (placedGFX) placedGFX.SetActive(false);

            InitPreview();

            if (string.IsNullOrEmpty(buildingID))
                buildingID = System.Guid.NewGuid().ToString();

            UpdateOccupiedCells(0);
        }


        private void InitPreview()
        {
            if (previewOverlay == null)
            {
                Debug.LogError("previewOverlay 未设置！");
                return;
            }

            previewOverlay.SetActive(true);

            previewRenderers = new List<Renderer>(
                previewOverlay.GetComponentsInChildren<Renderer>(true)
            );

            if (debugLog)
                Debug.Log($"[Placement] Renderer数量: {previewRenderers.Count}");

            foreach (var r in previewRenderers)
            {
                if (r == null) continue;

                if (!(r is MeshRenderer || r is SkinnedMeshRenderer))
                    continue;

                var runtimeMats = r.materials;

                originalMats[r] = runtimeMats;

                Material[] newMats = new Material[runtimeMats.Length];

                for (int i = 0; i < newMats.Length; i++)
                {
                    newMats[i] = new Material(previewMaterial);
                }

                r.materials = newMats;

                if (debugLog)
                    Debug.Log($"替换材质: {r.name}");
            }

            // 默认给一次颜色
            SetPreviewColor(validColor);
        }

        // ===================== 颜色控制 =====================

        public void SetPreviewState(bool canPlace)
        {
            SetPreviewColor(canPlace ? validColor : invalidColor);
        }

        public void SetPreviewColor(Color color)
        {
            foreach (var r in previewRenderers)
            {
                if (r == null) continue;

                foreach (var mat in r.materials)
                {
                    if (mat.HasProperty("_BaseColor"))
                        mat.SetColor("_BaseColor", color);
                    else if (mat.HasProperty("_Color"))
                        mat.SetColor("_Color", color);
                }
            }
        }

        // ===================== 放置 =====================

        public void OnPlaced()
        {
            if (placedGFX) placedGFX.SetActive(true);

            if (previewOverlay)
            {
                RestoreMaterials();
                previewOverlay.SetActive(false);
            }

            foreach (var col in colliders)
                if (col) col.enabled = true;

            buildingManager?.RegisterBuilding(this);
        }

        private void RestoreMaterials()
        {
            foreach (var r in previewRenderers)
            {
                if (r == null) continue;

                if (originalMats.ContainsKey(r))
                    r.sharedMaterials = originalMats[r];
            }
        }

        // ===================== 拆除 =====================

        public void Demolish()
        {
            Destroy(gameObject);
        }

        private void OnDestroy()
        {
            buildingManager?.UnregisterBuilding(this);
        }

        // ===================== 地形 =====================

        public bool CanPlaceOnTerrain(TerrainType terrain)
        {
            return allowedTerrains.Count == 0 || allowedTerrains.Contains(terrain);
        }

        // ===================== 格子 =====================

        public void UpdateOccupiedCells(int rot)
        {
            List<Vector2Int> temp = new();

            foreach (var c in baseOccupiedCells)
                temp.Add(Rotate(c, rot));

            int minX = int.MaxValue;
            int minY = int.MaxValue;

            foreach (var c in temp)
            {
                if (c.x < minX) minX = c.x;
                if (c.y < minY) minY = c.y;
            }

            occupiedCells.Clear();

            foreach (var c in temp)
            {
                occupiedCells.Add(new Vector2Int(
                    c.x - minX,
                    c.y - minY
                ));
            }
        }

        private Vector2Int Rotate(Vector2Int c, int r)
        {
            return r switch
            {
                1 => new Vector2Int(-c.y, c.x),
                2 => new Vector2Int(-c.x, -c.y),
                3 => new Vector2Int(c.y, -c.x),
                _ => c
            };
        }

        public Vector2Int GetGridPos()
        {
            return new Vector2Int(
                Mathf.RoundToInt(transform.position.x),
                Mathf.RoundToInt(transform.position.z)
            );
        }

        // ===================== Gizmos（保留） =====================

        private void OnDrawGizmos()
        {
            if (!showGizmos) return;
            if (baseOccupiedCells == null) return;

            Gizmos.color = gizmoColor;

            Vector3 worldPos = transform.position;
            Vector3 forward = transform.forward;
            Vector3 right = transform.right;

            foreach (var cell in baseOccupiedCells)
            {
                Vector3 pos = worldPos + right * cell.x + forward * cell.y;
                Gizmos.DrawWireCube(pos, Vector3.one * 0.9f);
            }
        }
    }
}
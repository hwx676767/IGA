using UnityEngine;

#if UNITY_EDITOR
using UnityEditor;
#endif

using UnityEngine.AI;

public class CityGeneratorTool : MonoBehaviour
{
    [Header("Capsule Reference")]
    public float capsuleRadius = 0.5f;

    [Header("City Settings")]
    public int blockCountX = 4;
    public int blockCountZ = 4;

    [Header("Block Settings")]
    public float blockSizeMin = 10f;
    public float blockSizeMax = 16f;

    [Header("Street Settings")]
    public float streetWidthMultiplier = 6f;

    [Header("Building Settings")]
    public float minHeight = 1f;
    public float maxHeight = 12f;
    public float noiseScale = 0.2f;
    [Range(0f, 1f)]
    public float buildingDensity = 0.35f;

    private GameObject root;

    float CapsuleDiameter => capsuleRadius * 2f;
    float StreetWidth => CapsuleDiameter * streetWidthMultiplier;

    public void GenerateCity()
    {
        Clear();

        root = new GameObject("CityRoot");

        GenerateGround();

        for (int bx = 0; bx < blockCountX; bx++)
        {
            for (int bz = 0; bz < blockCountZ; bz++)
            {
                float blockSize = Random.Range(blockSizeMin, blockSizeMax) * CapsuleDiameter;

                Vector3 blockPos = new Vector3(
                    bx * (blockSize + StreetWidth),
                    0,
                    bz * (blockSize + StreetWidth)
                );

                GenerateBlock(blockPos, blockSize);
            }
        }

#if UNITY_EDITOR
        Debug.Log("City generated. Go to Window > AI > Navigation and click Bake.");
#endif
    }

    // Block生成
    void GenerateBlock(Vector3 origin, float size)
    {
        GameObject block = new GameObject("Block");
        block.transform.parent = root.transform;
        block.transform.position = origin;

        int attempts = Mathf.RoundToInt(size * size * 0.08f);

        for (int i = 0; i < attempts; i++)
        {
            if (Random.value > buildingDensity)
                continue;

            float x = Random.Range(0f, size);
            float z = Random.Range(0f, size);

            float noise = Mathf.PerlinNoise(x * noiseScale, z * noiseScale);
            float height = Mathf.Lerp(minHeight, maxHeight, noise);

            Vector3 pos = origin + new Vector3(x, height / 2f, z);

            GameObject cube = GameObject.CreatePrimitive(PrimitiveType.Cube);
            cube.name = "Building";
            cube.transform.parent = block.transform;
            cube.transform.position = pos;

            float w = Random.Range(0.8f, 2.2f);
            float d = Random.Range(0.8f, 2.2f);

            cube.transform.localScale = new Vector3(w, height, d);

            MarkNotWalkable(cube);

            var obstacle = cube.AddComponent<NavMeshObstacle>();
            obstacle.carving = true;
        }
    }

    // NavMesh设置：不可行走
    void MarkNotWalkable(GameObject obj)
    {
#if UNITY_EDITOR
        GameObjectUtility.SetStaticEditorFlags(
            obj,
            StaticEditorFlags.NavigationStatic
        );

        GameObjectUtility.SetNavMeshArea(
            obj,
            NavMesh.GetAreaFromName("Not Walkable")
        );
#endif
    }

    // 地面
    void GenerateGround()
    {
        GameObject ground = GameObject.CreatePrimitive(PrimitiveType.Plane);
        ground.name = "Ground";
        ground.transform.parent = root.transform;

        float size = Mathf.Max(blockCountX, blockCountZ) * 50f;

        ground.transform.localScale = new Vector3(size / 10f, 1, size / 10f);

        ground.transform.position = new Vector3(
            blockCountX * StreetWidth * 0.5f,
            0,
            blockCountZ * StreetWidth * 0.5f
        );

#if UNITY_EDITOR
        GameObjectUtility.SetStaticEditorFlags(
            ground,
            StaticEditorFlags.NavigationStatic
        );

        GameObjectUtility.SetNavMeshArea(
            ground,
            NavMesh.GetAreaFromName("Walkable")
        );
#endif
    }

    public void Clear()
    {
        if (root != null)
            DestroyImmediate(root);
    }

#if UNITY_EDITOR
    [CustomEditor(typeof(CityGeneratorTool))]
    public class CityEditor : Editor
    {
        public override void OnInspectorGUI()
        {
            DrawDefaultInspector();

            CityGeneratorTool gen = (CityGeneratorTool)target;

            GUILayout.Space(10);

            if (GUILayout.Button("Generate City"))
            {
                gen.GenerateCity();
            }

            if (GUILayout.Button("Clear"))
            {
                gen.Clear();
            }

            GUILayout.Space(10);

            if (GUILayout.Button("Open Navigation Window"))
            {
                Debug.Log("Open Window > AI > Navigation to Bake NavMesh");
            }
        }
    }
#endif
}
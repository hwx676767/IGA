using UnityEngine;
using UnityEditor;
using System.Collections.Generic;

public class GrassGenerator : EditorWindow
{
    // 要生成的草 prefab 列表
    public List<GameObject> grassPrefabs = new List<GameObject>();

    // 目标 Mesh 的 MeshFilter
    public MeshFilter targetMeshFilter;

    // 生成数量
    public int grassCount = 100;

    // 父物体
    public Transform parentTransform;

    // 随机缩放范围
    public Vector2 scaleRange = new Vector2(0.8f, 1.2f);

    [MenuItem("Tools/Grass Generator")]
    public static void ShowWindow()
    {
        GetWindow<GrassGenerator>("Grass Generator");
    }

    private void OnGUI()
    {
        GUILayout.Label("Grass Generator Settings", EditorStyles.boldLabel);

        targetMeshFilter = (MeshFilter)EditorGUILayout.ObjectField("Target Mesh", targetMeshFilter, typeof(MeshFilter), true);
        parentTransform = (Transform)EditorGUILayout.ObjectField("Parent Transform", parentTransform, typeof(Transform), true);
        grassCount = EditorGUILayout.IntField("Grass Count", grassCount);

        EditorGUILayout.LabelField("Grass Prefabs");
        int removeIndex = -1;
        for (int i = 0; i < grassPrefabs.Count; i++)
        {
            EditorGUILayout.BeginHorizontal();
            grassPrefabs[i] = (GameObject)EditorGUILayout.ObjectField(grassPrefabs[i], typeof(GameObject), false);
            if (GUILayout.Button("Remove"))
            {
                removeIndex = i;
            }
            EditorGUILayout.EndHorizontal();
        }
        if (removeIndex >= 0)
        {
            grassPrefabs.RemoveAt(removeIndex);
        }

        if (GUILayout.Button("Add Prefab"))
        {
            grassPrefabs.Add(null);
        }

        scaleRange = EditorGUILayout.Vector2Field("Scale Range", scaleRange);

        if (GUILayout.Button("Generate Grass"))
        {
            if (targetMeshFilter == null)
            {
                Debug.LogWarning("Please assign a target mesh!");
                return;
            }
            if (grassPrefabs.Count == 0)
            {
                Debug.LogWarning("Please assign at least one grass prefab!");
                return;
            }

            GenerateGrass();
        }
    }

    private void GenerateGrass()
    {
        Mesh mesh = targetMeshFilter.sharedMesh;
        Vector3[] vertices = mesh.vertices;

        if (parentTransform == null)
        {
            parentTransform = targetMeshFilter.transform;
        }

        for (int i = 0; i < grassCount; i++)
        {
            // 随机选择一个 prefab
            GameObject prefab = grassPrefabs[Random.Range(0, grassPrefabs.Count)];
            if (prefab == null) continue;

            // 随机选择一个三角面
            int triIndex = Random.Range(0, mesh.triangles.Length / 3) * 3;
            Vector3 v0 = vertices[mesh.triangles[triIndex + 0]];
            Vector3 v1 = vertices[mesh.triangles[triIndex + 1]];
            Vector3 v2 = vertices[mesh.triangles[triIndex + 2]];

            // 随机在三角形内插值
            float r1 = Random.value;
            float r2 = Random.value;
            if (r1 + r2 > 1)
            {
                r1 = 1 - r1;
                r2 = 1 - r2;
            }
            Vector3 pos = v0 + r1 * (v1 - v0) + r2 * (v2 - v0);
            pos = targetMeshFilter.transform.TransformPoint(pos); // 转换到世界坐标

            GameObject go = (GameObject)PrefabUtility.InstantiatePrefab(prefab);
            go.transform.position = pos;
            go.transform.rotation = Quaternion.Euler(0, Random.Range(0f, 360f), 0);
            float scale = Random.Range(scaleRange.x, scaleRange.y);
            go.transform.localScale = new Vector3(scale, scale, scale);
            go.transform.parent = parentTransform;
        }

        Debug.Log("Grass generation completed!");
    }
}

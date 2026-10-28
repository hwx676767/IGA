using UnityEngine;
#if UNITY_EDITOR
using UnityEditor;
#endif

[ExecuteInEditMode]
public class LibraryGenerator : MonoBehaviour
{
    [Header("Spiral Settings")]
    public float radius = 5f;
    public float heightPerTurn = 2f;
    public int turns = 5;
    public int booksPerTurn = 10;

    [Header("Prefab")]
    public GameObject bookPrefab;

    [Header("Book Variations")]
    [Tooltip("用于随机替换的材质球")]
    public Material[] bookMaterials;

    [Range(0f, 1f)]
    [Tooltip("生成书籍的概率 (1 = 全部生成, 0.5 = 只生成一半)")]
    public float fillPercentage = 1f;

    [Tooltip("随机缩放范围（基于原尺寸乘法因子）")]
    public Vector2 randomScaleRange = new Vector2(0.9f, 1.1f);

    [Tooltip("在缩放时自动增加间距避免穿模")]
    public bool autoAdjustSpacing = true;

    [Header("Rotation Adjustment")]
    public Vector3 rotationOffsetEuler = Vector3.zero;

    [Header("Editor")]
    [SerializeField] private bool regenerate = false;

    void OnValidate()
    {
#if UNITY_EDITOR
        if (regenerate)
        {
            regenerate = false;
            EditorApplication.delayCall += GenerateLibrary;
        }
#endif
    }

    [ContextMenu("Generate Library")]
    public void GenerateLibrary()
    {
        // 清空旧的
        int childCount = transform.childCount;
        for (int i = childCount - 1; i >= 0; i--)
        {
            var child = transform.GetChild(i).gameObject;
#if UNITY_EDITOR
            DestroyImmediate(child);
#else
            Destroy(child);
#endif
        }

        if (bookPrefab == null)
        {
            Debug.LogWarning("Book Prefab is not assigned!");
            return;
        }

        int totalBooks = turns * booksPerTurn;
        float angleStep = 360f / booksPerTurn;

        for (int i = 0; i < totalBooks; i++)
        {
            // --- ② 随机跳过一些书 ---
            if (Random.value > fillPercentage)
                continue;

            float t = i / (float)booksPerTurn;
            float theta = t * 360f;
            float rad = theta * Mathf.Deg2Rad;

            float x = radius * Mathf.Cos(rad);
            float z = radius * Mathf.Sin(rad);
            float y = t * heightPerTurn;

            Vector3 pos = new Vector3(x, y, z);

            // --- 基本朝向 ---
            Vector3 radial = new Vector3(x, 0f, z).normalized;
            Quaternion baseRot = Quaternion.LookRotation(-radial, Vector3.up);
            Quaternion rotationOffset = Quaternion.Euler(rotationOffsetEuler);
            Quaternion finalRot = baseRot * rotationOffset;

            // --- 实例化 ---
#if UNITY_EDITOR
            GameObject book = PrefabUtility.InstantiatePrefab(bookPrefab, transform) as GameObject;
            if (book == null)
                book = Instantiate(bookPrefab, transform);
#else
            GameObject book = Instantiate(bookPrefab, transform);
#endif
            book.name = $"Book_{i}";
            book.transform.position = pos;
            book.transform.rotation = finalRot;

            // --- ③ 随机缩放并自动间距 ---
            float scaleFactor = Random.Range(randomScaleRange.x, randomScaleRange.y);
            book.transform.localScale = bookPrefab.transform.localScale * scaleFactor;

            if (autoAdjustSpacing)
            {
                // 沿着切线方向（圆周方向）微调位置防止穿模
                Vector3 tangent = Vector3.Cross(Vector3.up, radial).normalized;
                float spacingAdjust = (scaleFactor - 1f) * 0.2f * radius / booksPerTurn;
                book.transform.position += tangent * spacingAdjust;
            }

            // --- ① 随机材质 ---
            if (bookMaterials != null && bookMaterials.Length > 0)
            {
                var renderer = book.GetComponentInChildren<Renderer>();
                if (renderer != null)
                {
                    renderer.sharedMaterial = bookMaterials[Random.Range(0, bookMaterials.Length)];
                }
            }
        }

        Debug.Log($"Generated library with {totalBooks} possible slots (fill {fillPercentage * 100f}%).");
    }
}

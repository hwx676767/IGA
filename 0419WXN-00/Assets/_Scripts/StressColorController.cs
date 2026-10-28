using UnityEngine;

public class StressColorController : MonoBehaviour
{
    [Header("Shader设置")]
    public string colorProperty = "_BaseColor"; // URP Lit

    [Header("颜色区间")]
    public Color lowStressColor = Color.white;   // ≤40
    public Color highStressColor = Color.red;    // 100

    [Header("压力范围")]
    public int minStress = 40;
    public int maxStress = 100;

    [SerializeField]private Renderer[] renderers;
    private Material[] materials;

    private void Awake()
    {
        // ?只获取“当前角色”的所有Renderer
        renderers = GetComponentsInChildren<Renderer>(true);

        materials = new Material[renderers.Length];

        for (int i = 0; i < renderers.Length; i++)
        {
            // ?实例化材质（避免多个角色串色）
            materials[i] = Instantiate(renderers[i].material);
            renderers[i].material = materials[i];
        }

        Debug.Log($"[{gameObject.name}] Renderer数量: {materials.Length}");
    }

    public void UpdateColor(int stressValue)
    {
        float t = (stressValue <= minStress)
            ? 0f
            : Mathf.InverseLerp(minStress, maxStress, stressValue);

        t = Mathf.Clamp01(t);

        Color targetColor = Color.Lerp(lowStressColor, highStressColor, t);

        foreach (var mat in materials)
        {
            if (mat != null && mat.HasProperty(colorProperty))
            {
                mat.SetColor(colorProperty, targetColor);
            }
        }
    }
}
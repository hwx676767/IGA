using UnityEngine;

[ExecuteInEditMode]
[RequireComponent(typeof(Camera))]
[AddComponentMenu("Image Effects/Fisheye (GoPro Style)")]
public class FisheyeEffect : MonoBehaviour
{
    [Tooltip("包含 FisheyeEffect_GoPro Shader 的材质")]
    public Material effectMaterial;

    [Header("鱼眼畸变参数")]
    [Range(-2f, 2f)] 
    public float strength = 0.8f; // 控制弯曲强度，越大越球面化

    [Header("畸变中心点 (0~1)")]
    [Range(0f, 1f)] 
    public float centerX = 0.5f;

    [Range(0f, 1f)] 
    public float centerY = 0.5f;

    void OnRenderImage(RenderTexture src, RenderTexture dest)
    {
        if (effectMaterial != null)
        {
            // 传递参数到 Shader
            effectMaterial.SetFloat("_Strength", strength);
            effectMaterial.SetFloat("_CenterX", centerX);
            effectMaterial.SetFloat("_CenterY", centerY);

            Graphics.Blit(src, dest, effectMaterial);
        }
        else
        {
            Graphics.Blit(src, dest);
        }
    }
}
using UnityEngine;

public class ManualSpotLightControl : MonoBehaviour
{
    public Light spotLight; // 拖入你的 Spot Light

    void Start()
    {
        if (spotLight != null)
        {
            // 强制开启 Spot Light 阴影（硬阴影或软阴影）
            spotLight.shadows = LightShadows.Soft; // 或 LightShadows.Hard
        }

        // 强制关闭平行光阴影（避免双阴影）
        if (RenderSettings.sun != null)
        {
            RenderSettings.sun.shadows = LightShadows.None;
        }
    }
}
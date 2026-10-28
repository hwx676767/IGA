Shader "Unlit/ShadowShader"
{
    SubShader
    {
        Tags { "Queue" = "Geometry" "RenderType" = "Opaque" }

        Pass
        {
            Name "ShadowCaster"
            Tags { "LightMode" = "ShadowCaster" }

        // 开启阴影投射
        ZWrite On
        ColorMask 0
    }

    Pass
    {
            // 隐藏物体本体
            ColorMask 0
            ZWrite On
        }
    }

        Fallback "Diffuse"
}

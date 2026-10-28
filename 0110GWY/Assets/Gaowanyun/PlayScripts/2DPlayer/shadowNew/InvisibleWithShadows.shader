Shader "Custom/InvisibleWithShadows"
{
    Properties
    {
        _MainTex("Base (RGB)", 2D) = "white" {} // 不需要实际纹理
    }

        SubShader
    {
        Tags { "Queue" = "Transparent" "RenderType" = "Transparent" }

        // 第一部分：使物体本身不可见
        Pass
        {
            Tags { "LightMode" = "UniversalForward" }

            ZWrite On // 写入深度信息
            ColorMask 0 // 不写入颜色（完全不可见）
        }

        // 第二部分：为阴影保留投射
        Pass
        {
            Tags { "LightMode" = "ShadowCaster" } // 设置为投射阴影的模式

            HLSLPROGRAM
            #pragma vertex Vert
            #pragma fragment Frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            struct Attributes
            {
                float4 position : POSITION; // 顶点位置
            };

            struct Varyings
            {
                float4 position : SV_POSITION; // 剪裁空间位置
            };

            Varyings Vert(Attributes input)
            {
                Varyings output;
                output.position = TransformObjectToHClip(input.position.xyz);
                return output;
            }

            half4 Frag() : SV_Target
            {
                return half4(0, 0, 0, 0); // 颜色不重要，仅用于阴影投射
            }
            ENDHLSL
        }
    }

        FallBack "Hidden/InternalErrorShader"
}

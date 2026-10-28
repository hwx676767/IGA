Shader "Custom/CompactGradientSky"
{
    Properties
    {
        _ColorTop ("Top Color", Color) = (0.2, 0.3, 0.8, 1)          // 天顶颜色
        _ColorMiddle ("Middle Color", Color) = (0.8, 0.5, 0.2, 1)    // 地平线颜色（夕阳暖色）
        _ColorBottom ("Bottom Color", Color) = (0.1, 0.1, 0.2, 1)    // 地面以下颜色
        _Exposure ("Exposure", Range(0, 5)) = 1.0                    // 整体亮度
        _YOffset ("Y Offset", Range(-1, 1)) = 0                      // 渐变整体上下偏移
        _GradientStart ("Gradient Start", Range(0, 1)) = 0.3         // 渐变开始位置（视野下方）
        _GradientEnd ("Gradient End", Range(0, 1)) = 0.7             // 渐变结束位置（视野上方）
        _Contrast ("Contrast", Range(0.5, 3)) = 1.0                  // 对比度（>1 过渡更锐利）
    }
    SubShader
    {
        Tags { "RenderType"="Background" "Queue"="Background" }
        Pass
        {
            ZWrite Off
            Cull Off
            Fog { Mode Off }

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            float4 _ColorTop;
            float4 _ColorMiddle;
            float4 _ColorBottom;
            float _Exposure;
            float _YOffset;
            float _GradientStart;
            float _GradientEnd;
            float _Contrast;

            struct appdata
            {
                float4 vertex : POSITION;
                float3 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float3 uv : TEXCOORD0;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // 获取原始 UV.Y（0=底部，1=顶部）
                float t = i.uv.y + _YOffset;
                
                // 重新映射：让渐变只发生在 [GradientStart, GradientEnd] 区间
                t = (t - _GradientStart) / (_GradientEnd - _GradientStart);
                t = saturate(t);
                
                // 应用对比度曲线（>1 让过渡更锐利，<1 让过渡更平缓）
                t = pow(t, _Contrast);
                
                // 三色混合
                float4 col;
                if (t < 0.5)
                {
                    // 底部到中间：_ColorBottom → _ColorMiddle
                    col = lerp(_ColorBottom, _ColorMiddle, t / 0.5);
                }
                else
                {
                    // 中间到顶部：_ColorMiddle → _ColorTop
                    col = lerp(_ColorMiddle, _ColorTop, (t - 0.5) / 0.5);
                }
                
                return col * _Exposure;
            }
            ENDCG
        }
    }
}
Shader "Hidden/FisheyeEffect"
{
    Properties
    {
        _Strength ("Fisheye Strength", Range(-2.0, 2.0)) = 0.8
        _CenterX ("Center X", Range(0, 1)) = 0.5
        _CenterY ("Center Y", Range(0, 1)) = 0.5
        _MainTex ("Texture", 2D) = "white" {}
    }

    SubShader
    {
        Tags { "RenderType"="Opaque" "Queue"="Overlay" }
        Cull Off ZWrite Off ZTest Always

        Pass
        {
            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            sampler2D _MainTex;
            float4 _MainTex_TexelSize;
            float _Strength;
            float _CenterX;
            float _CenterY;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // ✅ 允许移动畸变中心
                float2 uv = i.uv - float2(_CenterX, _CenterY);
                float r = length(uv);

                // ✅ GoPro风格鱼眼（非线性映射）
                // 强度越大，弯曲越明显
                float theta = atan2(uv.y, uv.x);
                float radius = pow(r, 1.0 + _Strength); // 可改为其他函数，例如 sin(r * π/2)
                
                float2 distorted = float2(cos(theta), sin(theta)) * radius;
                distorted += float2(_CenterX, _CenterY);

                fixed4 col = tex2D(_MainTex, distorted);
                return col;
            }
            ENDHLSL
        }
    }
}

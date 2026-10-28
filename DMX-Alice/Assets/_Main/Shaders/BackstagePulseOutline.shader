Shader "UI/Backstage Pulse Outline"
{
    Properties
    {
        [PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
        _Color ("Tint", Color) = (1,1,1,1)
        _OutlineColor ("Outline", Color) = (1,0.78,0.18,1)
        _OutlineSize ("Outline Size", Range(1, 4)) = 2
        _PulseSpeed ("Pulse Speed", Range(1, 10)) = 5
        _StencilComp ("Stencil Comparison", Float) = 8
        _Stencil ("Stencil ID", Float) = 0
        _StencilOp ("Stencil Operation", Float) = 0
        _StencilWriteMask ("Stencil Write Mask", Float) = 255
        _StencilReadMask ("Stencil Read Mask", Float) = 255
        _ColorMask ("Color Mask", Float) = 15
    }

    SubShader
    {
        Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" "PreviewType"="Plane" "CanUseSpriteAtlas"="True" }
        Stencil
        {
            Ref [_Stencil]
            Comp [_StencilComp]
            Pass [_StencilOp]
            ReadMask [_StencilReadMask]
            WriteMask [_StencilWriteMask]
        }
        Cull Off
        Lighting Off
        ZWrite Off
        ZTest [unity_GUIZTestMode]
        Blend SrcAlpha OneMinusSrcAlpha
        ColorMask [_ColorMask]

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "UnityUI.cginc"

            struct appdata_t
            {
                float4 vertex : POSITION;
                float4 color : COLOR;
                float2 texcoord : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                fixed4 color : COLOR;
                float2 texcoord : TEXCOORD0;
                float4 worldPosition : TEXCOORD1;
            };

            sampler2D _MainTex;
            float4 _MainTex_TexelSize;
            fixed4 _Color;
            fixed4 _OutlineColor;
            float _OutlineSize;
            float _PulseSpeed;
            float4 _ClipRect;

            v2f vert(appdata_t v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.worldPosition = v.vertex;
                o.texcoord = v.texcoord;
                o.color = v.color * _Color;
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 source = tex2D(_MainTex, i.texcoord) * i.color;
                float2 offset = _MainTex_TexelSize.xy * _OutlineSize;
                float neighborAlpha = 0;
                neighborAlpha = max(neighborAlpha, tex2D(_MainTex, i.texcoord + float2( offset.x, 0)).a);
                neighborAlpha = max(neighborAlpha, tex2D(_MainTex, i.texcoord + float2(-offset.x, 0)).a);
                neighborAlpha = max(neighborAlpha, tex2D(_MainTex, i.texcoord + float2(0,  offset.y)).a);
                neighborAlpha = max(neighborAlpha, tex2D(_MainTex, i.texcoord + float2(0, -offset.y)).a);
                neighborAlpha = max(neighborAlpha, tex2D(_MainTex, i.texcoord + float2( offset.x,  offset.y)).a);
                neighborAlpha = max(neighborAlpha, tex2D(_MainTex, i.texcoord + float2(-offset.x,  offset.y)).a);
                neighborAlpha = max(neighborAlpha, tex2D(_MainTex, i.texcoord + float2( offset.x, -offset.y)).a);
                neighborAlpha = max(neighborAlpha, tex2D(_MainTex, i.texcoord + float2(-offset.x, -offset.y)).a);

                float outline = saturate(neighborAlpha - source.a);
                float pulse = lerp(.35, 1, (sin(_Time.y * _PulseSpeed) + 1) * .5);
                fixed4 result = source;
                result.rgb = lerp(result.rgb, _OutlineColor.rgb, outline * pulse);
                result.a = max(result.a, outline * _OutlineColor.a * pulse);
                result.a *= UnityGet2DClipping(i.worldPosition.xy, _ClipRect);
                return result;
            }
            ENDCG
        }
    }
}

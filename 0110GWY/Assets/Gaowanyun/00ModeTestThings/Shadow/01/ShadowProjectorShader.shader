Shader "Custom/ShadowProjector" 
{
    Properties 
    {
        _ShadowTex ("Shadow Texture", 2D) = "black" {}
        _FalloffTex ("Falloff Texture", 2D) = "white" {}
    }
    Subshader 
    {
        Tags {"Queue"="Transparent" "IgnoreProjector"="False" "RenderType"="Transparent"}
        Pass 
        {
            Blend DstColor Zero
            ZWrite Off
            Offset -1, -1

            SetTexture [_ShadowTex] 
            {
                combine texture * primary
            }
            SetTexture [_FalloffTex] 
            {
                combine texture * previous
            }
        }
    }
}

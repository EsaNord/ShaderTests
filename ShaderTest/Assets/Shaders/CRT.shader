Shader "Custom/CRT" {
    Properties {
        _MainTex("Base (RGB)", 2D) = "white" {}
    }
    SubShader {
        Pass {
            ZTest Always Cull Off ZWrite Off Fog { Mode off}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma fragmentoption ARB_precision_hint_fastest
            #include "UnityCG.cginc"
            #pragma target 3.0
 
            struct uniforms
            {
                float4 pos : POSITION;
                float2 uv : TEXCOORD0;
                float4 scr_pos  : TEXCOORD1;
            };
 
            sampler2D _MainTex;
 
            uniforms vert(appdata_img v) {
                uniforms o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = MultiplyUV(UNITY_MATRIX_TEXTURE0, v.texcoord);
                o.scr_pos = ComputeScreenPos(o.pos);
                return o;
            }
 
            half4 frag(uniforms i) : COLOR{
                return tex2D(_MainTex, i.uv);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
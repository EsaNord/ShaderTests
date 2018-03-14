Shader "Custom/TextureShader" {
	Properties {
		_MainTex("Texture", 2D) = "white"{}
		_BumpMap("BumpMap", 2D) = "bump"{}
		_Metal("Metal", Float) = 1
		_Smooth("Smooth", Float) = 1
		_USpeed("USpeed", Float) = 1
		_VSpeed("VSpeed", Float) = 1
		_Scaler("Scale", Float) = 1
	}

	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows
		#pragma target 3.0

		struct Input {
			float2 uv_MainTex;
			float2 uv_BumpMap;
		};
		
		sampler2D _MainTex;
		sampler2D _BumpMap;
		float _Metal;
		float _Smooth;
		float _USpeed;
		float _VSpeed;
		float _Scaler;

		void surf (Input IN, inout SurfaceOutputStandard o) {

			//float mult1 = _Time.y * _USpeed;
			//float mult2 = _Time.y * _VSpeed;

			float2 vAlbedoOffset = (IN.uv_MainTex * _Scaler) + float2(_Time.y * _USpeed, _Time.y * _VSpeed);
			float2 vNormalOffset = (IN.uv_BumpMap * _Scaler) + float2(_Time.y * _USpeed, _Time.y * _VSpeed);

			//o.Albedo = tex2D(_MainTex, IN.uv_MainTex * (_SinTime.y * _Scaler) + mult1);
			//o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap * (_SinTime.y * _Scaler) + mult2));

			o.Albedo = tex2D(_MainTex, vAlbedoOffset).rgb;
			o.Normal = UnpackNormal(tex2D(_BumpMap, vNormalOffset));
			o.Metallic = _Metal;
			o.Smoothness = _Smooth;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
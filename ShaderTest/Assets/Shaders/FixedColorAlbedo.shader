Shader "Custom/FixedColorAlbedo" {
	Properties 
	{
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0
	}
	SubShader 
	{
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM		
		#pragma surface surf Lambert		
		#pragma target 3.0

		struct Input {
			float2 color : Color;
		};		

		void surf (Input IN, inout SurfaceOutput o) {	
			o.Albedo = fixed4(0, 1, 0, 1);
		}
		ENDCG
	}
	FallBack "Diffuse"
}

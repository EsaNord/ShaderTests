Shader "Custom/EditableColorAlbedo" {
	Properties 
	{
		_Color ("Color", Color) = (1,1,1,1)		
	}
	SubShader 
	{
		Tags { "RenderType"="Opaque" }		
		
		CGPROGRAM		
		#pragma surface surf Lambert		
		#pragma target 3.0

		struct Input {
			float2 color : COLOR;
		};	
		
		fixed4 _Color;

		void surf (Input IN, inout SurfaceOutput o) {	
			o.Albedo = _Color;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
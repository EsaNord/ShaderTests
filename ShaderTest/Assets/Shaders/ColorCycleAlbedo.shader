Shader "Custom/ColorCycleAlbedo" {
	Properties 
	{		
		_CycleSpeed ("Cycle Speed", float) = 1
	}
	SubShader 
	{
		Tags { "RenderType"="Opaque" }		
		
		CGPROGRAM		
		#pragma surface surf Lambert		
		#pragma target 3.0

		struct Input {
			float2 color : Color;
		};	
		
		float _CycleSpeed;	
		

		void surf (Input IN, inout SurfaceOutput o) {	
			o.Albedo = fixed4 (_SinTime.x * _CycleSpeed, _SinTime.y * _CycleSpeed, _SinTime.z * _CycleSpeed, 1);
		}
		ENDCG
	}
	FallBack "Diffuse"
}

Shader "Custom/WorldSpaceColor" {
	Properties 
	{
		_Color ("Color", Color) = (1,1,1,1)
		_TimeX ("X axis speed", float) = 1
		_TimeY ("Y axis speed", float) = 1		
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Lambert


		struct Input {
			float3 worldPos;
		};
		
		fixed4 _Color;	
		float _TimeX;
		float _TimeY;			
		
		void surf (Input IN, inout SurfaceOutput o) 
		{				
			float XMult = _Time.y * _TimeX;
			float YMult = _Time.y * _TimeY;			

			o.Albedo = fixed4 (
				fmod(abs(IN.worldPos.x + XMult), 1.0),
				fmod(abs(IN.worldPos.y + YMult), 1.0),
				1, 1) * _Color;
		}
		ENDCG
	}
	FallBack "Diffuse"
}

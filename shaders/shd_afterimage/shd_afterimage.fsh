//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 blendcolor1;
uniform vec3 blendcolor2;

void main()
{ 
	vec4 s_col = vec4 (texture2D( gm_BaseTexture, v_vTexcoord ));
	float channels = (s_col.r + s_col.g + s_col.b);

	if (channels > 0.0) //Not black
	{
		s_col.rgb = blendcolor1;
	}
	else //if it is black
	{
		s_col.rgb = blendcolor2;//( 1.0 - (2.0 * (1.0 - (blendcolor - vec3(1.0,1.0,1.0))) * (1.0 - s_col.rgb)) );
	}
	gl_FragColor =  v_vColour * s_col;
}



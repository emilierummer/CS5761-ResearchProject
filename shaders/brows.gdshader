shader_type spatial;

uniform sampler2D tex;

void fragment() {
    vec4 color = texture(tex, UV);

	// Transparency stays transparent
	if(color.a < 0.5f) {
		discard;
	}
	
	// Black becomes white
	if(color.r < 0.2f && color.g < 0.2f && color.b < 0.2f) {
		ALBEDO = vec3(1.0f, 1.0f, 1.0f);
		ALPHA = 1.0f;
	}
}
shader_type spatial;

uniform vec3 color = vec3(188, 188, 188);
uniform float THRESHOLD = 0.5;
uniform sampler2D TEXTURE : source_color;

void fragment() {
	vec4 tex = texture(TEXTURE, UV);

	// Discard transparent pixels
	if(tex.a < 0.5) {
		discard;
	}

	// Change colors from green to target color
	if( tex.r < THRESHOLD
		&& tex.b < THRESHOLD
		&& tex.g > (1.0f - THRESHOLD)
	) {
		ALBEDO = color.rgb;
	} else {
		ALBEDO = tex.rgb;
	}
}
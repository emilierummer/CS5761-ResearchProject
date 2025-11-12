shader_type spatial;

uniform vec3 color = vec3(60, 255, 0);
uniform float THRESHOLD = 0.75;
uniform sampler2D TEXTURE : filter_nearest;

void fragment() {
	vec4 tex = texture(TEXTURE, UV);

	// Discard transparent pixels
	if(tex.a < 0.5) {
		discard;
	}

	// Change non black and white pixels to target color
	if(tex.r == 1.0f && tex.g == 1.0f && tex.b == 1.0f) {
		ALBEDO = tex.rgb;
	} else if(tex.r == 0.0f && tex.g == 0.0f && tex.b == 0.0f) {
		ALBEDO = tex.rgb;
	} else {
		ALBEDO = color;
	}
}
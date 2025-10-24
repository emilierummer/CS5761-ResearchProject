shader_type spatial;

uniform sampler2D tex;
uniform vec3 edge_color : source_color = vec3(1.0, 0.0, 0.0); // red edge
uniform float threshold = 0.5;  // alpha cutoff
uniform int thickness = 1;  // edge width in pixels

varying vec3 some_color;

void vertex() {
	float alpha = texture(tex, UV).a;

	float min_neighbor_a = 0.0;
	for (int x = -thickness; x <= thickness; x++) {
		for (int y = -thickness; y <= thickness; y++) {
			if (x == 0 && y == 0) continue;
			vec2 offset = vec2(float(x), float(y));
			min_neighbor_a = min(min_neighbor_a, texture(tex, UV + offset).a);
		}
	}
	if(min_neighbor_a == 1.0) {
		some_color = vec3(0.0, 1.0, 0.0); // green inner
	} else if(min_neighbor_a > threshold) {
		some_color = vec3(1.0, 0.0, 0.0); // red edge
	} else if (min_neighbor_a == 0.0) {
		some_color = vec3(1.0, 1.0, 0.0); // yellow outer edge
	} else {
		some_color = vec3(0.0, 1.0, 1.0); // blue outer
	}
}

void fragment() {
	float alpha = texture(tex, UV).a;
	if(alpha < threshold) {
		discard;
	}
	ALBEDO = some_color;

	


    // vec2 tex_size = vec2(textureSize(tex, 0));
    // vec2 pixel = vec2(1.0) / tex_size * thickness;

    // // sample the alpha at current pixel
    // float center_a = texture(tex, UV).a;

    // // sample alphas of 8 surrounding pixels
    // float max_neighbor_a = 0.0;
    // for (int x = -1; x <= 1; x++) {
    //     for (int y = -1; y <= 1; y++) {
    //         if (x == 0 && y == 0) continue;
    //         vec2 offset = vec2(float(x), float(y)) * pixel;
    //         max_neighbor_a = max(max_neighbor_a, texture(tex, UV + offset).a);
    //     }
    // }

    // // detect edge: visible pixel next to a transparent pixel
    // bool is_edge = (center_a > threshold) && (max_neighbor_a < 1.0 - threshold);

    // vec4 base = texture(tex, UV);

    // if (is_edge) {
    //     ALBEDO = edge_color;
    // } else {
    //     ALBEDO = vec3(base.rgb);
	// 	ALPHA = base.a;
    // }
}
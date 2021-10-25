var vw = camera_get_view_width(view_camera[0]); 
var vh = camera_get_view_height(view_camera[0]);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

switch (room) {
	case rm_start:
		// Game title
		draw_set_font(titleFont);
		draw_text_color(vw/2, vh/4, "Gravitropism", c_white, c_white, c_white, c_white, 1);
		
		draw_set_font(smallFont);
		draw_text_color(vw/2, vh/2 - 64, "PRESS ENTER TO CONFIRM", c_white, c_white, c_white, c_white, 1);
		
		// Menu options
		draw_set_font(textFont);
		var spacing = 32;
		for (var i = 0; i < array_length(options); i++) {
			var color = c_white;
			var optionStr = options[i];
			if (pos == i) {
				color = c_lime;
				draw_text_color(vw/2 - textSize * (string_length(optionStr)/2), 
					vh/2 + i * (textSize + spacing), ">", color, color, color, color, 1);
			}
			draw_text_color(vw/2, vh/2 + i * (textSize + spacing), optionStr, color, color, color, color, 1);
		}	
		break;
}


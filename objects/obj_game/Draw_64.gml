switch (room) {
	case rm_start:
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		// Game title
		draw_set_font(titleFont);
		draw_text_color(vw/2, vh/4, "Gravitropism", c_white, c_white, c_white, c_white, 1);
		
		draw_set_font(smallFont);
		draw_text_color(vw/2, vh/2 - 64, "PRESS ENTER TO CONFIRM", c_white, c_white, c_white, c_white, 1);
		
		// Menu options
		draw_set_font(textFont);
		var spacing = 16;
		for (var i = 0; i < array_length(options); i++) {
			var color = c_white;
			var optionStr = options[i];
			if (pos == i) {
				color = c_lime;
				draw_text_color(vw/2 - string_width(optionStr), vh/2 + i * (string_height(optionStr) + spacing), ">", color, color, color, color, 1);
			}
			draw_text_color(vw/2, vh/2 + i * (string_height(optionStr) + spacing), optionStr, color, color, color, color, 1);
		}	
		break;
		
	case rm_howtoplay:
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_font(titleFont);
		var c = c_white;
		var startY = vh/4 - 100;
		draw_text_color(vw/2, startY, "How To Play", c, c, c, c, 1);
		var nextY = startY + string_height("How To Play") + 40;
		draw_set_font(textFont);
		for (var i = 0; i < array_length(howToPlay); i++) {
			draw_text_color(vw/2, nextY, howToPlay[i], c, c, c, c, 1);
			var textHeight = string_height(howToPlay[i]);
			nextY += textHeight;
			if (i == 0) { nextY += 20 }
		}
		draw_set_font(smallFont);
		draw_text_color(vw/2, nextY + 40, "PRESS ENTER TO PLAY", c, c, c, c, 1);
		break;
		
	default: // All the levels
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(textFont);
		var c = c_white;
		var startingX = 20;
		var drawY = 20;
		
		// Level counter with dark gray bg (left right)
		var currentLevel = string_char_at(room_get_name(room), string_length(room_get_name(room)));
		var lastLevel = string_char_at(room_get_name(room_last), string_length(room_get_name(room_last)));
		var levelCounter = "Level " + currentLevel + " / " + lastLevel;
		var spacing = 10;
		draw_rectangle_color(startingX - spacing, drawY - spacing/2, startingX + string_width(levelCounter) + spacing, 
			drawY + string_height(levelCounter) + spacing/2, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
		draw_text_color(startingX, drawY, levelCounter, c, c, c, c, 1);
		
		// Number of rotations with dark grey bg (top right)
		c = c_white;
		var rotationsText = "Rotations: " + string(numRotations);
		var rotationsX = vw - string_width(rotationsText) - spacing*2;
		var rotationsY = 20;
		draw_rectangle_color(rotationsX - spacing, rotationsY - spacing/2, rotationsX + string_width(rotationsText) + spacing, 
			drawY + string_height(levelCounter) + spacing/2, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
		draw_text_color(rotationsX, rotationsY, rotationsText, c, c, c, c, 1);
		
		
		// Controls
		//var prevWidth = string_width(levelCounter);
		//draw_set_font(smallFont);
		//var nextX = startingX + prevWidth + 40;
		//var controls = ["Move: Arrow keys", "Rotate clockwise: D", "Rotate anticlockwise: A", "Restart level: R"];
		//for (var i = 0; i < array_length(controls); i++) {
		//	draw_text_color(nextX, drawY, controls[i], c, c, c, c, 1);
		//	nextX += string_width(controls[i]) + 20;
		//}
		
		break;
}

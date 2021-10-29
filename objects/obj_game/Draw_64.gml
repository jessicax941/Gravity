var drawX = 0;
var drawY = 0;

switch (room) {
	case rm_start:
		// Menu options
		draw_set_font(textFont);
		var spacing = 16;
		drawX = 0;
		drawY = vh/2 - 100;
		for (var i = 0; i < array_length(menuSprites); i++) {
			var sprite = menuSprites[i];
			var c = c_orange;
			drawX = vw/2 - sprite_get_width(sprite)/2;
			drawY += (sprite_get_height(sprite) + spacing);
			if (pos == i) { draw_text_color(drawX - 30, drawY + sprite_get_height(sprite)/2, ">", c, c, c, c, 1); }
			draw_sprite(sprite, 0, drawX, drawY);
		}
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(smallFont);
		draw_text_color(vw/2, drawY + 100, "CONFIRM [ENTER]", c_white, c_white, c_white, c_white, 1);
		break;
		
	case rm_howtoplay:
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(smallFont);
		var c = c_white;
		var textToDisplay = "";
		if (menuSprites[pos] == spr_btn_start) { textToDisplay = howToPlayFromStart; }
		if (menuSprites[pos] == spr_btn_instructions) { textToDisplay = howToPlayFromInstructions; }
		draw_text_color(565, 758, textToDisplay, c, c, c, c, 1);
		break;
		
	default: // All the levels
		var c = c_white;
		drawX = 20;
		drawY = 20;
		var spacing = 10;
		
		// Level counter with dark gray bg (left right)
		var currentLevel = string_char_at(room_get_name(room), string_length(room_get_name(room)));
		draw_rectangle_color(drawX - spacing, drawY - spacing/2, drawX + sprite_get_width(spr_level1_5) + spacing, 
			drawY + sprite_get_height(spr_level1_5) + spacing/2, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
		var levelSprite = levelSprites[currentLevel - 1];
		draw_sprite(levelSprite, 0, drawX, drawY);

		// Number of rotations with dark grey bg (top right)
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(smallFont);
		var rotationsText = "Rotations: " + string(numRotations);
		var rotationsX = vw - string_width(rotationsText) - spacing*2;
		var rotationsY = 20;
		draw_rectangle_color(rotationsX - spacing, rotationsY - spacing/2, rotationsX + string_width(rotationsText) + spacing, 
			drawY + string_height(rotationsText) + spacing/2, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
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

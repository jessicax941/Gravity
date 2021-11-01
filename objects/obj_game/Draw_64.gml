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
		draw_text_color(570, 760, textToDisplay, c, c, c, c, 1);
		break;
		
	case rm_level1:
	case rm_level2:
	case rm_level3:
	case rm_level4:
	case rm_level5:
	case rm_level6:
		drawX = 20;
		drawY = 20;
		
		// Top bar background
		//var bgC = make_color_rgb(91, 56, 13); // Dark brown
		var bgC = c_dkgray;
		draw_rectangle_color(0, 0, vw, global.tileSize*2, bgC, bgC, bgC, bgC, false);
		
		// Level counter (left right)
		var currentLevel = string_char_at(room_get_name(room), string_length(room_get_name(room)));
		if (currentLevel > 0 && currentLevel < 6) {
			var levelSprite = levelSprites[currentLevel - 1];
			draw_sprite(levelSprite, 0, drawX, drawY);
		}
		
		// Controls
		var hSpacing = 50;
		var keyY = drawY + 12;
		var imageScale = 1;
		var qKeyX = drawX + sprite_get_width(spr_level1_5) + hSpacing;
		draw_sprite_ext(spr_key_q, 0, qKeyX, keyY, imageScale, imageScale, 0, c_white, 1);
		var eKeyX = qKeyX + sprite_get_width(spr_key_e)*imageScale + hSpacing/2;
		draw_sprite_ext(spr_key_e, 0, eKeyX, keyY, imageScale, imageScale, 0, c_white, 1);
		
		// Number of rotations (top right)
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(smallFont);
		var spacing = 10;
		var c = c_white;
		var rotationsText = "Rotations: " + string(numRotations);
		var rotationsX = vw - string_width(rotationsText) - spacing*2;
		var rotationsY = 20;
		draw_text_color(rotationsX, rotationsY, rotationsText, c, c, c, c, 1);
		
		break;
}

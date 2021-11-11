var startingX = vw - 50;
var startingY = vh - 50;

switch (room) {
	#region MAIN MENU
	case rm_start:
		// Main menu options (right aligned, starting from bottom)
		var spacing = 16;
		var drawY = startingY;
		for (var i = array_length(menuSprites) - 1; i >= 0; i--) {
			var sprite = menuSprites[i];
			var drawX = startingX - sprite_get_width(sprite)/2;
			drawY -= (sprite_get_height(sprite) + spacing);
			draw_sprite(sprite, 0, drawX, drawY);
			if (startMenuPos == i) { draw_sprite(spr_selector, 0, startingX + sprite_get_width(spr_selector), drawY); }
		}
		
		draw_set_halign(fa_right);
		draw_set_valign(fa_center);
		draw_set_font(smallFont);
		var textC = c_white;
		draw_text_color(startingX, startingY, "CONFIRM [ENTER]", textC, textC, textC, textC, 1);
		break;
	#endregion
	
	#region HOW TO PLAY
	case rm_howtoplay:
		// How to play background
		draw_sprite(spr_howtoplay, howToPlayPage, 0, 0);
		
		var spacing = 16;
		var drawY = startingY + 5;
		// Confirm to enter text
		draw_set_halign(fa_right);
		draw_set_valign(fa_center);
		draw_set_font(smallFont);
		var textC = c_white;
		draw_text_color(startingX, drawY, "CONFIRM [ENTER]", textC, textC, textC, textC, 1);
		
		// How to play buttons
		for (var i = array_length(howToPlaySprites) - 1; i >= 0; i--) {
			var sprite = howToPlaySprites[i];
			var drawX = startingX - sprite_get_width(sprite)/2;
			drawY -= (sprite_get_height(sprite) + spacing);
			draw_sprite(sprite, 0, drawX, drawY);
			if (howToPlayPos == i) { draw_sprite(spr_selector, 0, startingX + sprite_get_width(spr_selector), drawY); }
		}
		break;
	#endregion
		
	#region LEVELS
	case rm_level1:
	case rm_level2:
	case rm_level3:
	case rm_level4:
	case rm_level5:
	case rm_level6:
		var drawX = 20;
		var drawY = 20;
		
		// Top bar background
		var bgC = c_dkgray;
		draw_rectangle_color(0, 0, vw, global.tileSize*2, bgC, bgC, bgC, bgC, false);
		
		// Level counter (left right)
		var currentLevel = string_char_at(room_get_name(room), string_length(room_get_name(room)));
		if (currentLevel > 0 && currentLevel < 7) {
			var levelSprite;
			if (currentLevel == 6) {
				levelSprite = levelSprites[0];
			} else {
				levelSprite = levelSprites[currentLevel - 1];
			}
			draw_sprite(levelSprite, 0, drawX, drawY);
		}
		
		// Controls
		var hSpacing = 50;
		var keyY = drawY + 12;
		var qKeyX = drawX + sprite_get_width(spr_level1_5) + hSpacing;
		draw_sprite_ext(spr_key_q, 0, qKeyX, keyY, 0.8, 0.8, 0, c_white, 1);
		var eKeyX = qKeyX + sprite_get_width(spr_key_e) + 10;
		draw_sprite_ext(spr_key_e, 0, eKeyX, keyY, 0.8, 0.8, 0, c_white, 1);
		
		// Number of rotations (top right)
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(textFont);
		var spacing = 10;
		var c = global.orange;
		var rotationsText = "Rotations: " + string(numRotations);
		var rotationsX = vw - string_width(rotationsText) - spacing*2;
		var rotationsY = 20;
		draw_text_color(rotationsX, rotationsY, rotationsText, c, c, c, c, 1);
		
		break;
	#endregion
}

if (global.gamePaused) {
	draw_pause_menu();
}

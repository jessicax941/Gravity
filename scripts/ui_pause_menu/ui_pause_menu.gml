function draw_pause_menu() {
	var yOffset = 50;
	
	// Translucent background
	draw_set_color(c_black);
	draw_set_alpha(0.6);
	draw_rectangle(0, 0, vw, vh, false);
	draw_set_alpha(1);
	
	// GAME PAUSED
	draw_set_font(titleFont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(global.orange);
	draw_text(vw/2, vh/3 + yOffset, "GAME PAUSED");
	draw_set_color(c_white);
	
	// Menu buttons (Resume, Instructions, Settings, Main Menu)
	var drawX = vw/2;
	var drawY = vh*0.4 + yOffset;
	var spacing = 24;
	var sprite;
	for (var i = 0; i < array_length(pauseMenuSprites); i++) {
		sprite = pauseMenuSprites[i];
		drawY += (sprite_get_height(sprite) + spacing);
		draw_sprite(sprite, 0, drawX, drawY);
		if (pauseMenuPos == i) {
			var selectorX = drawX + sprite_get_width(sprite)/2 + sprite_get_width(spr_selector)
			draw_sprite(spr_selector, 0, selectorX, drawY);
		}
	}
		
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(dialogFont);
	var textC = global.orange;
	draw_text_color(drawX, drawY + sprite_get_height(sprite) + spacing/2, "(Your progress will not be saved)", textC, textC, textC, textC, 1);
	
}

function process_pause_menu_input() {
	if (upKey || downKey || enterKey) {
		audio_play_sound(snd_button_click, global.sfxPriority, false);
	}
	
	pauseMenuPos += (downKey - upKey);
	if (pauseMenuPos < 0) {
		pauseMenuPos = array_length(pauseMenuSprites) - 1;
	}
	if (pauseMenuPos >= array_length(pauseMenuSprites)) {
		pauseMenuPos = 0;
	}
	
	if (enterKey) {
		switch (pauseMenuSprites[pauseMenuPos]) {
			case spr_btn_resume:
			show_debug_message("resume game");
				global.gamePaused = false;
				break;
			case spr_btn_instructions:
				// Open instructions
				global.isHowToPlayOpen = true;
				break;
			case spr_btn_settings:
				// Open settings
				break;
			case spr_btn_main_menu:
				global.gamePaused = false;
				room_goto(rm_start);
				break;
		}
		pauseMenuPos = 0;
	}
}
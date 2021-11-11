function draw_settings() {
	draw_sprite(spr_settings, 0, 0, 0);
	
	var spacing = 32;
	var offsetForBackButton = 32;
	var buttonsHeight = sprite_get_height(settingsButtons[0])*3 + spacing*3 + offsetForBackButton;
	var drawX = vw/2;
	var drawY = vh/2 - buttonsHeight/2;
	
	for (var i = 0; i < numSettingsButtons; i++) {
		var sprite = settingsButtons[i];
		drawY += sprite_get_height(sprite) + spacing;
		if (sprite == spr_btn_back) { drawY += offsetForBackButton; }
		
		// Change image index for music and effects buttons (always 0 for back button)
		var imgIndex = 0;
		if (sprite == spr_btn_music) {
			imgIndex = audio_is_playing(global.bgm) ? 1 : 0;
		}
		if (sprite == spr_btn_effects) {
			imgIndex = global.isSfxOn ? 1 : 0;
		}
		
		draw_sprite(sprite, imgIndex, drawX, drawY);
		
		if (settingsPos == i) {
			var selectorX = drawX + sprite_get_width(sprite)/2 + sprite_get_width(spr_selector);
			draw_sprite(spr_selector, 0, selectorX, drawY);
		}
	}
}

function process_settings_input() {
	if (upKey || downKey || enterKey) {
		audio_play_sound(snd_button_click, global.sfxPriority, false);
	}
	
	settingsPos += (downKey - upKey);
	if (settingsPos < 0) {
		settingsPos = array_length(settingsButtons) - 1;
	}
	if (settingsPos >= array_length(settingsButtons)) {
		settingsPos = 0;
	}
	
	if (enterKey) {
		switch (settingsButtons[settingsPos]) {
			case spr_btn_music:
				// Toggle bgm
				if (audio_is_playing(global.bgm)) {
					bgm_stop();
				} else {
					bgm_play();
				}
				break;
				
			case spr_btn_effects:
				// Toggle sound effects
				if (global.isSfxOn) {
					sfx_disable();
				} else {
					sfx_enable();
				}
				break;
				
			case spr_btn_back:
				global.isSettingsOpen = false;
				settingsPos = 0;
				break;
				
		}
	}
}
upKey = keyboard_check_pressed(vk_up);
downKey = keyboard_check_pressed(vk_down);
enterKey = keyboard_check_pressed(vk_enter);
escapeKey = keyboard_check_pressed(vk_escape);



// CHEATS
if (keyboard_check_pressed(ord("1"))) { room_goto(rm_level1); }
if (keyboard_check_pressed(ord("2"))) { room_goto(rm_level2); }
if (keyboard_check_pressed(ord("3"))) { room_goto(rm_level3); }
if (keyboard_check_pressed(ord("4"))) { room_goto(rm_level4); }
if (keyboard_check_pressed(ord("5"))) { room_goto(rm_level5); }
if (keyboard_check_pressed(ord("6"))) { room_goto(rm_level6); }
if (keyboard_check_pressed(ord("9"))) { room_goto(rm_intro); }
if (keyboard_check_pressed(ord("0"))) { room_goto(rm_ending); }

if (room == rm_start) {
	if (upKey || downKey || enterKey) {
		audio_play_sound(snd_button_click, global.sfxPriority, false);
	}

	startMenuPos += (downKey - upKey);
	if (startMenuPos < 0) {
		startMenuPos = array_length(menuSprites) - 1;
	}
	if (startMenuPos >= array_length(menuSprites)) {
		startMenuPos = 0;	
	}

	if (enterKey) {
		switch (menuSprites[startMenuPos]) {
			case spr_btn_start: // Start
				room_goto(rm_intro);
				break;
			case spr_btn_instructions: // Instructions
				room_goto(rm_howtoplay);
				startMenuPos = 0;
				break;
			case spr_btn_settings: // Options
				//room_goto(rm_options);
				break;
			case spr_btn_credits:
				break;
			case spr_btn_quit: // Quit
				game_end();
				break;
		}
	}
}

if (room == rm_howtoplay) {
	if (howToPlayPage == 1) {
		if (howToPlaySprites[0] != spr_btn_start) {
			array_insert(howToPlaySprites, 0, spr_btn_start);	
		}
	} else {
		if (howToPlaySprites[0] == spr_btn_start) {
			array_delete(howToPlaySprites, 0, 1);	
		}
	}
	
	howToPlayPos += (downKey - upKey);
	if (howToPlayPos < 0) {
		howToPlayPos = array_length(howToPlaySprites) - 1;
	}
	if (howToPlayPos >= array_length(howToPlaySprites)) {
		howToPlayPos = 0;	
	}
	
	if (upKey || downKey || enterKey) {
		audio_play_sound(snd_button_click, global.sfxPriority, false);
	}
	
	if (enterKey) {
		switch (howToPlaySprites[howToPlayPos]) {
			case spr_btn_next:
				if (howToPlayPage == 0) { 
					howToPlayPage = 1;
				} else {
					room_goto(rm_intro);
					howToPlayPage = 0;
				}
				break;
			case spr_btn_back:
				if (howToPlayPage == 1) {
					howToPlayPage = 0;
				} else {
					room_goto(rm_start);
				}
				break;
			case spr_btn_start:
				if (howToPlayPage == 1) {
					room_goto(rm_intro);
					howToPlayPage = 0;
				}
				break;
		}
	}
}


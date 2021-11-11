upKey = keyboard_check_pressed(vk_up);
downKey = keyboard_check_pressed(vk_down);
enterKey = keyboard_check_pressed(vk_enter);
escapeKey = keyboard_check_pressed(vk_escape);

// Input for how to play screen overrides that for main and pause menus
if (global.isHowToPlayOpen) {
	process_howtoplay_input();
	return;
}

// Input for pause menu overrides that for main menu
if (global.gamePaused) { 
	process_pause_menu_input();
	return;
}

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
				global.isHowToPlayOpen = true;
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

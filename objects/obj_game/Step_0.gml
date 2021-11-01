upKey = keyboard_check_pressed(vk_up);
downKey = keyboard_check_pressed(vk_down);
enterKey = keyboard_check_pressed(vk_enter);
backspaceKey = keyboard_check_pressed(vk_backspace);
escapeKey = keyboard_check_pressed(vk_escape);
//isAnyMenuKeyPressed = upKey || downKey || enterKey || backspaceKey || escapeKey;

// CHEATS
if (keyboard_check_pressed(ord("1"))) { room_goto(rm_level1); }
if (keyboard_check_pressed(ord("2"))) { room_goto(rm_level2); }
if (keyboard_check_pressed(ord("3"))) { room_goto(rm_level3); }
if (keyboard_check_pressed(ord("4"))) { room_goto(rm_level4); }
if (keyboard_check_pressed(ord("5"))) { room_goto(rm_level5); }

if (room == rm_start) {
	if (upKey || downKey || enterKey) {
		sfx_play(snd_button_click);
	}

	pos += (downKey - upKey);
	if (pos < 0) {
		pos = array_length(menuSprites) - 1;
	}
	if (pos >= array_length(menuSprites)) {
		pos = 0;	
	}

	if (enterKey) {
		switch (menuSprites[pos]) {
			case spr_btn_start: // Start
				room_goto(rm_howtoplay);
				break;
			case spr_btn_instructions: // Instructions
				room_goto(rm_howtoplay);
				break;
			case spr_btn_options: // Options
				room_goto(rm_options);
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
	if (enterKey || backspaceKey) {
		sfx_play(snd_button_click);
	}
	
	if (backspaceKey) {
		room_goto(rm_start);	
	}
	
	if (menuSprites[pos] == spr_btn_start) {
		// Came from start button
		if (enterKey) {
			room_goto(rm_level1);
		}
	}
}


upKey = keyboard_check_pressed(vk_up);
downKey = keyboard_check_pressed(vk_down);
enterKey = keyboard_check_pressed(vk_enter);
backspaceKey = keyboard_check_pressed(vk_backspace);

if (upKey || downKey || enterKey) {
	sfx_play_button_click();
}

// CHEATS; comment out if playtesting
if (keyboard_check_pressed(ord("1"))) { room_goto(rm_level1); }
if (keyboard_check_pressed(ord("2"))) { room_goto(rm_level2); }
if (keyboard_check_pressed(ord("3"))) { room_goto(rm_level3); }
if (keyboard_check_pressed(ord("4"))) { room_goto(rm_level4); }
if (keyboard_check_pressed(ord("5"))) { room_goto(rm_level5); }

if (room == rm_start) {
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
				if (!hasSeenHowToPlay) {
					room_goto(rm_howtoplay);
				} else {
					room_goto(rm_level1);
				}
				break;
				
			case spr_btn_instructions: // Instructions
				room_goto(rm_howtoplay);
				break;
		
			case spr_btn_options: // Options
				break;
		
			case spr_btn_quit: // Quit
				game_end();
				break;
		}
	}
}

if (room == rm_howtoplay) {
	if (backspaceKey) {
		room_goto(rm_start);	
	}
	
	if (menuSprites[pos] == spr_btn_start) {
		// Came from start button
		hasSeenHowToPlay = true;
		if (enterKey) {
			room_goto(rm_level1);
		}
	}
	
}


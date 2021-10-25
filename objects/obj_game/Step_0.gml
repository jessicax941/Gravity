up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
enter_key = keyboard_check_pressed(vk_enter);

pos += (down_key - up_key);
if (pos < 0) {
	pos = array_length(options) - 1;
}

if (pos >= array_length(options)) {
	pos = 0;	
}

if (enter_key) {
	switch (options[pos]) {
		case "Start":
			room_goto_next();
			break;
		
		case "Options":
			break;
		
		case "Quit":
			game_end();
			break;
		
	}
}
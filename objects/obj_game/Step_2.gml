/// @description For pausing game
var isInGame = string_count("level", room_get_name(room));
if (escapeKey && isInGame) {
	audio_play_sound(snd_button_click, global.sfxPriority, false);
	
	global.gamePaused = !global.gamePaused;
	if (global.gamePaused) {
		show_debug_message("GAME PAUSED");
		with (all) {
			gamePausedImageSpeed = image_speed;
			image_speed = 0;
		}
	} else {
		show_debug_message("GAME RESUMED");
		with (all) {
			image_speed = gamePausedImageSpeed;
		}
	}
}

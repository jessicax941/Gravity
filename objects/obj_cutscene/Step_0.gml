enterKey = keyboard_check_pressed(vk_enter);

if (enterKey && isSeqComplete) {
	audio_play_sound(snd_button_click, global.sfxPriority, false);
	room_goto(nextRoom);
}
/// @description Show dialog if player colliding and haven't shown before
if (global.gamePaused) { return; }

enterPressed = keyboard_check_pressed(vk_enter);

var player = instance_place(x, y, obj_player);
if (player != noone && !isComplete) {
	hasShown = true;
	
	// Get dialog line
	if (dialogId != "") {
		// Dialog Id has been set
		dialogArr = ds_map_find_value(global.dialogMap, dialogId);
		var numDialog = array_length(dialogArr);
		if (numDialog > 0) {
			if (!drawDialog) { audio_play_sound(snd_speech_bubble, global.sfxPriority, false );}
			drawDialog = true;
		}
	}
	
	if (drawDialog && canBeClosed && enterPressed) {
		audio_play_sound(snd_speech_bubble, global.sfxPriority, false);
		// Go to next line in dialog or close dialog
		if (currLineNum >= array_length(dialogArr) - 1) {
			drawDialog = false;
			isComplete = true;
		} else {
			currLineNum++;
		}
	}
}

if (player == noone || isComplete) {
	drawDialog = false;	
}
    
global.bgm = m_bgm;
global.sfxLoaded = false;
//global.bgmPriority = 1;
global.sfxPriority = 2;

function load_sfx() {	
	if (!audio_group_is_loaded(audiogroup_sfx)) {
		audio_group_load(audiogroup_sfx);
	}
}

//function bgm_play() {
//	audio_play_sound(global.bgm, global.bgmPriority, true);
//	audio_sound_gain(global.bgm, 0.5, 0);
//}

//function bgm_pause() {
//	audio_pause_sound(global.bgm);
//}

function sfx_play(sfx) {
	if (audio_is_paused(sfx)) {
		audio_resume_sound(sfx);
		return;
	}
	
	if (!audio_is_playing(sfx) && global.sfxLoaded) {
		audio_play_sound(sfx, global.sfxPriority, false);
	}
}

//function sfx_stop(sfx) {
//	if (audio_is_playing(sfx)) {
//		audio_stop_sound(sfx);
//	}
//}

function sfx_pause(sfx) {
	if (audio_is_playing(sfx)) {
		audio_pause_sound(sfx);
	}
}

//function sfx_resume(sfx) {
//	if (audio_is_paused(sfx)) {
//		audio_resume_sound(sfx);
//	}
//}

function sfx_play_door_open() {
	audio_play_sound(snd_door_open, global.sfxPriority, false);
	audio_sound_gain(snd_door_open, 0.5, 0);
}
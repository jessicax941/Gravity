global.bgm = m_bgm;
global.bgmPriority = 1;
global.sfxLoaded = false;
global.isSfxOn = true;
global.sfxPriority = 2;

function load_sfx() {	
	if (!audio_group_is_loaded(audiogroup_sfx)) {
		audio_group_load(audiogroup_sfx);
	}
}

function bgm_play() {
	audio_play_sound(global.bgm, global.bgmPriority, true);
	audio_sound_gain(global.bgm, 0.75, 0);
}

function bgm_stop() {
	audio_stop_sound(global.bgm);
}

function bgm_fade_out_normal() {
	audio_sound_gain(m_bgm, 0, 1);
	alarm[0] = room_speed;
}

function bgm_fade_in_ending() {
	audio_play_sound(m_ending, global.bgmPriority, true);
	audio_sound_gain(m_ending, 0, 0);
	audio_sound_gain(m_ending, 0.75, 1);
	global.bgm = m_ending;
	//event_perform();
}

function sfx_enable() {
	audio_group_set_gain(audiogroup_sfx, 1, 0);
	global.isSfxOn = true;
}

function sfx_disable() {
	audio_group_set_gain(audiogroup_sfx, 0, 0);
	global.isSfxOn = false;
}

//function sfx_play(sfx) {
//	if (audio_is_paused(sfx)) {
//		audio_resume_sound(sfx);
//		return;
//	}
	
//	if (!audio_is_playing(sfx) && global.sfxLoaded) {
//		audio_play_sound(sfx, global.sfxPriority, false);
//	}
//}

//function sfx_stop(sfx) {
//	if (audio_is_playing(sfx)) {
//		audio_stop_sound(sfx);
//	}
//}

//function sfx_pause(sfx) {
//	if (audio_is_playing(sfx)) {
//		audio_pause_sound(sfx);
//	}
//}

//function sfx_resume(sfx) {
//	if (audio_is_paused(sfx)) {
//		audio_resume_sound(sfx);
//	}
//}

function sfx_play_door_open() {
	audio_play_sound(snd_door_open, global.sfxPriority, false);
}

function sfx_play_grow_plant() {
	audio_play_sound(snd_grow_melon, global.sfxPriority, false);
}

function sfx_play_powerup() {
	audio_play_sound(snd_powerup, global.sfxPriority, false);
}

function sfx_play_walk_stone() {
	audio_play_sound(snd_walk_stone, global.sfxPriority, false);
}

function sfx_play_landing() {
	audio_play_sound(snd_landing, global.sfxPriority, false);
}
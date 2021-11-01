global.bgm = m_bgm;
global.sfxLoaded = false;
global.bgmPriority = 1;
global.sfxPriority = 2;

function load_sfx() {	
	if (!audio_group_is_loaded(audiogroup_sfx)) {
		audio_group_load(audiogroup_sfx);
	}
}

function bgm_play() {
	audio_play_sound(global.bgm, global.bgmPriority, true);
}

function bgm_pause() {
	audio_pause_sound(global.bgm);	
}

function sfx_play(sfx) {
	if (audio_is_paused(sfx)) {
		audio_resume_sound(sfx);
		return;
	}
	
	if (!audio_is_playing(sfx) && global.sfxLoaded) {
		audio_play_sound(sfx, global.sfxPriority, false);
	}
}

function sfx_stop(sfx) {
	if (audio_is_playing(sfx)) {
		audio_stop_sound(sfx);
	}
}

function sfx_pause(sfx) {
	if (audio_is_playing(sfx)) {
		audio_pause_sound(sfx);
	}
}

function sfx_resume(sfx) {
	if (audio_is_paused(sfx)) {
		audio_resume_sound(sfx);
	}
}
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

function sfx_play_door_open() {
	if (global.sfxLoaded) { audio_play_sound(snd_door_open, global.sfxPriority, false); }
}

function sfx_play_button_click() {
	if (global.sfxLoaded) { audio_play_sound(snd_button_click, global.sfxPriority, false); }
}


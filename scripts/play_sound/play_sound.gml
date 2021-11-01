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
	if (!audio_is_playing(sfx) && global.sfxLoaded) {
		audio_play_sound(sfx, global.sfxPriority, false);
	}
}

function sfx_play_door_open() {
	sfx_play(snd_door_open);
}

function sfx_play_button_click() {
	sfx_play(snd_button_click);
}

function sfx_play_speech_bubble() {
	sfx_play(snd_speech_bubble);
}

function sfx_play_walk_on_sapling() {
	//if (!audio_is_playing(snd_walk_sapling) && global.sfxLoaded) {
	//	audio_play_sound(snd_walk_sapling, global.sfxPriority, false);
	//}
}




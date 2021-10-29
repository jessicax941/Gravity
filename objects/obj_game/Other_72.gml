/// @description Start bgm when it's loaded
if (audio_group_is_loaded(audiogroup_sfx)) {
	global.sfxLoaded = true;
	show_debug_message("SFX LOADED");
}

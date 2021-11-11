/// @description Add up total rotations
if (room != rm_level6 && string_count("level", room_get_name(room))) {
	//totalRotations += numRotations;
	//show_debug_message("total rotations so far: " + string(totalRotations));
	var currentLevel = string_char_at(room_get_name(room), string_length(room_get_name(room)));
	levelRotations[currentLevel - 1] = numRotations;
}

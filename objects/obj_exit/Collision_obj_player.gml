/// @description Go to next level or start menu
if (room_exists(room_next(room))) {
	room_goto_next();
} else {
	room_goto(rm_start);
}
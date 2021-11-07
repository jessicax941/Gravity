/// @description Go to next level or start menu if not level 6
//if (room != rm_level6) {
//	if (room_exists(room_next(room))) {
//		room_goto_next();
//	} else {
//		room_goto(rm_start);
//	}
//}
switch (room) {
	case rm_level1:
		room_goto(rm_level2);
		break;
	case rm_level2:
		room_goto(rm_level3);
		break;
	case rm_level3:
		room_goto(rm_level4);
		break;
	case rm_level4:
		room_goto(rm_level5);
		break;
	case rm_level5:
		room_goto(rm_level6);
		break;
	default: // Level 6
		// Do nothing
		break;
}
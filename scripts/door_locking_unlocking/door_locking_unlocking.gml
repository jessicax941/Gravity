// Check if a closed door is aligned to another door
// If true then change both closed doors to open

// Check if there's a door and corridor to one side of this door
// If there is then unlock this one (change to open door)
// If not then lock this door (change to closed door)
// Run this for all the doors -> including those not being rotated so that they can lock themselves back

function check_door_lock() {
	var checkCorridorX = x;
	var checkCorridorY = y - global.tileSize;
	var checkOtherDoorX = x;
	var checkOtherDoorY = checkCorridorY - global.tileSize;
	
	// Check top
	if (has_door_and_corridor(checkCorridorX, checkCorridorY, checkOtherDoorX, checkOtherDoorY)) {
		unlock_door();
		return;
	}
	//if (otherDoor != noone) {
	//	instance_change(obj_open_door, true);
	//	with (otherDoor) {
	//		instance_change(obj_open_door, true);
	//	}
	//	show_debug_message("top: change to open doors");
	//	return;
	//}
	
	// Check bottom
	checkCorridorX = x;
	checkCorridorY = y + global.tileSize;
	checkOtherDoorX = x;
	checkOtherDoorY = checkCorridorY + global.tileSize;
	if (has_door_and_corridor(checkCorridorX, checkCorridorY, checkOtherDoorX, checkOtherDoorY)) {
		unlock_door();
		return;
	}
	
	// Check left
	checkCorridorX = x - global.tileSize;
	checkCorridorY = y;
	checkOtherDoorX = checkCorridorX - global.tileSize;
	checkOtherDoorY = y;
	if (has_door_and_corridor(checkCorridorX, checkCorridorY, checkOtherDoorX, checkOtherDoorY)) {
		unlock_door();
		return;
	}

	
	// Check right
	checkCorridorX = x + global.tileSize;
	checkCorridorY = y;
	checkOtherDoorX = checkCorridorX + global.tileSize;
	checkOtherDoorY = y;
	//show_debug_message("checking right corridor at " + string(checkCorridorX) + ", " + string(checkCorridorY));
	//show_debug_message("checking right door at " + string(checkOtherDoorX) + ", " + string(checkOtherDoorY));
	if (has_door_and_corridor(checkCorridorX, checkCorridorY, checkOtherDoorX, checkOtherDoorY)) {
		unlock_door();
		return;
	}
	
	// No corridor and another closed door found
	show_debug_message("cannot unlock door at " + string(x) + ", " + string(y));
	lock_door();
	//return false;
}

// Returns true if a corridor and door are found at the given positions
function has_door_and_corridor(corridorX, corridorY, otherDoorX, otherDoorY) {
	//if (place_meeting(corridorX, corridorY, obj_corridor) && place_meeting(otherDoorX, otherDoorY, obj_closed_door)) {
	//	show_debug_message("checking at: " + string(x) + ", " + string(y));
	//	show_debug_message("unlock door: right @" + string(corridorX) + ", " + string(corridorY));
	//	return true;
	//} else {
	//	return false;
	//}
	
	//if (place_meeting(corridorX, corridorY, obj_corridor)) {
	//	return instance_place(otherDoorX, otherDoorY, obj_closed_door);
	//} else {
	//	return noone;
	//}
	
	return (place_meeting(corridorX, corridorY, obj_corridor) && place_meeting(otherDoorX, otherDoorY, obj_door));
}

function lock_door() {
	if (object_index == obj_open_door) {
		instance_change(obj_closed_door, true);
		show_debug_message("lock door at " + string(x) + ", " + string(y));
	}
}

function unlock_door() {
	if (object_index == obj_closed_door) {
		instance_change(obj_open_door, true);
		show_debug_message("unlock door at " + string(x) + ", " + string(y));
	}
}
// Check if a closed door is aligned to another door
// If true then unlock the calling door instance
// If it is not aligned to a door on all four sides, lock the calling door instance
function check_door_lock() {
	// Check top
	var checkCorridorX = x;
	var checkCorridorY = y - global.tileSize;
	var checkOtherDoorX = x;
	var checkOtherDoorY = checkCorridorY - global.tileSize;
	if (has_door_and_corridor(checkCorridorX, checkCorridorY, checkOtherDoorX, checkOtherDoorY)) {
		unlock_door();
		return;
	}
	
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
	if (has_door_and_corridor(checkCorridorX, checkCorridorY, checkOtherDoorX, checkOtherDoorY)) {
		unlock_door();
		return;
	}
	
	// No corridor and another closed door found
	lock_door();
}

// Returns true if a corridor and door are found at the given positions
function has_door_and_corridor(corridorX, corridorY, otherDoorX, otherDoorY) {	
	return (place_meeting(corridorX, corridorY, obj_corridor) && place_meeting(otherDoorX, otherDoorY, obj_door));
}

function lock_door() {
	if (object_index == obj_open_door) {
		instance_change(obj_closed_door, true);
	}
}

function unlock_door() {
	if (object_index == obj_closed_door) {
		instance_change(obj_open_door, true);
		sfx_play_door_open();
	}
}
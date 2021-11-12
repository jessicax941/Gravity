function can_rotate() {
	// First check if player is in the doorway/corridor
	if (place_meeting(x, y, obj_corridor)) {
		return false;
	}
	
	// Check if watermelons are grounded, if any of them are not grounded, cannot rotate
	if (instance_exists(obj_watermelon)) {
		with (obj_watermelon) {
			if (!isMelonGrounded) { return false };
		}
	}
	// All watermelons are grounded, now check for player
	with (obj_player) {
		return (isGrounded || (!isGrounded && place_meeting(x, y, obj_beanstalk)));
	}
}

// Called when Z (anti-clockwise) or X (clockwise) is pressed, called from the player
function on_rotate(isClockwise) {
	if (can_rotate()) {
		global.isRotating = true;
		//var beanstalkAttachedToPlayer = instance_place(x, y, obj_beanstalk);
		
		rotate_room(isClockwise);
		rotate_player(isClockwise);
		// Maintain player's position if was on a beanstalk
		//if (beanstalkAttachedToPlayer != noone) {
		//	obj_player.x = beanstalkAttachedToPlayer.x;
		//	obj_player.y = beanstalkAttachedToPlayer.y;
		//}
		
		with (obj_game) { numRotations++; }
		global.isRotating = false;
	}
}

// Called from player 
function rotate_room(isClockwise) {
	var objectsToRotate = ds_list_create();
	var numObj = collision_rectangle_list(global.roomId.bbox_left - global.tileSize/2, global.roomId.bbox_top - global.tileSize/2, 
		global.roomId.bbox_right + global.tileSize/2, global.roomId.bbox_bottom + global.tileSize/2, all, false, true, objectsToRotate, true); // player is excluded
	
	for (var i = 0; i < numObj; i++) {
		var obj = ds_list_find_value(objectsToRotate, i);
		with (obj) {
			rotate_object(isClockwise);
		}
	}

	// Lock or unlock doors if necessary
	with (obj_door) {
		check_door_lock();	
	}
}

function rotate_player(isClockwise) {	
	// Rotate player
	rotate_object(isClockwise);
	
	// Move player if collide with wall/platform after rotating
	// First check if there is collision with the current tile that player is in
	var tileCentres = get_tile_center(x, y);
	var tileCenterX = tileCentres[0];
	var tileCenterY = tileCentres[1];
	
	if (!has_collision(tileCenterX, tileCenterY)) {
		//if (place_meeting(x, y, obj_beanstalk)) { return; }
		// No collision, assign player to the center of current tile
		x = tileCenterX;
		y = tileCenterY;
	} else {
		// Collision with something at current tile, move sprite upwards or downwards
		// Move sprite upwards if no collision with top of sprite
		if (!has_collision(x, bbox_top)) {
			y -= sprite_yoffset;
			return;
		}
		if (!has_collision(x, bbox_bottom)) {
			// Move sprite downwards if no collision with bottom of sprite
			y += sprite_yoffset;
		}
	}
}

// Runs from objects
function rotate_object(isClockwise) {
	var rotation = isClockwise ? -90 : 90;

	// Rotate around centre of room
	var roomCenterX = global.roomId.x;
	var roomCenterY = global.roomId.y;
	var radius = point_distance(roomCenterX, roomCenterY, x, y);
	var phase = point_direction(roomCenterX, roomCenterY, x, y);
	
	phase += rotation;
	x = roomCenterX + radius * dcos(phase);
	y = roomCenterY - radius * dsin(phase);
	
	// Rotate around object's own origin if not player, watermelon, dialog or door
	if (object_index != obj_player && object_index != obj_watermelon && object_index != obj_dialog && object_index != obj_closed_door && object_index != obj_open_door) {
		image_angle += rotation;
	}
	
}
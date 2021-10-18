function can_rotate() {
	show_debug_message("can rotate " + object_get_name(object_index));
	with (obj_player) {
		
		show_debug_message("is grounded: " + string(isGrounded));
		show_debug_message("is not grounded and on beanstalk: " + string(!isGrounded && place_meeting(x, y, obj_beanstalk)));
		return (isGrounded || (!isGrounded && place_meeting(x, y, obj_beanstalk)));
	}
}

// Called when Z (anti-clockwise) or X (clockwise) is pressed, called from the player
function on_rotate(isClockwise) {
	if (can_rotate()) {
		//show_debug_message("can rotate room");
		global.isRotating = true;
		rotate_room(isClockwise);
		rotate_player(isClockwise);
		global.isRotating = false;
	}
}

// Called from player 
function rotate_room(isClockwise) {
	// Rotate only the elements in the layer (room) that player is currently in
	var currRoomLayerId = layer_get_id(global.currentRoomName);
	var roomElements = layer_get_all_elements(currRoomLayerId);

	// Rotate all elements in the layer
	for (var i = 0; i < array_length(roomElements); i++;) {
		var inst = layer_instance_get_instance(roomElements[i]);
		with (inst) {
			rotate_object(isClockwise);
		}
	}
	
	// Lock or unlock doors if necessary
	with (obj_door) {
		check_door_lock();	
	}
}

function rotate_player(isClockwise) {
	// Don't rotate player if on beanstalk
	with (obj_player) {
		if (place_meeting(x, y, obj_beanstalk)) {
			return;
		}
	}
	
	// Rotate player
	rotate_object(isClockwise);
	
	// Move player if collide with wall/platform after rotating
	// First check if there is collision with the current tile that player is in
	var tileCentres = get_tile_center(x, y);
	var tileCenterX = tileCentres[0];
	var tileCenterY = tileCentres[1];
	
	if (!has_collision(tileCenterX, tileCenterY)) {
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

// Runs from objects in room layer
function rotate_object(isClockwise) {
	var rotation = isClockwise ? -90 : 90;

	// Rotate around centre of room
	var roomCenterX = global.roomCenterX;
	var roomCenterY = global.roomCenterY;
	var radius = point_distance(roomCenterX, roomCenterY, x, y);
	var phase = point_direction(roomCenterX, roomCenterY, x, y);
	
	phase += rotation;
	x = roomCenterX + radius * dcos(phase);
	y = roomCenterY - radius * dsin(phase);
	
	// Rotate around object's own origin
	if (object_index != obj_player && object_index != obj_watermelon) {
		image_angle += rotation;
	}
}

function rotate_plant(isClockwise) {
	var roomInst = instance_place(x, y, obj_room);
	if (roomInst != noone) {
		if (roomInst.x == global.roomCenterX && roomInst.y == global.roomCenterY && can_rotate()) {
			// Plant is in the room that player is in
			var prevX = x;
			var prevY = y;
			rotate_object(isClockwise);
			if (object_index == obj_beanstalk && place_meeting(prevX, prevY, obj_player)) {
				// Is a beanstalk that is attached to the player
				show_debug_message("player before: " + string(obj_player.x) + " ," + string(obj_player.y));
				obj_player.x = x;
				obj_player.y = y;
				show_debug_message("player after rotating beanstalk: " + string(obj_player.x) + " ," + string(obj_player.y));
			}
		}
	}
}

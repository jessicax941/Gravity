// Called when Z (anti-clockwise) or X (clockwise) is pressed
function on_rotate(isClockwise) {
	rotate_room(isClockwise);
	rotate_player(isClockwise);
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
	// Rotate player
	rotate_object(isClockwise);
	
	// Move player if collide with wall/platform after rotating
	if (has_collision(x, y)) {
		show_debug_message("collision");
		if (has_collision(x, bbox_top)) {
			// Collision with top of sprite
			y += sprite_yoffset;
		} else {
			// Collision with bottom of sprite
			y -= sprite_yoffset;
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
	if (object_index != obj_player) {
		image_angle += rotation;
	}
}

function rotate_watermelon(isClockwise) {
	var roomInst = instance_place(x, y, obj_room);
	if (roomInst != noone) {
		if (roomInst.x == global.roomCenterX && roomInst.y == global.roomCenterY && obj_player.isGrounded) {
			rotate_object(isClockwise);
		}
	}
}

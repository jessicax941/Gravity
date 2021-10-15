/// @description Rotate room anti-clockwise

if (isGrounded) {
	global.isRotating = true;
	
	// Rotate only the elements in the layer (room) that player is currently in
	var currRoomLayerId = layer_get_id(global.currentRoomName);
	var roomElements = layer_get_all_elements(currRoomLayerId);

	// Rotate all elements in the layer
	for (var i = 0; i < array_length(roomElements); i++;) {
		var inst = layer_instance_get_instance(roomElements[i]);
		with (inst) {
			rotate_object(false);
		}
	}
	
	// Lock or unlock doors if necessary
	with (obj_door) {
		check_door_lock();	
	}
	
	// Rotate player
	rotate_object(false);
	
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
	
	global.isRotating = false;
}
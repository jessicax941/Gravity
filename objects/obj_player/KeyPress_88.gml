if (isGrounded) {
/// @description Rotate room clockwise
isRotating = true;
//show_debug_message("true");

//var roomParent = object_get_parent(obj_wall.object_index);
//with (roomParent) {
//	rotate(true);
//}

// Rotate only the elements in the layer (room) that player is currently in
	var currRoomLayerId = layer_get_id(global.currentRoomName);
	var roomElements = layer_get_all_elements(currRoomLayerId);

	// Find room center object first
	var roomInst;
	for (var i = 0; i < array_length(roomElements); i++;) {
		var inst = layer_instance_get_instance(roomElements[i]);
		if (inst.object_index == obj_room_walls)
		{
			roomInst = inst;
			break;
		}
	}

	// Rotate all elements in the layer
	for (var i = 0; i < array_length(roomElements); i++;) {
		var inst = layer_instance_get_instance(roomElements[i]);
		with (inst) {
			rotate(true, roomInst.x, roomInst.y);
		}
	}

	isRotating = false;
}
//show_debug_message("false");
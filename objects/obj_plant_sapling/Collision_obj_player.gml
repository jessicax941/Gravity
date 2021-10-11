/// @description Grow if SPACE is pressed
var spacePressed = keyboard_check_pressed(vk_space);

if (spacePressed)
{
	var plant = instance_create_layer(x, y, global.currentRoomName, plantObj);
	
	// Make sure plant spawns in front
	var currRoomLayerId = layer_get_id(global.currentRoomName);
	var roomElements = layer_get_all_elements(currRoomLayerId);
	for (var i = 0; i < array_length(roomElements); i++;) {
		var inst = layer_instance_get_instance(roomElements[i]);
		if (inst.object_index == obj_room)
		{
			plant.depth = inst.depth - 1;
			break;
		}
	}
	
	instance_destroy();

}
                      
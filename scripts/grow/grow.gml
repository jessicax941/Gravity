function grow_plant(obj, xx, yy) {
	var plant = instance_create_layer(xx, yy, global.roomId.layer, obj);
	// Make sure plant spawns in front
	//var currRoomLayerId = global.roomId.layer;
	plant.depth = global.roomId.depth - 1;
	//var roomElements = layer_get_all_elements(currRoomLayerId);
	//for (var i = 0; i < array_length(roomElements); i++;) {
	//	var inst = layer_instance_get_instance(roomElements[i]);
	//	if (inst.object_index == obj_room)
	//	{
	//		plant.depth = inst.depth - 1;
	//		break;
	//	}
	//}
	
	return plant;
}

function grow_watermelon() {
	// Grown from sapling
	grow_plant(obj_watermelon, x, y);
	instance_destroy();
}

//function grow_beanstalk() {
	// Grown from watermelon
	//var beanstalk = grow_plant(obj_beanstalk, x, y);
	//instance_destroy();
	
	//for (var i = 1; i < 8; i++) {
	//	// The tile above has no collision objects
	//	//var newBeanstalk = grow_plant(obj_beanstalk);
	//	//newBeanstalk.x = x;
	//	//newBeanstalk.y = tileAboveY;
	//	var tileAboveY = get_tile_center(beanstalk.x, beanstalk.y - global.tileSize * i)[1];
	//	show_debug_message("collision: " + string(has_collision(944, 432)));
	//	show_debug_message("place meeting: " + string(place_meeting(944, 432, obj_platform)));

	//	if (has_collision(beanstalk.x, tileAboveY)) {
	//		break;
	//	}
		
	//	show_debug_message("can grow at " + string(beanstalk.x) + ", " + string(tileAboveY));
	//	grow_plant(obj_beanstalk, beanstalk.x, tileAboveY);
	//}
	
//}
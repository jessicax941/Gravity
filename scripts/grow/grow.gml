function grow_plant(obj, xx, yy) {
	var plant = instance_create_layer(xx, yy, global.roomId.layer, obj);
	// Make sure plant spawns in front
	plant.depth = global.roomId.depth - 1;
	return plant;
}

// Called from sapling
function grow_watermelon() {
	if (obj_game.canGrowMelon) {
		// Grown from sapling
		grow_plant(obj_watermelon, x, y);
		sfx_play_grow_plant();
		instance_destroy();
	} else {
		show_debug_message("cannot grow watermelon");
	}
}

// Called from player
function grow_beanstalk() {
	if (obj_game.canGrowBeanstalk) {
		// Grown from watermelon
		var watermelon = collision_circle(x, y, interactionRadius, obj_watermelon, false, true);
	
		if (watermelon) {
			var beanstalk = grow_plant(obj_beanstalk, watermelon.x, watermelon.y);
			sfx_play_grow_plant();
			// Trigger next dialog if any
			with (obj_dialog_manager) {
				event_user(0);	
			}
			with (watermelon) {
				instance_destroy();
			}
			
			var tileAboveY = get_tile_center(beanstalk.x, beanstalk.y - global.tileSize)[1];
			
			// Grow the other beanstalks until hit a collision object
			while (!has_collision(beanstalk.x, tileAboveY)) {
				// The tile above has no collision objects
				grow_plant(obj_beanstalk, beanstalk.x, tileAboveY);
				tileAboveY = get_tile_center(beanstalk.x, tileAboveY - global.tileSize)[1];
			}
		}
	} else {
		show_debug_message("cannot grow beanstalk");	
	}
}

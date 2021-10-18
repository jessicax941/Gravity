global.collisionObjects = ds_list_create();
ds_list_add(global.collisionObjects, obj_wall, obj_platform, obj_watermelon, obj_walls_horz, obj_walls_vert, obj_closed_door);

// Returns true if there is an object with collision at (targetX, targetY)
function has_collision(targetX, targetY) {
	var length = ds_list_size(global.collisionObjects);
	var hasCollision = false;
	for (var i = 0; i < length; i++) {
		if (place_meeting(targetX, targetY, ds_list_find_value(global.collisionObjects, i))) {
			hasCollision = true;
			break;
		}
	}

	return hasCollision;
}

function has_rect_collision(x1, y1, x2, y2) {
	var length = ds_list_size(global.collisionObjects);
	var hasCollision = false;
	for (var i = 0; i < length; i++) {
		var objectToCheck = ds_list_find_value(global.collisionObjects, i);
		if (objectToCheck) {
			if (collision_rectangle(x1, y1, x2, y2, objectToCheck, false, false) != noone) {
				hasCollision = true;	
				break;
			}
		}
	}
	
	return hasCollision;
}

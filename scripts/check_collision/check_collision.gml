global.collisionObjects = ds_list_create();
ds_list_add(global.collisionObjects, obj_wall, obj_platform);

// Returns true if there is an object with collision at (targetX, targetY)
function has_collision(targetX, targetY) {
	var length = ds_list_size(global.collisionObjects);
	var hasCollision = false;
	for (var i = 0; i < length; i++)
	{
		if (place_meeting(targetX, targetY, ds_list_find_value(global.collisionObjects, i)))
		{
			hasCollision = true;
			break;
		}
	}

	return hasCollision;
}
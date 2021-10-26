// Moves player in horizontal direction, after checking for collisions
function apply_horizontal_movement() {
	// Check for collision at target position
	if (has_collision(x + horizontalSpeed, y)) {
		var isColliding = false;
		while (!isColliding) {
			// Move player step by step as long as there is no collision
			if (!has_collision(x + sign(horizontalSpeed), y)) {
				x += sign(horizontalSpeed);
			} else {
				isColliding = true;
				horizontalSpeed = 0;
			}
		}
	} else {
		x += horizontalSpeed;	
	}
}

function apply_vertical_movement(spd) {
	// Check for collision at target position
	if (has_collision(x, y + spd)) {
		var isColliding = false;
		while (!isColliding) {
			// Move player step by step as long as there is no collision
			if (!has_collision(x, y + sign(spd))) {
				y += sign(spd);
			} else {
				isColliding = true;
				spd = 0;
			}
		}
	} else {
		y += spd;	
	}
}

// For watermelon
function apply_gravity() {
	//var collisionWithWall = collision_rectangle(bbox_left, bbox_bottom - 1, bbox_right, bbox_bottom + 1, obj_wall, false, false) 
	//var collisionWithPlatform = collision_rectangle(bbox_left, bbox_bottom - 1, bbox_right, bbox_bottom + 1, obj_platform, false, false);
	//var collisionWithPlayer = collision_rectangle(bbox_left, bbox_bottom - 1, bbox_right, bbox_bottom + 1, obj_player, false, false);
	var melonCollisionObj = ds_list_create();
	ds_list_copy(melonCollisionObj, global.collisionObjects);
	ds_list_delete(melonCollisionObj, ds_list_find_index(melonCollisionObj, obj_watermelon));
	ds_list_add(melonCollisionObj, obj_player);
	var gravityValue = obj_player.gravityValue;
	var vertSpeed = gravityValue; // Assume no collision first; not grounded
	isMelonGrounded = false;

	for (var i = 0; i < ds_list_size(melonCollisionObj); i++) {
		var collision = collision_rectangle(bbox_left, bbox_bottom - 1, bbox_right, bbox_bottom + 1, ds_list_find_value(melonCollisionObj, i),
			false, false);
		if (collision) {
			isMelonGrounded = true;
			vertSpeed = 0;
			break;
		}
	}
	

	//if (collisionWithWall == noone && collisionWithPlatform == noone && collisionWithPlayer == noone) {
	//	// No collision found	
	//	isMelonGrounded = false;
	//	vertSpeed = gravityValue;
	//} else {
	//	isMelonGrounded = true;
	//	vertSpeed = 0;
	//}

	if (!global.isRotating) {
		// Apply gravity with collision
		if (has_collision(x, y + vertSpeed) || place_meeting(x, y + vertSpeed, obj_player)) {
			// There is collision at final destination
			var isColliding  = false;
			while (!isColliding) {
				// Move object step by step as long as there is no collision
				if (!has_collision(x, y + sign(vertSpeed)) && !place_meeting(x, y + vertSpeed, obj_player)) {
					y += sign(vertSpeed);
				} else {
					isColliding = true;
					vertSpeed = 0;
				}
			}
		} else {
			y += vertSpeed;	
		}
	}	
}
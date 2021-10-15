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

function apply_gravity() {
	// For objects with gravity
	var collisionWithWall = collision_rectangle(bbox_left, bbox_bottom - 1, bbox_right, bbox_bottom + 1, obj_wall, false, false) 
	var collisionWithPlatform = collision_rectangle(bbox_left, bbox_bottom - 1, bbox_right, bbox_bottom + 1, obj_platform, false, false);
	var isGrounded = false; 
	var gravityValue = obj_player.gravityValue;
	var vertSpeed;
	 
	if (collisionWithWall == noone && collisionWithPlatform == noone) {
		// No collision found	
		isGrounded = false;
		vertSpeed = gravityValue;
	} else {
		isGrounded = true;
		vertSpeed = 0;
	}

	if (!global.isRotating) {
		// Apply gravity with collision
		if (has_collision(x, y + vertSpeed)) {
			// There is collision where player wants to go
			var isColliding  = false;
			while (!isColliding) {
				// Move player step by step as long as there is no collision
				if (!has_collision(x, y + sign(vertSpeed))) {
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
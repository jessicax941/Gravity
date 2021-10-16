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

// For objects with gravity (excluding player)
function apply_gravity() {
	var collisionWithWall = collision_rectangle(bbox_left, bbox_bottom - 1, bbox_right, bbox_bottom + 1, obj_wall, false, false) 
	var collisionWithPlatform = collision_rectangle(bbox_left, bbox_bottom - 1, bbox_right, bbox_bottom + 1, obj_platform, false, false);
	var collisionWithPlayer = collision_rectangle(bbox_left, bbox_bottom - 1, bbox_right, bbox_bottom + 1, obj_player, false, false);

	var isGrounded = false; 
	var gravityValue = obj_player.gravityValue;
	var vertSpeed;
	 
	 	//if (!has_rect_collision(bbox_left, bbox_bottom - 1, bbox_right, bbox_bottom + 1)) {

	if (collisionWithWall == noone && collisionWithPlatform == noone && collisionWithPlayer == noone) {
		// No collision found	
		isGrounded = false;
		vertSpeed = gravityValue;
	} else {
		isGrounded = true;
		vertSpeed = 0;
	}

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
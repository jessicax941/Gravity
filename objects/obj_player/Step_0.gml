if (horizontalSpeed != 0) {
	image_xscale = sign(horizontalSpeed);
}

draw_self();

#region GRAVITY AND VERTICAL COLLISION
	// Check if collision object is colliding with player feet and assign vertical speed
	if (!has_rect_collision(bbox_left, y + sprite_yoffset - 1, bbox_right, y + sprite_yoffset + 1)) {
		// No collision found
		isGrounded = false;
		vertSpeed = gravityValue;
	} else {
		isGrounded = true;
		vertSpeed = 0;
	}

	// Apply gravity only when not rotating and not entirely on a beanstalk
	if (!global.isRotating && !position_meeting(x, bbox_top, obj_beanstalk)) {
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

#endregion

#region MOVE ALONG BEANSTALK
	// Move player along the beanstalk if player collides with a beanstalk
	if (place_meeting(x, y, obj_beanstalk)) {
		
		// Move up only if there is a beanstalk above
		if (keyboard_check(vk_up)) {
			if (place_meeting(x, y - global.tileSize, obj_beanstalk)) {
				apply_vertical_movement(-climbingSpeed);
			}
		}
		
		// Move down
		if (keyboard_check(vk_down)) {
			apply_vertical_movement(climbingSpeed);
		}
	}


#endregion
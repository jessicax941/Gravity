//draw_circle_color(x, y, interactionRadius, c_white, c_black, true);

if (horizontalSpeed != 0) {
	image_xscale = sign(horizontalSpeed);
}

draw_self();

#region GRAVITY AND VERTICAL COLLISION
	// Check if collision object is colliding with player and assign vertical speed
	//show_debug_message("y: " + string(y));
	//show_debug_message("bbox_bottom: " + string(bbox_bottom));
	//show_debug_message("y + sprite_yoffset: " + string(y + sprite_yoffset));
	if (!has_rect_collision(bbox_left, y + sprite_yoffset - 1, bbox_right, y + sprite_yoffset + 1)) {
		// No collision found
		//show_debug_message("no collision");
		isGrounded = false;
		vertSpeed = gravityValue;
	} else {
		//show_debug_message("collision");
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

#endregion

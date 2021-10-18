//

if (horizontalSpeed != 0) {
	image_xscale = sign(horizontalSpeed);
}

draw_self();

#region GRAVITY AND VERTICAL COLLISION
	// Check if collision object is colliding with player and assign vertical speed
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

#region GROW BEANSTALK
	var watermelon = collision_circle(x, y, interactionRadius, obj_watermelon, false, true);
	
	if (watermelon) {
		//draw_set_colour(c_white);
		//draw_circle(x, y, 50, true);
		//draw_circle_colour(x, y, 100, c_white, c_red, true);
		var interactPressed = keyboard_check_pressed(vk_space);
		
		if (interactPressed) {
			var beanstalk = grow_plant(obj_beanstalk, watermelon.x, watermelon.y);
			with (watermelon) {
				instance_destroy();
			}
			
			var tileAboveY = get_tile_center(beanstalk.x, beanstalk.y - global.tileSize)[1];
			
			// Grow the other beanstalks
			while (!has_collision(beanstalk.x, tileAboveY)) {
				// The tile above has no collision objects
				//var newBeanstalk = grow_plant(obj_beanstalk);
				//newBeanstalk.x = x;
				//newBeanstalk.y = tileAboveY;		
				grow_plant(obj_beanstalk, beanstalk.x, tileAboveY);
				tileAboveY = get_tile_center(beanstalk.x, tileAboveY - global.tileSize)[1];
			}
				
		}
	}
#endregion
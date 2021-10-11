draw_circle_color(x, y, interactionRadius, c_white, c_black, true);

#region PUSH AND PULL WATERMELON

	// Pushing
	var watermelon = instance_place(x + horizontalSpeed, y, obj_watermelon);
	if (watermelon != noone)
	{
		watermelon.x += horizontalSpeed + sign(horizontalSpeed);
	}
	
	// Pulling
	if (keyboard_check(vk_space))
	{
		watermelon = collision_circle(x, y, sprite_width/2 + 1, obj_watermelon, false, false);
		if (watermelon != noone)
		{
			show_debug_message("hello: " + string(horizontalSpeed));
			watermelon.x += horizontalSpeed;	
		}
	}

#endregion

#region GRAVITY AND VERTICAL COLLISION
	// Check if collision object is colliding with player feet and assign vertical speed 
	var collisionInst = collision_rectangle(bbox_left, bbox_bottom - 1, bbox_right, bbox_bottom + 1, obj_collision, false, false);

	if (collisionInst == noone) {
		// No collision found	
		isGrounded = false;
		vertSpeed = gravityValue;
	} else {
		isGrounded = true;
		vertSpeed = 0;
	}

	if (!global.isRotating) {
		// Apply gravity with collision
		if (has_collision(x, y + vertSpeed))
		{
			// There is collision where player wants to go
			var isColliding  = false;
			while (!isColliding)
			{
				// Move player step by step as long as there is no collision
				if (!has_collision(x, y + sign(vertSpeed)))
				{
					y += sign(vertSpeed);
				}
				else
				{
					isColliding = true;
					vertSpeed = 0;
				}
			}
		}
		else
		{
			y += vertSpeed;	
		}
	}

#endregion

//draw_circle_color(x, y, interactionRadius, c_white, c_black, true);


if (horizontalSpeed != 0) {
	image_xscale = sign(horizontalSpeed);
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);



#region PUSH AND PULL WATERMELON

	// Pushing
	//var watermelon = instance_place(x + interactionRadius, y, obj_watermelon);
	//if (watermelon != noone)
	//{
	//	watermelon.horizontalSpeed = horizontalSpeed + sign(horizontalSpeed);
	//}
	
	//// Pulling
	//if (keyboard_check(vk_space))
	//{
	//	watermelon = collision_circle(x, y, sprite_width/2 + interactionRadius * 2, obj_watermelon, false, false);
	//	if (watermelon != noone)
	//	{
	//		//show_debug_message("pulling: " + string(horizontalSpeed));
	//		watermelon.horizontalSpeed = horizontalSpeed;	
	//	}
	//}

#endregion

#region GRAVITY AND VERTICAL COLLISION
	// Check if collision object is colliding with player and assign vertical speed 
	var collisionInst = collision_rectangle(bbox_left, bbox_bottom - 1, bbox_right, bbox_bottom + 1, obj_collision, false, false);

	if (collisionInst == noone) {
		// No collision found
		show_debug_message("no collision");
		isGrounded = false;
		vertSpeed = gravityValue;
	} else {
		show_debug_message("collision");
		isGrounded = true;
		vertSpeed = 0;
	}

	if (!global.isRotating) {
		// Apply gravity with collision
		if (has_collision(x, y + vertSpeed))
		{
			//show_debug_message("player step: collision at y + vertspeed");
			// There is collision where player wants to go
			var isColliding  = false;
			while (!isColliding)
			{
				// Move player step by step as long as there is no collision
				if (!has_collision(x, y + sign(vertSpeed)))
				{
					//show_debug_message("player step: not colliding");
					y += sign(vertSpeed);
				}
				else
				{
					//show_debug_message("player step: colliding");
					isColliding = true;
					vertSpeed = 0;
				}
			}
		}
		else
		{
			//show_debug_message("player step: y += vertspeed");
			y += vertSpeed;	
		}
	}

#endregion

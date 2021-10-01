function apply_movement()
{
	if (place_meeting(x + horizontalSpeed, y, obj_wall) || place_meeting(x + horizontalSpeed, y, obj_platform))
	{
		// There is collision with wall where player wants to go
		var isColliding = false;
		while (!isColliding)
		{
			// Move player step by step as long as there is no collision
			if (!place_meeting(x + sign(horizontalSpeed), y, obj_wall) && !place_meeting(x + sign(horizontalSpeed), y, obj_platform))
			{
				x += sign(horizontalSpeed);
			}
			else
			{
				isColliding = true;
				horizontalSpeed = 0;
			}
		}
	}
	else
	{
		x += horizontalSpeed;	
	}
}
// Moves player in horizontal direction, after checking for collisions
function apply_horizontal_movement()
{
	// Check for collision at target position
	if (has_collision(x + horizontalSpeed, y))
	{
		var isColliding = false;
		while (!isColliding)
		{
			// Move player step by step as long as there is no collision
			if (!has_collision(x + sign(horizontalSpeed), y))
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
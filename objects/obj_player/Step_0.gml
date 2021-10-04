// Check if grounded and assign vertical speed 
var yBuffer = 1;
if (place_meeting(x, y + yBuffer, obj_platform) || place_meeting(x, y + yBuffer, obj_wall)) 
{
	isGrounded = true;
	vertSpeed = 0;
} 
else 
{
	isGrounded = false;
	vertSpeed = gravityValue;
}

// Apply gravity with collision
if (has_collision(x, y + vertSpeed))
{
	// There is collision with wall where player wants to go
	var isColliding = false;
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
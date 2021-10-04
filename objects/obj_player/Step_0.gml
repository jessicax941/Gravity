// Check if any wall or platform is colliding with player feet and assign vertical speed 
var playerFeetY = y + sprite_height/2;
var playerFeetX1 = x - sprite_width/2; // Left side
var playerFeetX2 = x + sprite_width/2; // Right side
var platformInst = collision_rectangle(playerFeetX1, playerFeetY - 1, playerFeetX2, playerFeetY + 1, obj_platform, false, false);
var wallInst = collision_rectangle(playerFeetX1, playerFeetY - 1, playerFeetX2, playerFeetY + 1, obj_wall, false, false);

if (platformInst == noone && wallInst == noone) {
	// No collision found	
	isGrounded = false;
	vertSpeed = gravityValue;
} else {
	isGrounded = true;
	vertSpeed = 0;
}

if (!isRotating) {
	// Apply gravity with collision
	if (has_collision(x, y + vertSpeed))
	{
		// There is collision where player wants to go
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
}
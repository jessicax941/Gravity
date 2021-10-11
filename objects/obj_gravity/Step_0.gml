/// @description Insert description here
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
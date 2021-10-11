horizontalSpeed = -walkSpeed;

horizontalSpeed = horizontalSpeed*drag;

if (isGrounded) 
{
	apply_horizontal_movement(); // Also considers collision
}


isFacingRight = false;
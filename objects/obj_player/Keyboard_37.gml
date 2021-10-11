horizontalSpeed = -walkSpeed;

horizontalSpeed = horizontalSpeed*drag;

var bboxSide;
if (isGrounded) 
{
	apply_horizontal_movement(); // Also considers collision
}


isFacingRight = false;
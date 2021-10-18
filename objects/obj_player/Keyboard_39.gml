horizontalSpeed = walkSpeed;

horizontalSpeed = horizontalSpeed*drag;
if (isGrounded || !isGrounded && place_meeting(x, y, obj_beanstalk)) {
	apply_horizontal_movement(); // Also considers collision
}
isFacingRight = true;
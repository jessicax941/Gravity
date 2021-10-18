/// @description Rotate room anti-clockwise

if (isGrounded || !isGrounded && place_meeting(x, y, obj_beanstalk)) {
	global.isRotating = true;
	
	var isClockwise = false;
	on_rotate(isClockwise);
	
	global.isRotating = false;
}
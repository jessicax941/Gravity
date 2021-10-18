/// @description Rotate room clockwise

if (isGrounded || !isGrounded && place_meeting(x, y, obj_beanstalk)) {
	global.isRotating = true;

	var isClockwise = true;
	on_rotate(isClockwise);
	
	global.isRotating = false;
}
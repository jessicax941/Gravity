/// @description Rotate room clockwise

if (isGrounded) {
	global.isRotating = true;

	var isClockwise = true;
	on_rotate(isClockwise);
	
	global.isRotating = false;
}
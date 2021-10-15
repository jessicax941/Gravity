/// @description Rotate room anti-clockwise

if (isGrounded) {
	global.isRotating = true;
	
	var isClockwise = false;
	on_rotate(isClockwise);
	
	global.isRotating = false;
}
// Runs from objects in room layer
function rotate(isClockwise, roomCenterX, roomCenterY) {
	var rotation = isClockwise ? -90 : 90;

	// Rotate around centre of room
	//var roomCenterX = room_width / 2;
	//var roomCenterY = room_height / 2;
	var radius = point_distance(roomCenterX, roomCenterY, x, y);
	var phase = point_direction(roomCenterX, roomCenterY, x, y);
	
	phase += rotation;
	x = roomCenterX + radius * dcos(phase);
	y = roomCenterY - radius * dsin(phase);
	
	// Rotate around object's own origin
	image_angle += rotation;
}
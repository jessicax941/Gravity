// Runs from objects in room layer
function rotate_object(isClockwise) {
	var rotation = isClockwise ? -90 : 90;

	// Rotate around centre of room
	var roomCenterX = global.roomCenterX;
	var roomCenterY = global.roomCenterY;
	var radius = point_distance(roomCenterX, roomCenterY, x, y);
	var phase = point_direction(roomCenterX, roomCenterY, x, y);
	
	phase += rotation;
	x = roomCenterX + radius * dcos(phase);
	y = roomCenterY - radius * dsin(phase);
	
	// Rotate around object's own origin
	if (object_index != obj_player) {
		image_angle += rotation;
	}
}

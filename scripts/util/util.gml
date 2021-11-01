function get_tile_center(xx, yy) {
	var tileCenterX = xx - (xx % global.tileSize) + global.tileSize / 2;
	var tileCenterY = yy- (yy % global.tileSize) + global.tileSize / 2;
	
	return [tileCenterX, tileCenterY];
}

function world_to_viewport_coords(xx, yy) {
	// World to camera, camera to viewport
	var cameraSize = 448; // Same for width and height
	var viewportSize = 800; // Same for width and height
	var resultX = (xx - camera_get_view_x(view_camera[0])) / cameraSize * viewportSize;
	var resultY = (yy - camera_get_view_y(view_camera[0])) / cameraSize * viewportSize;
	
	return [resultX, resultY];
}
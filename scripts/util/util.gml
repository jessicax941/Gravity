function get_tile_center(xx, yy) {
	var tileCenterX = xx - (xx % global.tileSize) + global.tileSize / 2;
	var tileCenterY = yy- (yy % global.tileSize) + global.tileSize / 2;
	
	return [tileCenterX, tileCenterY];
}

function world_to_viewport_coords(xx, yy) {
	// World to camera, camera to viewport
	var cameraWidth = 448;
	var cameraHeight = 480;
	var viewportWidth = 896;
	var viewportHeight = 960;
	var resultX = (xx - camera_get_view_x(view_camera[0])) / cameraWidth * viewportWidth;
	var resultY = (yy - camera_get_view_y(view_camera[0])) / cameraHeight * viewportHeight;
	
	return [resultX, resultY];
}
function get_tile_center(xx, yy) {
	var tileCenterX = xx - (xx % global.tileSize) + global.tileSize / 2;
	var tileCenterY = yy- (yy % global.tileSize) + global.tileSize / 2;
	
	return [tileCenterX, tileCenterY];
}
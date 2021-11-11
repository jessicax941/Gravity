isSeqComplete = false;
drawTextX = 0;
drawTextY = 0;
if (instance_exists(obj_text_spawn)) {
	var textSpawn = instance_find(obj_text_spawn, 0);
	var drawCoords = world_to_viewport_coords(textSpawn.x, textSpawn.y);
	drawTextX = drawCoords[0];
	drawTextY = drawCoords[1];
}
nextRoom = room == rm_intro ? rm_level1 : rm_victory;

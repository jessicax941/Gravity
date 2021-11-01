/// @description Draw dialog
lineSeparation = obj_game.dialogSize + 4;
textWidth = 250;
nextStr = "\n\nNEXT [ENTER]";
closeStr = "\n\nCLOSE [ENTER]";
offset = obj_game.dialogSmallerSize*3 + 16; // Between main dialog line and next/close string

if (drawDialog) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(obj_game.dialogFont);
	var drawX = x - camera_get_view_x(view_camera[0]);
	drawX = drawX / 448 * 800;
	var drawY = y - camera_get_view_y(view_camera[0]);
	drawY = drawY / 448 * 800 - offset;
	
	if (currLineNum >= 0 && currLineNum < array_length(dialogArr)) {
		// Draw main dialog line
		draw_text_ext(drawX, drawY, dialogArr[currLineNum], lineSeparation, textWidth);
		
		// Draw next or close string
		var strToDraw = "";
		if (currLineNum < array_length(dialogArr) - 1) {
			strToDraw = nextStr;	
		} else {
			strToDraw = closeStr;
		}
		draw_set_font(obj_game.dialogSmallerFont);
		draw_text_ext(drawX, drawY + offset - 16, strToDraw, lineSeparation, textWidth);
	}
	
}

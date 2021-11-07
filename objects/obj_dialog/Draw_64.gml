/// @description Draw dialog
textWidth = 280;
nextStr = "\n\nNEXT [ENTER]";
closeStr = "\n\nCLOSE [ENTER]";
offset = 20; // For entire dialog
vPadding = 15;
hPadding = 20;

if (drawDialog) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	
	if (currLineNum >= 0 && currLineNum < array_length(dialogArr)) {
		var drawCoords = world_to_viewport_coords(x, y);
		var drawX = drawCoords[0];
		var drawY = drawCoords[1] - vPadding - offset;
		var strToDraw = "";
		if (currLineNum < array_length(dialogArr) - 1) {
			strToDraw = nextStr;	
		} else {
			strToDraw = closeStr;
		}
		
		// Draw rectangle background
		draw_set_font(obj_game.dialogSmallerFont);
		var controlsTextHeight = string_height_ext(strToDraw, -1, textWidth);
		draw_set_font(obj_game.dialogFont);
		var mainTextHeight = string_height_ext(dialogArr[currLineNum], -1, textWidth);
		var mainTextWidth = string_width_ext(dialogArr[currLineNum], -1, textWidth);
		var c = c_dkgray;
		var rectX1 = drawX - mainTextWidth/2 - hPadding;
		var rectY1 = drawY - mainTextHeight - vPadding;
		if (canBeClosed) {
			rectY1 -= controlsTextHeight;
		}
		var rectX2 = drawX + mainTextWidth/2 + hPadding;
		var rectY2 = drawY + vPadding;
		draw_rectangle_color(rectX1, rectY1, rectX2, rectY2, c, c, c, c, false);
		
		// Draw next or close string if dialog can be closed
		if (canBeClosed) {
			draw_set_font(obj_game.dialogSmallerFont);
			draw_text_ext(drawX, drawY - controlsTextHeight, strToDraw, -1, textWidth);	
		}
		
		// Draw main dialog line
		var mainTextY = drawY - mainTextHeight;
		if (canBeClosed) {
			mainTextY -= controlsTextHeight;
		}
		draw_set_font(obj_game.dialogFont);
		draw_text_ext(drawX, mainTextY, dialogArr[currLineNum], -1, textWidth);
	}
	
}

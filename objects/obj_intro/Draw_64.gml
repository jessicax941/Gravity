/// @description Draw "CONTINUE [ENTER]" when seq is complete
if (isSeqComplete) { 
	draw_set_font(obj_game.smallFont);
	draw_set_valign(fa_top);
	draw_set_halign(fa_right);
	var c = c_white;
	draw_text_color(drawTextX, drawTextY, "CONTINUE [ENTER]", c, c, c, c, 1);
}

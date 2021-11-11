function draw_victory() {
	var centerX = vw/2;
	var centerY = vh/2;
	var bgSize = 600;
	var drawX = centerX;
	var drawY = vh/4;
	var spacing = 16;
	var stringWidth = 0;
	var stringHeight = 0;
	
	// Translucent background
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(centerX - bgSize/2, centerY - bgSize/2, centerX + bgSize/2, centerY + bgSize/2, false);
	draw_set_alpha(1);
	
	// Congratulations text
	draw_set_font(titleFont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	//draw_set_color(global.orange);
	draw_set_color(c_white);
	var congratsText = "Congratulations!";
	//stringHeight = string_height(congratsText);
	drawY += string_height(congratsText)/2;
	draw_text(drawX, drawY, congratsText);
	drawY += 100;
	
	// Number of rotations per level
	draw_set_font(textFont);
	draw_text(drawX, drawY, "Number of rotations");
	
	draw_set_font(smallFont);
	draw_set_halign(fa_middle);
	var levelString = "Level X";
	stringWidth = string_width(levelString);
	stringHeight = string_height(levelString);
	var totalRotations = 0;
	for (var i = 0; i < 5; i++) {
		var levelNum = i + 1;
		drawY += stringHeight + spacing;
		// Level on the left
		draw_text(drawX - stringWidth/2, drawY, "Level " + string(levelNum));
		
		// Rotations on the right
		totalRotations += levelRotations[i];
		var numRotationString = string(levelRotations[i]);
		draw_text(drawX + string_width(numRotationString)/2 + 50, drawY, numRotationString);
	}
	
	// Total rotations
	draw_set_font(textFont);
	var totalString = "TOTAL";
	stringWidth = string_width(totalString);
	stringHeight = string_height(totalString);
	drawY += stringHeight + spacing*4;
	var totalRotationString = string(totalRotations);
	draw_text(drawX - stringWidth/2, drawY, totalString);
	draw_text(drawX + string_width(totalRotationString)/2 + 50, drawY, totalRotationString);
	
	// Next button
	var botRightX = vw - 50;
	var botRightY = vh - 50;
	draw_sprite(spr_btn_next, 0, botRightX - sprite_get_width(spr_btn_next)/2, botRightY);
	draw_sprite(spr_selector, 0, botRightX + sprite_get_width(spr_selector), botRightY);
	
	draw_set_color(c_white);
}

function process_victory_input() {
	if (enterKey) {
		audio_play_sound(snd_button_click, global.sfxPriority, false);
		room_goto(rm_credits);	
	}
}
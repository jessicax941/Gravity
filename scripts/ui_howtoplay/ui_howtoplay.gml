function draw_howtoplay() {
	var startingX = vw - 50;
	var startingY = vh - 50;

	draw_sprite(spr_howtoplay, howToPlayPage, 0, 0);
		
	var spacing = 12;
	var drawY = startingY + 5;
	// Confirm to enter text
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(textFont);
	var textC = global.orange;
	var text = "";
	if (global.gamePaused) {
		text = "PAUSE MENU";
	} else if (room == rm_start) {
		text = "MAIN MENU";
	}
	draw_text_color(startingX - string_width(text)/2, drawY, text, textC, textC, textC, textC, 1);
	if (howToPlayPos == array_length(howToPlaySprites)) { // MAIN MENU or PAUSE MENU button
		draw_sprite(spr_selector, 0, startingX + sprite_get_width(spr_selector), drawY);
	}
		
	// How to play buttons
	for (var i = array_length(howToPlaySprites) - 1; i >= 0; i--) {
		var sprite = howToPlaySprites[i];
		var drawX = startingX - sprite_get_width(sprite)/2;
		drawY -= (sprite_get_height(sprite) + spacing);
		
		if (howToPlayPage == 0 && sprite == spr_btn_back) { continue; }
		if (howToPlayPage == (numHowToPlayPages - 1) && sprite == spr_btn_next) { continue; }
		
		draw_sprite(sprite, 0, drawX, drawY);
		if (howToPlayPos == i) { draw_sprite(spr_selector, 0, startingX + sprite_get_width(spr_selector), drawY); }
	}
}

function process_howtoplay_input() {
	// Change button position based on input
	if (howToPlayPage == 0) {
		// First page
		if (upKey || downKey) {
			howToPlayPos = howToPlayPos == 0 ? 2 : 0;	
		}
		
	} else if (howToPlayPage == (numHowToPlayPages - 1)) {
		// Last page
		if (upKey || downKey) {
			howToPlayPos = howToPlayPos == 1 ? 2 : 1;	
		}
		
	} else {
		// Pages in between	
		howToPlayPos += (downKey - upKey);
		if (howToPlayPos < 0) {
			howToPlayPos = numHowToPlayButtons; // Including MAIN MENU or PAUSE MENU button
		}
		if (howToPlayPos >= numHowToPlayButtons) {
			howToPlayPos = 0;
		}
	}
	
	if (upKey || downKey || enterKey) {
		audio_play_sound(snd_button_click, global.sfxPriority, false);
	}
	
	// Process button press
	if (enterKey) {
		switch (howToPlayPos) {
			case 0: // Next button
				if (howToPlayPage != (numHowToPlayPages - 1)) {
					// Not last page
					howToPlayPage++;
				}
				break;
			
			case 1: // Back button
				if (howToPlayPage != 0) {
					// Not first page
					howToPlayPage--;
				}
				break;
				
			case 2: // Main menu or pause menu button
				global.isHowToPlayOpen = false;
				howToPlayPage = 0;
				break;
				
		}
		
		// Reset button position
		if (howToPlayPage != (numHowToPlayPages - 1)) {
			// Not last page
			howToPlayPos = 0;
		} else {
			howToPlayPos = 1;
		}
	}
	
}
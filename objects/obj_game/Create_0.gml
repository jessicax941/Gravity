//itimTitle = font_add("Itim-Regular.ttf", 64, false, false, 32, 128);
//itimText = font_add("Itim-Regular.ttf", 32, false, false, 32, 128);

//zenTitle = font_add("ZenKurenaido-Regular.ttf", 64, true, false, 32, 128);
//zenText = font_add("ZenKurenaido-Regular.ttf", 32, true, false, 32, 128);

titleSize = 64;
textSize = 32;
smallSize = 20;
pixelTitle = font_add("orange_kid.ttf", titleSize, true, false, 32, 128);
pixelText = font_add("orange_kid.ttf", textSize, true, false, 32, 128);
smallText = font_add("orange_kid.ttf", smallSize, true, false, 32, 128);

titleFont = pixelTitle;
textFont = pixelText; 
smallFont = smallText;

options = ["Start", "Options", "Quit"];
menuSprites = [spr_btn_start, spr_btn_options, spr_btn_quit];
pos = 0;

vw = camera_get_view_width(view_camera[0]); 
vh = camera_get_view_height(view_camera[0]);

hasSeenHowToPlay = false; // Set to false for playtesting
howToPlay = ["Goal: Escape from each level's labyrinth by\nrotating rooms, growing plants\nand finding the exit.",
				"Move: Arrow keys", "Rotate clockwise: D", "Rotate anticlockwise: A", "Grow plants: Space", "Restart level: R"];

totalRotations = 0;

audio_play_sound(m_bgm, 1, true);

//itimTitle = font_add("Itim-Regular.ttf", 64, false, false, 32, 128);
//itimText = font_add("Itim-Regular.ttf", 32, false, false, 32, 128);

//zenTitle = font_add("ZenKurenaido-Regular.ttf", 64, true, false, 32, 128);
//zenText = font_add("ZenKurenaido-Regular.ttf", 32, true, false, 32, 128);

//enum MenuLevel {
//	MainMenu,
//	Instructions,
//	InGame,
//	Pause
//}

titleSize = 64;
textSize = 32;
smallSize = 20;
pixelTitle = font_add("orange_kid.ttf", titleSize, true, false, 32, 128);
pixelText = font_add("orange_kid.ttf", textSize, true, false, 32, 128);
smallText = font_add("orange_kid.ttf", smallSize, true, false, 32, 128);

titleFont = pixelTitle;
textFont = pixelText; 
smallFont = smallText;

menuSprites = [spr_btn_start, spr_btn_instructions, spr_btn_options, spr_btn_quit];
levelSprites = [spr_level1_5, spr_level2_5, spr_level3_5, spr_level4_5, spr_level5_5];
pos = 0;

var roomViewport = room_get_viewport(room, 0);
vw = roomViewport[3]; // Get width
vh = roomViewport[4]; // Get height

hasSeenHowToPlay = false; // Set to false for playtesting
howToPlayFromStart = "GO BACK [BACKSPACE]\nPLAY [ENTER]";
howToPlayFromInstructions = "GO BACK [BACKSPACE]";
//howToPlay = ["Goal: Escape from each level's labyrinth by\nrotating rooms, growing plants\nand finding the exit.",
//				"Move: Arrow keys", "Rotate clockwise: D", "Rotate anticlockwise: A", "Grow plants: Space", "Restart level: R"];

totalRotations = 0;

//bgm_play();
load_sfx();

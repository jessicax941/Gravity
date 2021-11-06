//enum MenuLevel {
//	MainMenu,
//	Instructions,
//	InGame,
//	Pause
//}

// Font sizes
titleSize = 64;
textSize = 32;
smallSize = 22;
dialogSize = 20;
dialogSmallerSize = 16;

titleFont = font_add("wooden-log.ttf", titleSize, true, false, 32, 128);
textFont = font_add("wooden-log.ttf", textSize, true, false, 32, 128);
smallFont = font_add("wooden-log.ttf", smallSize, true, false, 32, 128);
dialogFont = font_add("wooden-log.ttf", dialogSize, true, false, 32, 128);
dialogSmallerFont = font_add("wooden-log.ttf", dialogSmallerSize, true, false, 32, 128);

// UI
menuSprites = [spr_btn_start, spr_btn_instructions, spr_btn_options, spr_btn_credits, spr_btn_quit];
//pauseOptions = ["Music Volume", "SFX Volume"];
levelSprites = [spr_level1_5, spr_level2_5, spr_level3_5, spr_level4_5, spr_level5_5];
startMenuPos = 0;
howToPlaySprites = [spr_btn_start, spr_btn_next, spr_btn_back];
howToPlayPos = 0;
howToPlayPage = 0;
var roomViewport = room_get_viewport(room, 0);
vw = roomViewport[3]; // Get width
vh = roomViewport[4]; // Get height

//howToPlayFromStart = "GO BACK [BACKSPACE]\nPLAY [ENTER]";
//howToPlayFromInstructions = "GO BACK [BACKSPACE]";

// Game logic
totalRotations = 0;
// SHOULD BE FALSE BY DEFAULT
canGrowMelon = true;
canGrowBeanstalk = false;
canGrowTreeOfLife = false;

bgm_play();
load_sfx();

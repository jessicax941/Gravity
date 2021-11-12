/// @description Reset number of rotations
numRotations = 0;

// Reset powers every time player starts level 1
if (room == rm_level1) {
	canGrowMelon = false;
	canGrowBeanstalk = false;
	canGrowTreeOfLife = false;
}

if (room == rm_ending) {
	bgm_fade_out_normal();
}

/// @description Get room layer and activate powerups
global.roomId = id;
if (activateGrowingMelon) {
	with (obj_player) {
		canGrowMelon = true;	
	}
}

if (activateGrowingBeanstalk) {
	with (obj_player) {
		canGrowBeanstalk = true;
	}
}

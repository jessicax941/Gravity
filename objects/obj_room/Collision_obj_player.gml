/// @description Move camera, assign room id
// Move camera to new room that player is in
global.roomId = id;
var cam = view_camera[0]; 
camera_set_view_pos(cam, x - camera_get_view_width(cam)/2, y - camera_get_view_height(cam)/2);

//// Activate powerups
//if (activateGrowingMelon) {
//	with (obj_game) {
//		canGrowMelon = true;	
//	}
//}

//if (activateGrowingBeanstalk) {
//	with (obj_game) {
//		canGrowBeanstalk = true;
//	}
//}

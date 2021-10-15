/// @description Rotate clockwise
var roomInst = instance_place(x, y, obj_room);
if (roomInst != noone) {
	if (roomInst.x == global.roomCenterX && roomInst.y == global.roomCenterY && obj_player.isGrounded) {
		show_debug_message("rotate");
		rotate_object(true);
	}
}
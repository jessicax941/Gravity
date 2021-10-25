/// @description Move player up when growing watermelon
isMelonGrounded = false;

var player = instance_place(x, y, obj_player);
if (player != noone) {
	player.x = x;
	player.y = y - global.tileSize;
}
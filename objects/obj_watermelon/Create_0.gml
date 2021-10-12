/// @description Insert description here
var player = instance_place(x, y, obj_player);
if (player != noone)
{
	player.x = x;
	player.y = y - global.tileSize;
}
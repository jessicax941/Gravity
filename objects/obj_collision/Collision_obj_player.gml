/// @description Move player backwards if collide
global.tileSize = 32;

with (obj_player)
{
	if (isFacingRight)
	{
		x = x - (x mod global.tileSize) - global.tileSize/2;
	}
	else
	{
		x += (x mod global.tileSize);
	}
}


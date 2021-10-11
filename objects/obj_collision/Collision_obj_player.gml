/// @description Move player backwards if collide
global.tileSize = 32;
//var newX;
with (obj_player)
{
	var leftDisplacement = x - (x mod global.tileSize) - global.tileSize/2;
	var rightDisplacement = x + (x mod global.tileSize); 
	//if (isFacingRight)
	//{
	//	newX = x - (x mod global.tileSize) - global.tileSize/2;
	//}
	//else
	//{
	//	newX = x + (x mod global.tileSize);
	//}
	if (isFacingRight)
	{
		if (!place_meeting(leftDisplacement, y, obj_collision))
		{
			x = leftDisplacement;
		}
		else
		{
			if (!place_meeting(rightDisplacement, y, obj_collision))
			{
				x = rightDisplacement;
			}
		}
	}
	else
	{
		// Facing left
		if (!place_meeting(rightDisplacement, y, obj_collision))
		{
			x = rightDisplacement;
		}
		else
		{
			if (!place_meeting(leftDisplacement, y, obj_collision))
			{
				x = leftDisplacement;
			}
		}	
	}
	
}




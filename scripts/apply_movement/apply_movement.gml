// Moves player in horizontal direction, after checking for collisions
function apply_horizontal_movement()
{
	// Check for collision at target position
	//if (has_collision(x + horizontalSpeed, y))
	//{
	//	var isColliding = false;
	//	while (!isColliding)
	//	{
	//		// Move player step by step as long as there is no collision
	//		if (!has_collision(x + sign(horizontalSpeed), y))
	//		{
	//			x += sign(horizontalSpeed);
	//		}
	//		else
	//		{
	//			isColliding = true;
	//			horizontalSpeed = 0;
	//		}
	//	}
	//}
	//else
	//{
	//	x += horizontalSpeed;	
	//}
	var bboxSide;
	
	if (horizontalSpeed > 0)
	{
		bboxSide = bbox_right;
	} 
	else
	{
		bboxSide = bbox_left;
	}
	
	var topRightCollision = tilemap_get_at_pixel(tilemap, bboxSide + horizontalSpeed, bbox_top) != 0;
	var bottomRightCollision = tilemap_get_at_pixel(tilemap, bboxSide + horizontalSpeed, bbox_bottom) != 0;

	if (topRightCollision || bottomRightCollision)
	{
		if (horizontalSpeed > 0)
		{
			x = x - (x mod global.tileSize) + (global.tileSize - 1) - (bbox_right - x);
		} 
		else 
		{
			x = x - (x mod global.tileSize) - (bbox_left - x);
		}
		horizontalSpeed = 0;
	}
	
	x += horizontalSpeed;
	
}

function apply_vertical_movement() {
	
	var bboxSide;
	
	if (vertSpeed > 0)
	{
		bboxSide = bbox_bottom;
	} 
	else
	{
		bboxSide = bbox_top;
	}
	
	var leftCollision = tilemap_get_at_pixel(tilemap, bbox_left, bboxSide + vertSpeed) != 0;
	var rightCollision = tilemap_get_at_pixel(tilemap, bbox_right, bboxSide + vertSpeed) != 0;

	if (leftCollision || rightCollision)
	{
		if (vertSpeed > 0)
		{
			y = y - (y mod global.tileSize) + (global.tileSize - 1) - (bbox_bottom - y);
		} 
		else 
		{
			y = y - (y mod global.tileSize) - (bbox_top - y);
		}
		vertSpeed = 0;
	}
	
	y += vertSpeed;
}

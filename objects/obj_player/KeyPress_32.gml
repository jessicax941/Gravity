/// @description Grow plants
// Detect growing of beanstalk if close enough to watermelon
grow_beanstalk();

// Only grow tree of life if level 6, is colliding with the dead tree and can grow it
if (room == rm_level6 && place_meeting(x, y, obj_tree_of_life_dead) && obj_game.canGrowTreeOfLife) {
	room_goto(rm_ending);
}

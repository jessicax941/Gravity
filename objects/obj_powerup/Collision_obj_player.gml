/// @description Player gains power
if (object_index == obj_powerup_melon) {
	with (obj_game) {
		canGrowMelon = true;
		show_debug_message("activated melon powerup");
	}
}

if (object_index == obj_powerup_beanstalk) {
	with (obj_game) {
		canGrowBeanstalk = true;
		show_debug_message("activated beanstalk powerup");
	}
}

if (object_index == obj_powerup_tree_of_life) {
	with (obj_game) {
		canGrowTreeOfLife = true;
		show_debug_message("activated tree of life powerup");
	}
}
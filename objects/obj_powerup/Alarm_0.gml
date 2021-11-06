/// @description Spawn dialog after 2 secs
dialog = instance_create_layer(obj_player.x, obj_player.y - obj_player.sprite_yoffset, layer, obj_dialog);
if (object_index == obj_powerup_melon) {
	with (dialog) {
		dialogId = "d2-1";
	}
}

if (object_index == obj_powerup_beanstalk) {
	with (dialog) {
		dialogId = "d4-1";
	}
	obj_dialog_manager.isWaitingForBeanstalkTrigger = true;
}

if (object_index == obj_powerup_tree_of_life) {
	with (dialog) {
		dialogId = "d5-2";
	}
}

instance_destroy();
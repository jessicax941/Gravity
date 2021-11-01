/// @description Spawn dialog after player grows beanstalk
if (isWaitingForBeanstalkTrigger) {
	isWaitingForBeanstalkTrigger = false;
	dialog = instance_create_layer(obj_player.x, obj_player.y - obj_player.sprite_yoffset,
		"Rooms", obj_dialog);
	with (dialog) {
		dialogId = "d5";
	}
}


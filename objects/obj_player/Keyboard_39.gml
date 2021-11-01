horizontalSpeed = walkSpeed;

horizontalSpeed = horizontalSpeed*drag;
if (isGrounded || !isGrounded && place_meeting(x, y, obj_beanstalk)) {
	apply_horizontal_movement(); // Also considers collision
	
	if (place_meeting(x, y, obj_watermelon_sapling)) {
		sfx_play(snd_walk_sapling);
	} else {
		sfx_pause(snd_walk_sapling);	
	}
}
isFacingRight = true;
/// @description Grow into watermelon if interaction key is pressed
//sfx_play_walk_on_sapling();

var interactPressed = keyboard_check_pressed(vk_space);

if (interactPressed)
{
	grow_watermelon();
}
                      
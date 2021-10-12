/// @description Apply gravity
// You can write your code in this editor
apply_gravity();

var interactionRadius = 3;
if (collision_circle(x, y, sprite_width/2 + interactionRadius, obj_player, false, false))
{
	apply_horizontal_movement();
}
/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 0402DB44
/// @DnDArgument : "code" "// Check if grounded and assign vertical speed $(13_10)var yBuffer = 1;$(13_10)if (place_meeting(x, y + yBuffer, obj_platform) || place_meeting(x, y + yBuffer, obj_wall)) $(13_10){$(13_10)	isGrounded = true;$(13_10)	vertSpeed = 0;$(13_10)} $(13_10)else $(13_10){$(13_10)	isGrounded = false;$(13_10)	vertSpeed += gravityValue;$(13_10)}$(13_10)$(13_10)// Apply gravity$(13_10)y += vertSpeed;$(13_10)$(13_10)show_debug_message(isGrounded);"
// Check if grounded and assign vertical speed 
var yBuffer = 1;
if (place_meeting(x, y + yBuffer, obj_platform) || place_meeting(x, y + yBuffer, obj_wall)) 
{
	isGrounded = true;
	vertSpeed = 0;
} 
else 
{
	isGrounded = false;
	vertSpeed += gravityValue;
}

// Apply gravity
y += vertSpeed;

show_debug_message(isGrounded);
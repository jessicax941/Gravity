/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 01E32FCF
/// @DnDArgument : "expr" "walkSpeed"
/// @DnDArgument : "var" "currSpeed"
currSpeed = walkSpeed;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7A6A19D5
/// @DnDArgument : "expr" "currSpeed*drag"
/// @DnDArgument : "var" "currSpeed"
currSpeed = currSpeed*drag;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 03BD64BA
/// @DnDArgument : "expr" "currSpeed"
/// @DnDArgument : "expr_relative" "1"
/// @DnDArgument : "var" "x"
x += currSpeed;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 65FCD239
/// @DnDArgument : "expr" "true"
/// @DnDArgument : "var" "isFacingRight"
isFacingRight = true;
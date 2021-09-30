/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5498440A
/// @DnDArgument : "expr" "walkSpeed"
/// @DnDArgument : "var" "currSpeed"
currSpeed = walkSpeed;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7BE4AC71
/// @DnDArgument : "expr" "currSpeed*drag"
/// @DnDArgument : "var" "currSpeed"
currSpeed = currSpeed*drag;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5551BD08
/// @DnDArgument : "expr" "-currSpeed"
/// @DnDArgument : "expr_relative" "1"
/// @DnDArgument : "var" "x"
x += -currSpeed;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 45093D43
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "isFacingRight"
isFacingRight = false;
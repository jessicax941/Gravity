/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 01E32FCF
/// @DnDArgument : "expr" "walkSpeed"
/// @DnDArgument : "var" "horizontalSpeed"
horizontalSpeed = walkSpeed;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7A6A19D5
/// @DnDArgument : "expr" "horizontalSpeed*drag"
/// @DnDArgument : "var" "horizontalSpeed"
horizontalSpeed = horizontalSpeed*drag;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 03BD64BA
/// @DnDArgument : "expr" "horizontalSpeed"
/// @DnDArgument : "expr_relative" "1"
/// @DnDArgument : "var" "x"
x += horizontalSpeed;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 65FCD239
/// @DnDArgument : "expr" "true"
/// @DnDArgument : "var" "isFacingRight"
isFacingRight = true;
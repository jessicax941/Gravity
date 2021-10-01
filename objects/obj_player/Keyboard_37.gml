/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5498440A
/// @DnDArgument : "expr" "walkSpeed"
/// @DnDArgument : "var" "horizontalSpeed"
horizontalSpeed = walkSpeed;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7BE4AC71
/// @DnDArgument : "expr" "horizontalSpeed*drag"
/// @DnDArgument : "var" "horizontalSpeed"
horizontalSpeed = horizontalSpeed*drag;

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 509F4A0D
/// @DnDDisabled : 1
/// @DnDArgument : "var" "newPositionX"
/// @DnDArgument : "value" "x - horizontalSpeed"


/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5551BD08
/// @DnDArgument : "expr" "-horizontalSpeed"
/// @DnDArgument : "expr_relative" "1"
/// @DnDArgument : "var" "x"
x += -horizontalSpeed;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 45093D43
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "isFacingRight"
isFacingRight = false;

/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1.1
/// @DnDHash : 28C44BA0
/// @DnDDisabled : 1
/// @DnDArgument : "x" "newPositionX"
/// @DnDArgument : "y" "y"
/// @DnDArgument : "object" "obj_wall"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "object" "obj_wall"
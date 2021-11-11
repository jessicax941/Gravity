/// @description Play footstep sound
if event_data[? "event_type"] == "sprite event"
{
switch (event_data[? "message"])
    {
    case "footstep":
		sfx_play_walk_stone();
        
		show_debug_message("footstep");
        break;
	default:
		// Do nothing
        break;
    }
}


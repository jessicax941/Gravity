if event_data[? "event_type"] == "sequence event"
{
switch (event_data[? "message"])
    {
    case "seq-end":
        isSeqComplete = true;
		
		show_debug_message("sequence ended");
        break;
	default:
		// Do nothing
        break;
    }
}

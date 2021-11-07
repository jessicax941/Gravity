/// @description Create map of dialogs
global.dialogMap = ds_map_create();

ds_map_add(global.dialogMap, "d1-1", // Level 1 room 1 (on entering the room)
	["Oh no... I have to revive the Tree of Life!", 
	"I better explore this forest, I can move around using [LEFT] and [RIGHT] keys", 
	"I can feel some strange magic here... I wonder what would happen if I press [Q] or [E]"]);

ds_map_add(global.dialogMap, "d1-2", // Level 1 room 2 (on reaching the sapling)
	["Oh a sapling! There’s still some life left after all"]);
	
ds_map_add(global.dialogMap, "d2-1", // Level 2 room 2 (after picking up powerup)
	["I feel some kind of power surging through me...", "Maybe I can help this sapling grow by pressing [SPACE]..."]);
	
ds_map_add(global.dialogMap, "d3-1", // Level 3 room 1 (on entering the room)
	["I wonder how I could use that melon?"]);
	
ds_map_add(global.dialogMap, "d4-1", // Level 4 room 1 (after picking up powerup)
	["I feel stronger!", 
	"I think I can grow the melons even more now by pressing [SPACE]"]);
	
ds_map_add(global.dialogMap, "d4-2", // Level 4 room 2 (after growing melon to beanstalk)
	["A beanstalk! I should be able to climb it with the [UP] and [DOWN] keys", 
	"Maybe I can hold on to it when I rotate the room"]);
	
ds_map_add(global.dialogMap, "d4-3", // Level 4 room 2 (on entering the room)
	["There's a corridor up there, I wonder how I could get to it"]);
	
ds_map_add(global.dialogMap, "d5-1", // Level 5 room 1 (on entering the room)
	["Oh, there seems to be two paths I can explore"]);
	
ds_map_add(global.dialogMap, "d5-2", // Level 5 last room (on picking up powerup)
	["This is it! I should be strong enough now to revive the Tree of Life!"]);
	
ds_map_add(global.dialogMap, "d6-1", // Level 6 (on entering the room)
	["I’m back where I started! Time to save this forest!"]);
	
ds_map_add(global.dialogMap, "d6-2", // Level 6 (on colliding with exit)
	["I can't leave yet! The Tree of Life still needs saving :("]);

// Triggers
isWaitingForBeanstalkTrigger = false;







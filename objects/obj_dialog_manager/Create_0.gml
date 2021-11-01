/// @description Create map of dialogs

//dialogLines = {
//	d0 : ["I have to revive the tree of life...", "I better explore this forest, I can move around using LEFT and RIGHT keys"],
//}

global.dialogMap = ds_map_create();

ds_map_add(global.dialogMap, "d0", // Level 1 room 1
	["I have to revive the tree of life...", "I better explore this forest, I can move around using LEFT and RIGHT keys."]);
ds_map_add(global.dialogMap, "d1", // Level 1 room 1
	["I can feel some strange magic here... I wonder what would happen if I press Q or E."]);
ds_map_add(global.dialogMap, "d2", // Level 2 room 2
	["Oh a sapling! I’m sure it can help me, I can help it grow by pressing SPACE."]);
ds_map_add(global.dialogMap, "d3", // Level 3 room 1
	["I wonder how I could use that melon?"]);
ds_map_add(global.dialogMap, "d4", // Level 4 room 1
	["I feel stronger! I think I can grow melons more now by pressing SPACE."]);
ds_map_add(global.dialogMap, "d5", // Level 4 room 1 (triggered when beanstalk is grown)
	["A beanstalk! I should be able to climb it with the UP and DOWN keys.", "Maybe I can hold on to it when I rotate the room."]);
ds_map_add(global.dialogMap, "d6", // Level 4 room 2
	["There's a corridor up there, I wonder how I could get to it."]);
ds_map_add(global.dialogMap, "d7", // Level 5 last room
	["This is it! I should be strong enough now to revive the Tree of Life!"]);








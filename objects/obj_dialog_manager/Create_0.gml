/// @description Create map of dialogs

dialogLines = {
	l1r1 : ["I have to revive the tree of life...", "I better explore this forest, I can move around using LEFT and RIGHT keys"],
}

global.dialogMap = ds_map_create();

ds_map_add(global.dialogMap, "l1r1", dialogLines.l1r1);





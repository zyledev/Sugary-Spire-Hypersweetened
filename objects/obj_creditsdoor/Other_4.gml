if (place_meeting(x, y, obj_player))
	visited = true;
with (instance_place(x, y, obj_doortrigger_parent))
	other.targetDoor = id_door;
ini_open("saveData.ini");
var entrywayrank = ini_read_string("Ranks", "entryway", "none");
var cottonrank = ini_read_string("Ranks", "steamy", "none");
var moleassrank = ini_read_string("Ranks", "molasses", "none");
var minesrank = ini_read_string("Ranks", "mines", "none");
if (!(entrywayrank != "none" && cottonrank != "none" && moleassrank != "none" && minesrank != "none"))
	instance_destroy();

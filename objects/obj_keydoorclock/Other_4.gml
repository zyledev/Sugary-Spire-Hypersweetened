if (place_meeting(x, y, obj_player))
	visited = true;
if (ds_list_find_index(global.saveroom, id) != -1)
	sprite_index = spr_clockdoor;
with (instance_place(x, y, obj_doortrigger_parent))
	other.targetDoor = id_door;

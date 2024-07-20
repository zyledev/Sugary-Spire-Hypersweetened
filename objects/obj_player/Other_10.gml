var yoffset = 160;
var _door = obj_doortrigger_parent;
with (obj_doortrigger_parent)
{
	if (other.targetDoor == id_door)
		_door = id;
}
if (instance_exists(_door))
{
	if (hallway)
		x = _door.x + (hallwaydirection * 32);
	else if (vertical)
		x = _door.x + verticaloffset;
	else if (box)
		x = _door.x + 32;
	else
		x = _door.x + 16;
	if (vertical)
		y = _door.y + (hallwaydirection * yoffset);
	else
		y = _door.y - 14;
	show_debug_message("Door Trigger \"" + string(targetDoor) + "\" found");
}
else
	show_debug_message("Door Trigger Instance not found");
hallway = false;
box = false;
vertical = false;
roomstartx = x;
roomstarty = y;
if ((!room_exists(targetRoom) && room == rm_missing) || targetRoom == rm_missing)
	show_debug_message("Room \"" + string(targetRoom) + "\" does not exist. Sent Player to \"rm_missing\"");

var _check = false;
if (room == room_gmliveblank && global.GMLIVE_roomstart)
{
	_check = true;
	global.GMLIVE_roomstart = false;
}
else if (room != room_gmliveblank)
{
	_check = true;
	global.GMLIVE_realroom = room;
}
if (_check)
	event_user(0);

if (ds_list_find_index(global.saveroom, room) == -1)
{
	visible = false;
	_message = scr_roomnames(room);
	if (_message != "NO ROOMNAME FOUND-1265")
	{
		visible = true;
		showtext = true;
		alarm[0] = 200;
		ds_list_add(global.saveroom, room);
	}
}

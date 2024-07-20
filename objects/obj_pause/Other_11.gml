var roomname = room_get_name(room);
if (string_letters(roomname) == "entryway" || string_letters(roomname) == "entrywaysecret")
{
	instance_activate_all();
	scr_playerreset();
	room = entryway_1;
	pause = false;
	with (obj_player)
		targetDoor = "A";
	with (instance_create(x, y, obj_fadeout))
	{
		fadealpha = 1;
		fadein = true;
	}
}
else if (string_letters(roomname) == "steamy" || string_letters(roomname) == "steamysecret")
{
	instance_activate_all();
	scr_playerreset();
	room = steamy_1;
	pause = false;
	with (obj_player)
		targetDoor = "A";
	with (instance_create(x, y, obj_fadeout))
	{
		fadealpha = 1;
		fadein = true;
	}
}
else if (string_letters(roomname) == "molasses" || string_letters(roomname) == "molassesb" || string_letters(roomname) == "molassesc" || string_letters(roomname) == "molassesd" || string_letters(roomname) == "molassessecret")
{
	instance_activate_all();
	scr_playerreset();
	room = molasses_1;
	pause = 0;
	with (obj_player)
		targetDoor = "A";
	with (instance_create(x, y, obj_fadeout))
	{
		fadealpha = 1;
		fadein = true;
	}
}
else if (string_letters(roomname) == "mines" || string_letters(roomname) == "minesB" || string_letters(roomname) == "minessecret")
{
	instance_activate_all();
	scr_playerreset();
	room = mines_1;
	pause = 0;
	with (obj_player)
		targetDoor = "A";
	with (instance_create(x, y, obj_fadeout))
	{
		fadealpha = 1;
		fadein = true;
	}
}
else
	scr_sound(sound_enemythrow);

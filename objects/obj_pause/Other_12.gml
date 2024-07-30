///@description exit
audio_stop_sound(mu_pause);
if (room != rank_room && room != hub_room1 && room != outer_room1 && room != outer_room2 && room != scootercutsceneidk)
{
	global.pause = false;
	instance_activate_all();
	scr_playerreset();
	room_goto(hub_room1);
	with (obj_tv)
		tvsprite = spr_tvoff;
	with (obj_player)
		targetDoor = "A";
	with (instance_create(x, y, obj_fadeout))
	{
		fadealpha = 1;
		fadein = true;
	}
}
else if (room == hub_room1 || room == outer_room1 || room == outer_room2 || room == scootercutsceneidk)
{
	global.pause = false;
	instance_activate_all();
	scr_playerreset();
	room = realtitlescreen;
	with (obj_player)
	{
		scr_characterspr();
		state = states.titlescreen;
	}
	with (obj_tv)
		tvsprite = spr_tvoff;
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

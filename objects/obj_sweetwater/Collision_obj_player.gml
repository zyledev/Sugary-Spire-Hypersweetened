if (obj_player.state == states.shocked)
{
	obj_player.state = states.normal;
	obj_tv.staticdraw = true;
	obj_tv.statictimer = 20;
	if (!instance_exists(obj_tasershockwave))
		instance_create(x, y, obj_tasershockwave);
}
if (obj_player.state == states.bushdisguise)
{
	obj_player.state = states.normal;
	obj_tv.staticdraw = true;
	obj_tv.statictimer = 20;
}

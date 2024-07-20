if (instance_exists(obj_checkpoint))
{
	var _checkpoint = instance_nearest(x, y, obj_checkpoint);
	x = _checkpoint.x;
	y = _checkpoint.y;
	instance_create(_checkpoint.x, _checkpoint.y, obj_poofeffect);
}
else
{
	x = roomstartx;
	y = roomstarty;
	instance_create(roomstartx, roomstarty, obj_poofeffect);
}
if (instance_exists(obj_train))
{
	with (obj_train)
	{
		x = xstart;
		y = ystart;
		movespeed = 10;
		image_index = 0;
		sprite_index = spr_spray;
		go = 0;
	}
}

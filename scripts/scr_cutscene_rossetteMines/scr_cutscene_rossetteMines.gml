function cutscene_rosetteMines_prestart()
{
	var finished = false;
	with (obj_player)
	{
		state = states.actor;
		image_speed = 0.35;
		if (grounded)
		{
			if (sprite_index == spr_fall)
			{
				image_index = 0;
				sprite_index = spr_land;
			}
			if (sprite_index != spr_land || (sprite_index == spr_land && animation_end()))
				finished = true;
		}
		else
		{
			hsp = approach(hsp, 0, 1);
			sprite_index = spr_fall;
		}
	}
	if (finished)
		cutscene_event_end();
}
function cutscene_rosetteMines_start()
{
	var finished = false;
	var target_x = obj_rosette.x - 64;
	with (obj_player)
	{
		image_speed = 0.35;
		if (-sign(x - target_x) != 0)
			xscale = -sign(x - target_x);
		if (movespeed < 7)
			movespeed += 0.5;
		else if (floor(movespeed) >= 7)
			movespeed = 7;
		hsp = lengthdir_x(movespeed, point_direction(x, 0, target_x, 0));
		if (hsp != 0)
		{
			if (movespeed < 3 && move != 0)
				image_speed = 0.35;
			else if (movespeed > 3 && movespeed < 6)
				image_speed = 0.45;
			else
				image_speed = 0.6;
			sprite_index = spr_move;
		}
		if (point_distance(x, 0, target_x, 0) <= 7 && grounded)
		{
			movespeed = 0;
			hsp = 0;
			vsp = 0;
			image_speed = 0.35;
			x = target_x;
			if (-sign(x - obj_rosette.x) != 0)
				xscale = -sign(x - obj_rosette.x);
			finished = true;
		}
	}
	if (finished)
	{
		obj_rosette.sprite_index = spr_rosettegivetreat;
		obj_rosette.image_index = 0;
		cutscene_event_end();
	}
}
function cutscene_rosetteMines_middle()
{
	var finished = false;
	with (obj_player)
	{
		image_speed = 0.35;
		sprite_index = spr_idle;
	}
	with (obj_rosette)
	{
		sprite_index = spr_rosettegivetreat;
		if (animation_end())
			finished = true;
	}
	if (finished)
	{
		obj_player.sprite_index = spr_player_donutget;
		obj_player.image_index = 7;
		obj_rosette.sprite_index = spr_rosettegavetreat;
		cutscene_event_end();
	}
}
function cutscene_rosetteMines_grab()
{
	var finished = false;
	with (obj_player)
	{
		image_speed = 0.35;
		sprite_index = spr_player_donutget;
		if (animation_end())
			finished = true;
	}
	if (finished)
		cutscene_event_end();
}
function cutscene_rosetteMines_end()
{
	global.treat = true;
	with (obj_player)
		state = states.normal;
	cutscene_event_end();
}

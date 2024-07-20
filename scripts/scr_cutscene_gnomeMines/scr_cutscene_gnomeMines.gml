function cutscene_gnomeMines_start()
{
	var finished = false;
	var _gnome = cutscene_get_actor("GNOMECHOMPSKI");
	var target_x = _gnome.x - (60 * sign(_gnome.image_xscale));
	if (!finished)
	{
		with (obj_player)
		{
			state = states.actor;
			sprite_index = spr_idle;
			movespeed = 0;
			hsp = 0;
			vsp = 0;
			image_speed = 0.35;
			x = target_x;
			if (-sign(x - _gnome.x) != 0)
				xscale = -sign(x - _gnome.x);
			finished = true;
		}
	}
	if (finished)
	{
		with (_gnome)
		{
			sprite_index = spr_gnomechompskiblowupbegin;
			image_index = 0;
			image_xscale *= -1;
		}
		cutscene_event_end();
	}
}
function cutscene_gnomeMines_middle()
{
	var finished = false;
	var _gnome = cutscene_get_actor("GNOMECHOMPSKI");
	with (obj_player)
	{
		image_speed = 0.35;
		sprite_index = spr_idle;
	}
	with (_gnome)
	{
		if (sprite_index == spr_gnomechompskiblowup && floor(image_index) == 6)
		{
			with (wall)
				instance_destroy();
			camera_shake(20, 40);
			finished = true;
		}
	}
	if (finished)
		cutscene_event_end();
}
function cutscene_gnomeMines_end()
{
	global.treat = false;
	with (obj_player)
		state = states.normal;
	cutscene_event_end();
}

with (instance_nearest(x, y, obj_player))
{
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == states.cotton && sprite_index == spr_cotton_attack)
	{
		with (other.id)
			instance_destroy();
	}
	if (((place_meeting(x, y + vsp, other.id) && vsp > 0) || place_meeting(x, y + 1, other.id)) && state == states.cottondrill)
	{
		with (other.id)
			instance_destroy();
	}
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == states.minecart)
	{
		with (other.id)
			instance_destroy();
	}
}

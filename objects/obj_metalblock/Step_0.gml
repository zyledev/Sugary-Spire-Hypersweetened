with (instance_nearest(x, y, obj_player))
{
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (state == states.mach3 || state == states.knightpep || state == states.puddle || state == states.rocketfistpizzano || state == states.knightpepslopes || state == states.hookshot || state == states.machroll || state == states.machpizzano || state == states.minecart || (state == states.knightpep && momemtum)))
	{
		with (other.id)
			event_user(0);
	}
	if (((place_meeting(x, y + vsp, other.id) && vsp < 0) || place_meeting(x, y - 1, other.id)) && state == states.Sjump)
	{
		with (other.id)
			event_user(0);
	}
	if (((place_meeting(x, y + vsp, other.id) && vsp >= 0) || place_meeting(x, y + 1, other.id)) && state == states.freefallland && freefallsmash > 10)
	{
		with (other.id)
			event_user(0);
	}
}

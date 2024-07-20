if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{
		sprite_index = spr_player_fireass;
		state = states.fireass;
		image_index = 0;
		vsp = -20;
		audio_stop_sound(sound_fireass);
		scr_sound(sound_fireass);
	}
	if (obj_player.state == states.cotton || obj_player.state == states.cottondrill)
		instance_create(x, y, obj_poofeffect);
}

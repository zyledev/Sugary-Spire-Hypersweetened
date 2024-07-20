with (obj_player)
{
	if (state != states.Sjump)
	{
		scr_sound(sound_superjumprelease);
		sprite_index = spr_player_superjump;
		state = states.Sjump;
		vsp = -12;
		movespeed = 12;
		other.image_index = 0;
		other.image_speed = 0.35;
		freefallsmash = 0;
	}
}
obj_player.x = x;

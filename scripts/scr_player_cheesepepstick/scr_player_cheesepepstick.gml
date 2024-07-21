function scr_player_cheesepepstick()
{
	alarm[5] = 2;
	alarm[7] = 60;
	hurted = true;
	grav = 0.5;
	image_index = 0;
	sprite_index = spr_cheesepep_jump;
	state = states.cheesepep;
	image_speed = 0.35;
}

function scr_player_Sjumpprep()
{
	combo = 0;
	mach2 = 0;
	move = key_left + key_right;
	if (sprite_index == spr_player_superjumpprep)
	{
		if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
			hsp = xscale * movespeed;
		else if (place_meeting(x, y + 1, obj_railh))
			hsp = (xscale * movespeed) - 5;
		else if (place_meeting(x, y + 1, obj_railh2))
			hsp = (xscale * movespeed) + 5;
		if (movespeed >= 0)
			movespeed -= 0.8;
	}
	if (sprite_index == spr_player_superjumppreplight || sprite_index == spr_player_superjumpright || sprite_index == spr_player_superjumpleft)
	{
		if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
			hsp = move * 2;
		else if (place_meeting(x, y + 1, obj_railh))
			hsp = (move * 2) - 5;
		else if (place_meeting(x, y + 1, obj_railh2))
			hsp = (move * 2) + 5;
	}
	if (sprite_index != spr_player_superjumpprep)
	{
		if (sign(hsp) == 0)
			sprite_index = spr_player_superjumppreplight;
		if (sign(hsp) == 1)
		{
			if (xscale == 1)
				sprite_index = spr_player_superjumpright;
			if (xscale == -1)
				sprite_index = spr_player_superjumpleft;
		}
		if (sign(hsp) == -1)
		{
			if (xscale == 1)
				sprite_index = spr_player_superjumpleft;
			if (xscale == -1)
				sprite_index = spr_player_superjumpright;
		}
	}
	start_running = true;
	alarm[4] = 14;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	machslideAnim = true;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_superjumpprep)
		sprite_index = spr_player_superjumppreplight;
	if (!key_up && (grounded || Sjumpcan_doublejump) && (sprite_index == spr_player_superjumppreplight || sprite_index == spr_player_superjumpleft || sprite_index == spr_player_superjumpright || sprite_index == spr_pizzano_sjumpprep) && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
	{
		scr_sound(sound_superjumprelease);
		instance_create(x, y, obj_explosioneffect);
		sprite_index = spr_player_superjump;
		if (character == "N")
			sprite_index = spr_pizzano_sjump;
		state = states.Sjump;
		vsp = -12;
		movespeed = 12;
		Sjumpcan_doublejump = false;
	}
	if (!audio_is_playing(sound_superjumpcharge2))
		scr_sound(sound_superjumpcharge2);
	image_speed = 0.35;
}

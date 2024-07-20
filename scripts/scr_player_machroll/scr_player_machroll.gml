function scr_player_machroll()
{
	if (!place_meeting(x, y + 1, obj_railh))
		hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
		hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
		hsp = (xscale * movespeed) + 5;
	mach2 = 100;
	machslideAnim = true;
	move = key_right + key_left;
	if (grounded)
		sprite_index = spr_player_machroll;
	if (((!key_down && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16)) || !grounded) && character == "P")
	{
		sprite_index = spr_player_mach4;
		state = states.mach3;
	}
	if (scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
		scr_sound(sound_maximumspeedland);
		with (obj_camera)
		{
			shake_mag = 20;
			shake_mag_acc = 40 / room_speed;
		}
		hsp = 0;
		image_speed = 0.35;
		with (obj_baddie)
		{
			if (point_in_camera(x, y, view_camera[0]) && grounded)
			{
				stun = true;
				alarm[0] = 200;
				ministun = false;
				vsp = -5;
				hsp = 0;
				image_xscale *= -1;
			}
		}
		combo = 0;
		state = states.bump;
		hsp = -2.5;
		vsp = -3;
		mach2 = 0;
		image_index = 0;
		instance_create(x + 10, y + 10, obj_bumpeffect);
	}
	if (scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
		scr_sound(sound_maximumspeedland);
		with (obj_camera)
		{
			shake_mag = 20;
			shake_mag_acc = 40 / room_speed;
		}
		hsp = 0;
		image_speed = 0.35;
		combo = 0;
		state = states.bump;
		hsp = 2.5;
		vsp = -3;
		mach2 = 0;
		image_index = 0;
		instance_create(x - 10, y + 10, obj_bumpeffect);
	}
	if (!instance_exists(obj_cloudeffect) && grounded)
		instance_create(x, y + 43, obj_cloudeffect);
	image_speed = 0.8;
	if (!key_down && (!scr_solid(x + 27, y - 32) && (!scr_solid(x - 27, y - 32) && (!scr_solid(x, y - 32) && !scr_solid(x, y - 16)))))
	{
		image_index = 0;
		scr_sound(sound_rollgetup);
		state = states.mach2;
		if (character == "P")
			sprite_index = spr_player_rollgetup;
	}
	if ((!key_down && (!scr_solid(x + 27, y - 32) && (!scr_solid(x - 27, y - 32) && (!scr_solid(x, y - 32) && !scr_solid(x, y - 16))))) && !key_attack && character == "P")
	{
		image_index = 0;
		scr_sound(sound_rollgetup);
		state = states.normal;
		if (character == "P")
			sprite_index = spr_player_rollgetup;
	}
	if (grounded)
		sprite_index = spr_machroll;
	else if (sprite_index != spr_dive)
	{
		sprite_index = spr_dive;
		vsp = 10;
	}
	if (key_jump2 && character == "N")
	{
		sprite_index = spr_pizzano_twirl;
		state = states.pizzanotwirl;
		vsp = -12;
	}
}

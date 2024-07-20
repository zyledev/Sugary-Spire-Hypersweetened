function scr_player_Sjump()
{
	if (character == "P" || sprite_index != spr_pizzano_sjump)
		hsp = 0;
	else if (character == "N" && sprite_index == spr_pizzano_sjump)
		hsp = move * 3;
	Sjumpcan_doublejump = false;
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	move = key_left + key_right;
	if (move != 0)
		xscale = move;
	if (sprite_index == spr_player_superjump || sprite_index == spr_pizzano_sjump)
	{
		vsp = -movespeed;
		movespeed = approach(movespeed, 18, 1);
	}
	if (sprite_index == spr_pizzano_sjumpprep)
		vsp = 0;
	if (sprite_index == spr_pizzano_sjumpprep && floor(image_index) == (image_number - 1))
	{
		sprite_index = spr_pizzano_sjump;
		vsp = -10;
	}
	if (scr_solid(x, y + vsp) && !place_meeting(x, y + vsp, obj_boxofpizza) && !place_meeting(x, y + vsp, obj_metalblock) && !place_meeting(x, y + vsp, obj_destructibles))
	{
		scr_sound(sound_maximumspeedland);
		sprite_index = spr_player_superjumpland;
		with (obj_camera)
		{
			shake_mag = 10;
			shake_mag_acc = 30 / room_speed;
		}
		with (obj_baddie)
		{
			if (point_in_camera(x, y, view_camera[0]) && grounded)
			{
				image_index = 0;
				state = baddiestates.idle;
				vsp = -7;
				hsp = 0;
			}
		}
		image_index = 0;
		state = states.Sjumpland;
		machhitAnim = false;
		movespeed = 0;
	}
	image_speed = 0.5;
	if (key_attack2 && !grounded && vsp < -10 && character == "P")
	{
		if (move != 0)
			xscale = move;
		movespeed = 12;
		machhitAnim = false;
		state = states.mach3;
		flash = true;
		vsp = -5;
		image_index = 0;
		sprite_index = spr_player_dashpad;
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.xscale;
	}
	if (key_slap2 && !grounded && vsp < -10 && character == "N")
	{
		flash = true;
		charged = false;
		sprite_index = spr_pizzano_sjumpprepside;
		image_index = 0;
		movespeed = 0;
		vsp = 0;
		mach2 = 0;
		state = states.rocketfistpizzano;
		xscale = move;
	}
	scr_collide_player();
}

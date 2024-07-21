function scr_player_normal()
{
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 2;
		facehurt = 0;
	}
	mach2 = 0;
	move = -input.key_left.check + input.key_right.check;
	hsp = move * movespeed;
	if (!machslideAnim && !landAnim && !shotgunAnim)
	{
		if (move == 0)
		{
			if (idle < 400)
				idle++;
			if (idle >= 300 && floor(image_index) == (image_number - 1))
			{
				shotgunAnim = false;
				facehurt = false;
				idle = 0;
				image_index = 0;
			}
			if (sprite_index != spr_caneidle && !global.panic && sprite_index != spr_player_3hpidle)
			{
				if (idle >= 300 && sprite_index != spr_idle1 && sprite_index != spr_idle2 && sprite_index != spr_idle3)
				{
					randomise();
					idleanim = random_range(0, 100);
					if (idleanim <= 33)
						sprite_index = spr_idle1;
					else if (idleanim > 33 && idleanim < 66)
						sprite_index = spr_idle2;
					else if (idleanim > 66)
						sprite_index = spr_idle3;
					image_index = 0;
				}
				if (idle < 300)
				{
					if (!facehurt)
					{
						if (windingAnim < 1800 || angry)
						{
							start_running = true;
							movespeed = 0;
							if (character == "P")
							{
								if (global.cane)
									sprite_index = spr_caneidle;
								else
									sprite_index = spr_idle;
							}
							else if (character == "N")
							{
								if (charged)
									sprite_index = spr_pizzano_chargedidle;
								else
									sprite_index = spr_idle;
							}
						}
						else if (character == "P")
						{
							idle = 0;
							windingAnim--;
							sprite_index = spr_player_winding;
						}
					}
					else if (facehurt && character == "P")
					{
						windingAnim = false;
						if (sprite_index != spr_player_facehurtup && sprite_index != spr_player_facehurt)
							sprite_index = spr_player_facehurtup;
						if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_facehurtup)
							sprite_index = spr_player_facehurt;
					}
				}
			}
			if (global.panic)
				sprite_index = spr_escapeidle;
			if (instance_exists(obj_coneball) && sprite_index == spr_escapeidle)
				sprite_index = spr_timesupidle;
		}
		if (move != 0)
		{
			machslideAnim = false;
			idle = 0;
			facehurt = false;
			if (angry)
				sprite_index = spr_player_3hpwalk;
			else if (global.cane)
				sprite_index = spr_canewalk;
			else
				sprite_index = spr_move;
		}
		if (move != 0)
			xscale = move;
	}
	if (landAnim)
	{
		if (!shotgunAnim)
		{
			if (move == 0)
			{
				movespeed = 0;
				sprite_index = spr_land;
				if (floor(image_index) == (image_number - 1))
					landAnim = false;
			}
			if (move != 0)
			{
				sprite_index = spr_land2;
				if (floor(image_index) == (image_number - 1))
				{
					landAnim = false;
					if (!global.cane)
						sprite_index = spr_move;
					else
						sprite_index = spr_canewalk;
					image_index = 0;
				}
			}
		}
		if (shotgunAnim)
		{
			sprite_index = spr_shotgun_land;
			if (floor(image_index) == (image_number - 1))
			{
				landAnim = false;
				if (!global.cane)
					sprite_index = spr_move;
				else
					sprite_index = spr_canewalk;
				image_index = 0;
			}
		}
	}
	if (machslideAnim)
	{
		sprite_index = spr_machslideend;
		if (floor(image_index) == (image_number - 1) && sprite_index == spr_machslideend)
			machslideAnim = false;
	}
	if (!landAnim)
	{
		if (shotgunAnim && move == 0)
			sprite_index = spr_shotgun_idle;
		else if (shotgunAnim)
			sprite_index = spr_shotgun_walk;
	}
	if (scr_solid(x + sign(hsp), y) && xscale == 1 && move == 1 && !place_meeting(x + 1, y, obj_slope))
		movespeed = 0;
	if (scr_solid(x + sign(hsp), y) && xscale == -1 && move == -1 && !place_meeting(x - 1, y, obj_slope))
		movespeed = 0;
	jumpstop = false;
	if (!grounded && !input.key_jump.pressed)
	{
		if (!shotgunAnim)
			sprite_index = spr_fall;
		else
			sprite_index = spr_shotgun_fall;
		jumpAnim = false;
		state = states.jump;
		image_index = 0;
	}
	if (character == "P")
	{
		if (input.key_mach.check && grounded && !(scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + xscale, y, obj_slope)) && !(scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + xscale, y, obj_slope)))
		{
			mach2 = 0;
			if (movespeed < 6)
				movespeed = 6;
			sprite_index = spr_mach1;
			jumpAnim = true;
			state = states.mach1;
			image_index = 0;
		}
	}
	if (character == "N" && input.key_mach.check)
	{
		if (!charged)
		{
			mach2 = 0;
			if (movespeed < 6)
				movespeed = 6;
			sprite_index = spr_mach1;
			jumpAnim = true;
			state = states.mach1;
			image_index = 0;
		}
		else
		{
			charged = false;
			sprite_index = spr_pizzano_sjumpprepside;
			image_index = 0;
			movespeed = 0;
			vsp = 0;
			mach2 = 0;
			state = states.rocketfistpizzano;
		}
	}
	if (character == "C" && input.key_mach.check)
		state = states.coneboyinhale3;
	if (input.key_jump.pressed && grounded && !input.key_down.check)
	{
		scr_sound(sound_jump);
		sprite_index = spr_jump;
		if (shotgunAnim)
			sprite_index = spr_shotgun_jump;
		instance_create(x, y, obj_highjumpcloud2);
		vsp = -12;
		state = states.jump;
		image_index = 0;
		jumpAnim = true;
	}
	if (grounded && input_buffer_jump < 8 && !input.key_down.check && !input.key_mach.check && vsp > 0)
	{
		scr_sound(sound_jump);
		sprite_index = spr_jump;
		if (shotgunAnim)
			sprite_index = spr_shotgun_jump;
		instance_create(x, y, obj_highjumpcloud2);
		stompAnim = false;
		vsp = -11;
		state = states.jump;
		jumpAnim = true;
		jumpstop = false;
		image_index = 0;
		freefallstart = false;
	}
	if ((input.key_down.check && grounded) || scr_solid(x, y - 3))
	{
		state = states.crouch;
		landAnim = false;
		crouchAnim = true;
		image_index = 0;
		idle = 0;
	}
	if (move != 0)
	{
		if (movespeed < 7)
			movespeed += 0.5;
		else if (floor(movespeed) == 7)
			movespeed = 7;
	}
	else
		movespeed = 0;
	if (movespeed > 7)
		movespeed -= 0.1;
	momemtum = false;
	if (move != 0)
	{
		xscale = move;
		if (movespeed < 3 && move != 0)
			image_speed = 0.35;
		else if (movespeed > 3 && movespeed < 6)
			image_speed = 0.45;
		else
			image_speed = 0.6;
	}
	else
		image_speed = 0.35;
	if (character == "P" && (input.key_attack.pressed && !input.key_down.check && !suplexmove && !shotgunAnim && global.cane != true) && obj_player.character != "G" && !input.key_mach.check)
	{
		scr_sound(sound_suplex1);
		instance_create(x, y, obj_slaphitbox);
		suplexmove = true;
		vsp = 0;
		instance_create(x, y, obj_jumpdust);
		image_index = 0;
		sprite_index = spr_suplexdash;
		state = states.handstandjump;
	}
	if (character == "N" && (input.key_attack.pressed && !input.key_down.check && !suplexmove && !shotgunAnim && global.cane != true) && obj_player.character != "G" && obj_player.sprite_index != spr_mach1 && sprite_index != spr_airdash1 && sprite_index != spr_airdash2 && !input.key_mach.check)
	{
		scr_sound(sound_suplex1);
		instance_create(x, y, obj_slaphitbox);
		suplexmove = true;
		vsp = 0;
		instance_create(x, y, obj_jumpdust);
		image_index = 0;
		sprite_index = spr_pizzano_shoulderbash;
		state = states.pizzanoshoulderbash;
		movespeed = 10;
	}
	if (input.key_taunt.pressed)
	{
		taunttimer = 20;
		tauntstoredmovespeed = movespeed;
		tauntstoredsprite = sprite_index;
		tauntstoredstate = state;
		state = states.backbreaker;
		if (supertauntcharged)
		{
			image_index = 0;
			sprite_index = choose(spr_player_supertaunt1, spr_player_supertaunt2, spr_player_supertaunt3);
		}
		else
		{
			image_index = irandom_range(0, sprite_get_number(spr_player_taunt));
			sprite_index = spr_player_taunt;
		}
		instance_create(x, y, obj_taunteffect);
	}
	if (!instance_exists(obj_cloudeffect) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
		instance_create(x, y + 43, obj_cloudeffect);
	if (input.key_attack.pressed && input.key_up.check)
	{
		grounded = false;
		vsp = -15;
		state = states.uppercut;
		suplexmove = true;
		sprite_index = spr_player_uppercutbegin;
		image_index = 0;
		scr_sound(sound_jump);
		scr_sound(sound_rollgetup);
		scr_sound(sound_suplex1);
	}
	if (global.cane)
	{
		if (scr_solid(x + sign(hsp), y) && (xscale == 1 && (move == 1 && !place_meeting(x + 1, y, obj_slope))))
			movespeed = 0;
		if (scr_solid(x + sign(hsp), y) && (xscale == -1 && (move == -1 && !place_meeting(x - 1, y, obj_slope))))
			movespeed = 0;
		if (input.key_jump.check && grounded && !canrebound)
		{
			sprite_index = spr_player_canefall;
			vsp = -15;
			canrebound = true;
			state = states.jump;
		}
		if (input.key_attack.pressed && !input.key_down.check && !suplexmove && !shotgunAnim)
		{
			scr_sound(sound_suplex1);
			instance_create(x, y, obj_slaphitbox);
			suplexmove = true;
			vsp = 0;
			instance_create(x, y, obj_jumpdust);
			image_index = 0;
			sprite_index = spr_canesuplex;
			state = states.handstandjump;
			if (character == "DEEZNUTS")
				vsp = -5;
		}
	}
	if (input.key_attack.pressed && character == "G")
	{
		state = states.gumbobmixnbrew;
		image_index = 0;
		sprite_index = spr_gumbob_brew_pulloutdrink;
	}
}

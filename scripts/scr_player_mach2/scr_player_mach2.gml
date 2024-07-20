function scr_player_mach2()
{
	switch (character)
	{
		case "P":
		case "N":
			if (windingAnim < 2000)
				windingAnim++;
			if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
				hsp = xscale * movespeed;
			else if (place_meeting(x, y + 1, obj_railh))
				hsp = (xscale * movespeed) - 5;
			else if (place_meeting(x, y + 1, obj_railh2))
				hsp = (xscale * movespeed) + 5;
			move2 = key_right2 + key_left2;
			move = key_right + key_left;
			crouchslideAnim = true;
			if (sprite_index != spr_null)
			{
				if (!key_jump2 && !jumpstop && vsp < 0.5)
				{
					vsp /= 2;
					jumpstop = true;
				}
			}
			if (sprite_index != spr_null)
			{
				if (character == "P")
				{
					if (grounded && vsp > 0)
						jumpstop = false;
					if (input_buffer_jump < 8 && grounded && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1) && key_attack)
					{
						image_index = 0;
						sprite_index = spr_secondjump1;
						scr_sound(sound_jump);
						vsp = -9;
					}
				}
				else if (character == "N")
				{
					if (key_jump2 && (grounded && vsp > 0) && !jumpstop)
					{
						state = states.pizzanotwirl;
						sprite_index = spr_pizzano_twirl;
						vsp = -12;
					}
				}
			}
			if (grounded && sprite_index != spr_null)
			{
				if (!machpunchAnim && sprite_index != spr_mach && sprite_index != spr_player_mach3 && sprite_index != spr_player_machhit)
				{
					if (sprite_index != spr_player_machhit && sprite_index != spr_player_rollgetup)
						sprite_index = spr_mach;
				}
				if (machpunchAnim)
				{
					if (!punch && sprite_index != spr_machpunch1)
					{
						sprite_index = spr_machpunch1;
						image_index = 0;
					}
					if (punch && sprite_index != spr_machpunch2)
					{
						sprite_index = spr_machpunch2;
						image_index = 0;
					}
					if (animation_end())
					{
						punch = !punch;
						machpunchAnim = false;
					}
				}
			}
			if (!grounded)
				machpunchAnim = false;
			if (mach2 < 100)
				mach2 += 1.5;
			if (mach2 >= 100 && grounded && character == "P")
			{
				machhitAnim = false;
				state = states.mach3;
				flash = true;
				sprite_index = spr_player_mach4;
				instance_create(x, y, obj_jumpdust);
				if (movespeed < 12)
					movespeed = 12;
			}
			if (movespeed >= 10 && grounded && character == "N")
			{
				if (!charged)
				{
					charged = true;
					flash = true;
				}
			}
			if (sprite_index != spr_null)
			{
				if (key_jump)
					input_buffer_jump = 0;
				if (!key_attack && grounded)
				{
					alarm[0] = 240;
					scr_sound(sound_break);
					sprite_index = spr_machslidestart;
					state = states.machslide;
					image_index = 0;
					mach2 = 0;
				}
			}
			if (move == -1 && xscale == 1 && grounded)
			{
				scr_sound(sound_maximumspeedstop);
				sprite_index = spr_machslideboost;
				state = states.machslide;
				image_index = 0;
				mach2 = 35;
			}
			if (move == 1 && xscale == -1 && grounded)
			{
				scr_sound(sound_maximumspeedstop);
				sprite_index = spr_machslideboost;
				state = states.machslide;
				image_index = 0;
				mach2 = 35;
			}
			if (key_down2 && grounded)
			{
				sprite_index = spr_crouchslip;
				if (character == "P")
					machhitAnim = false;
				state = states.crouchslide;
			}
			if (((!grounded && place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_slope)) || (grounded && place_meeting(x + hsp, y - 32, obj_solid) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_metalblock) && place_meeting(x, y + 1, obj_slope))) && character == "P")
			{
				wallspeed = movespeed;
				state = states.climbwall;
			}
			if (grounded && !scr_slope() && place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_slope))
			{
				movespeed = 0;
				state = states.normal;
			}
			if (!instance_exists(obj_dashcloud) && grounded)
			{
				with (instance_create(x, y, obj_dashcloud))
					sprite_index = spr_dashcloud2;
			}
			if ((!grounded && sprite_index != spr_secondjump2 && sprite_index != spr_mach2jump) && sprite_index != spr_null && sprite_index != spr_player_bump)
				sprite_index = spr_secondjump1;
			if (floor(image_index) == (image_number - 1) && sprite_index == spr_secondjump1)
				sprite_index = spr_secondjump2;
			if (grounded && (floor(image_index) == (image_number - 1) && sprite_index == spr_player_rollgetup))
				sprite_index = spr_mach;
			if (key_taunt2)
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
			if (sprite_index == spr_player_rollgetup)
				image_speed = 0.4;
			else
				image_speed = 0.65;
			if (character == "N" && key_down2)
			{
				sprite_index = spr_pizzano_crouchslide;
				state = states.machroll;
			}
			if (character == "N" && key_up && key_slap2 && charged)
			{
				flash = true;
				alarm[0] = 240;
				image_index = 0;
				state = states.Sjump;
				sprite_index = spr_pizzano_sjumpprep;
			}
			if (key_slap2 && !key_down && !suplexmove && !shotgunAnim && global.cane != true)
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
			break;
	}
}

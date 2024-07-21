function scr_player_mach1()
{
	switch (character)
	{
		case "N":
		case "P":
			dir = xscale;
			move = key_left + key_right;
			landAnim = false;
			if (scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + 1, y, obj_slope))
			{
				mach2 = 0;
				state = states.normal;
				movespeed = 0;
			}
			if (scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x - 1, y, obj_slope))
			{
				mach2 = 0;
				state = states.normal;
				movespeed = 0;
			}
			if (movespeed <= 8)
				movespeed += 0.5;
			machhitAnim = false;
			crouchslideAnim = true;
			hsp = xscale * movespeed;
			if (grounded && xscale == 1 && move == -1)
			{
				momemtum = false;
				mach2 = 0;
				movespeed = 0;
				image_index = 0;
				xscale = -1;
			}
			if (grounded && xscale == -1 && move == 1)
			{
				momemtum = false;
				mach2 = 0;
				movespeed = 0;
				image_index = 0;
				xscale = 1;
			}
			if (grounded)
			{
				if (mach2 < 35)
					mach2++;
				if (mach2 >= 35)
				{
					charged = 0;
					movespeed = 10;
					state = states.mach2;
					instance_create(x, y, obj_jumpdust);
				}
			}
			sprite_index = spr_mach1;
			if (!grounded)
			{
				sprite_index = spr_airdash1;
				momemtum = true;
				state = states.jump;
				jumpAnim = false;
				image_index = 0;
			}
			if (!key_attack && grounded)
			{
				state = states.normal;
				image_index = 0;
				mach2 = 0;
			}
			if (key_down)
			{
				sprite_index = spr_crouchslip;
				state = states.crouchslide;
				mach2 = 0;
			}
			image_speed = 0.45;
			if (key_jump && grounded && key_attack)
			{
				scr_sound(sound_jump);
				sprite_index = spr_airdash1;
				dir = xscale;
				momemtum = true;
				vsp = -11;
				movespeed += 2;
				state = states.jump;
				jumpAnim = true;
				image_index = 0;
			}
			if (!instance_exists(obj_dashcloud) && grounded)
				instance_create(x, y, obj_dashcloud);
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

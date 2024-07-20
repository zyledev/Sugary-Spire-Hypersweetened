function scr_hurtplayer(_player_index = obj_player)
{
	if (_player_index.state != states.parry && _player_index.state != states.hurt)
	{
		with (_player_index)
		{
			if ((state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes) && !cutscene)
			{
			}
			else if (sprite_index == spr_player_supertaunt1 || sprite_index == spr_player_supertaunt2 || sprite_index == spr_player_supertaunt3)
			{
			}
			else if (state == states.minecart)
			{
				sprite_index = spr_player_mach3hitwall;
				state = states.bump;
				hsp = 2.5 * xscale;
				vsp = -3;
				mach2 = 0;
				image_index = 0;
				instance_create(x, y, obj_bombexplosionharmless);
				for (var i = 0; i < (sprite_get_number(spr_minecartdebris) - 1); i++)
				{
					with (instance_create(x + irandom_range(-9, 9), y + irandom_range(-9, 9), obj_debris))
					{
						sprite_index = spr_minecartdebris;
						image_index = i;
						vsp = floor(random_range(-5, -9));
						hsp = floor(random_range(-5, 7));
					}
				}
			}
			else if (state == states.bombpep && !hurted)
			{
			}
			else if (state == states.boxxedpep)
			{
			}
			else if (state == states.cheesepep || state == states.cheesepepstick)
			{
			}
			else if (state != states.hurt && state != states.backbreaker && !hurted && !cutscene && state != states.bump && state != states.tumble)
			{
				scr_sound(sound_touchspike);
				global.hurtcounter += 1;
				state = states.hurt;
				alarm[8] = 60;
				alarm[7] = 120;
				hurted = true;
				if (xscale == other.image_xscale)
					sprite_index = spr_hurtjump;
				else
					sprite_index = spr_hurt;
				movespeed = 8;
				vsp = -5;
				timeuntilhpback = 300;
				var _oldcollect = global.collect;
				if (global.collect > 100)
					global.collect -= 100;
				else
					global.collect = 0;
				var _repeat = clamp(round((_oldcollect - global.collect) / 10), 0, 15);
				if (global.collect >= 0)
				{
					create_small_number(x, y, string(global.collect - _oldcollect), 1);
					repeat (_repeat)
						instance_create(x, y, obj_pizzaloss);
				}
				else if (_player_index.shotgunAnim)
					_player_index.shotgunAnim = false;
				instance_create(x, y, obj_spikehurteffect);
				image_index = 0;
				flash = true;
				global.style -= 15;
			}
		}
	}
}

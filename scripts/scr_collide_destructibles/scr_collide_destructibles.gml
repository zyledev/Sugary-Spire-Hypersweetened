function scr_collide_destructibles()
{
	if (state == states.mach2 || state == states.mach3 || state == states.machroll || (state == states.cotton && sprite_index == spr_cotton_attack) || state == states.machtumble || state == states.hookshot || state == states.knightpep || state == states.crouchslide || state == states.uppercut || state == states.parry || state == states.puddle || state == states.tumble || state == states.machpizzano || state == states.door || state == states.comingoutdoor || state == states.rocketfistpizzano || state == states.pizzanoshoulderbash || state == states.minecart)
	{
		if (place_meeting(x + hsp, y, obj_destructibles))
		{
			with (instance_place(x + hsp, y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
			if (state == states.mach2)
				machpunchAnim = true;
		}
		if (place_meeting(x + sign(hsp), y, obj_destructibles))
		{
			with (instance_place(x + sign(hsp), y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
			if (state == states.mach2)
				machpunchAnim = true;
		}
		if (place_meeting(x + xscale, y, obj_destructibles))
		{
			with (instance_place(x + xscale, y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
			if (state == states.mach2)
				machpunchAnim = true;
		}
	}
	if ((state == states.knightpep || state == states.machtumble || state == states.superslam || state == states.puddle || state == states.hookshot) && vsp >= 0)
	{
		if (place_meeting(x, y + vsp, obj_destructibles))
		{
			with (instance_place(x, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	if (state == states.cottondrill)
	{
		if (place_meeting(x, y + vsp, obj_destructibles))
		{
			with (instance_place(x, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x, y + 1, obj_destructibles))
		{
			with (instance_place(x, y + 1, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	if (state == states.climbwall && vsp < 0)
	{
		if (place_meeting(x, y + vsp, obj_destructibles))
		{
			with (instance_place(x, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	if (vsp >= 0 && (state == states.puddle || (state == states.freefall || state == states.freefallland)))
	{
		if ((place_meeting(x, y + vsp + 2, obj_metalblock) && state == states.puddle) || ((state == states.freefall || state == states.freefallland) && freefallsmash >= 10))
		{
			with (instance_place(x, y + vsp + 2, obj_metalblock))
			{
				with (obj_player)
				{
					if (place_meeting(x, y + vsp + 2, obj_metalblock) && state != states.puddle)
					{
						state = states.freefallland;
						sprite_index = spr_player_bodyslamland;
						image_index = 0;
					}
				}
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x, y + vsp + 2, obj_destructibles))
		{
			with (instance_place(x, y + vsp + 2, obj_destructibles))
			{
				with (obj_player)
				{
					if (place_meeting(x, y + vsp + 2, obj_bigdestructibles) && state != states.puddle && freefallsmash <= 10)
					{
						state = states.freefallland;
						sprite_index = spr_player_bodyslamland;
						image_index = 0;
					}
				}
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	if (state == states.jump || state == states.Sjump || state == states.mach2 || state == states.mach3 || state == states.machpizzano)
	{
		if (place_meeting(x, y + vsp, obj_destructibles) && vsp < 0)
		{
			with (instance_place(x, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x, y - 1, obj_destructibles))
		{
			with (instance_place(x, y - 1, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	if (state == states.uppercut && vsp < 0)
	{
		if (place_meeting(x, y + vsp, obj_destructibles))
		{
			with (instance_place(x, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	if (state == states.handstandjump)
	{
		with (obj_bigdestructibles)
		{
			if (place_meeting(x - obj_player.hsp, y, obj_player))
			{
				with (obj_player)
				{
					hsp = -xscale * 4;
					vsp = -4;
					mach2 = 0;
					image_index = 0;
					sprite_index = choose(spr_player_blockbreak1, spr_player_blockbreak2, spr_player_blockbreak3, spr_player_blockbreak4, spr_player_blockbreak5, spr_player_blockbreak6, spr_player_blockbreak7);
					state = states.tackle;
				}
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		with (obj_destructibles)
		{
			if (place_meeting(x - obj_player.hsp, y, obj_player))
			{
				var _player = instance_nearest(x, y, obj_player);
				DestroyedBy = _player;
				event_user(0);
			}
		}
	}
	with (obj_baddie)
	{
		if (place_meeting(x + hsp, y, obj_destructibles) && thrown)
		{
			with (instance_place(x + hsp, y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x + sign(hsp), y, obj_destructibles) && thrown)
		{
			with (instance_place(x + sign(hsp), y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	with (obj_train)
	{
		if (place_meeting(x + hsp, y, obj_destructibles))
		{
			with (instance_place(x + hsp, y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x + sign(hsp), y, obj_destructibles))
		{
			with (instance_place(x + sign(hsp), y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
}

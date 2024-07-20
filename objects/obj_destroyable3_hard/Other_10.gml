if (DestroyedBy.object_index == obj_player)
{
	if ((place_meeting(x, y - DestroyedBy.vsp, DestroyedBy) || place_meeting(x, y - sign(DestroyedBy.vsp), DestroyedBy)) && DestroyedBy.vsp < 0 && DestroyedBy.state == states.jump)
	{
		DestroyedBy.vsp = 0;
		if (hp <= 1)
			instance_destroy();
		if (hp > 1)
		{
			ShakeBuffer = 5;
			hp -= 1;
			scr_sound(choose(sound_destroyblock1, sound_destroyblock2));
			sprite_index = spr_bigbreak;
			with (instance_create(x + (image_xscale * 32), y + 32, obj_debris))
				sprite_index = spr_bigdebrisBandage;
			repeat (3)
				instance_create(x + 32, y + 32, obj_debris);
		}
	}
	else if (place_meeting(x - DestroyedBy.hsp, y, DestroyedBy) && (DestroyedBy.state == states.handstandjump || DestroyedBy.state == states.mach1 || DestroyedBy.state == states.mach2))
	{
		with (DestroyedBy)
		{
			with (other.id)
			{
				if (hp <= 1 || DestroyedBy.state == states.mach2)
					instance_destroy();
				if (hp > 1)
				{
					ShakeBuffer = 5;
					hp -= 1;
					scr_sound(choose(sound_destroyblock1, sound_destroyblock2));
					sprite_index = spr_bigbreak;
					with (instance_create(x + (image_xscale * 32), y + 32, obj_debris))
						sprite_index = spr_bigdebrisBandage;
					repeat (3)
						instance_create(x + 32, y + 32, obj_debris);
				}
			}
			hsp = -xscale * 4;
			vsp = -4;
			mach2 = 0;
			image_index = 0;
			sprite_index = choose(spr_player_blockbreak1, spr_player_blockbreak2, spr_player_blockbreak3, spr_player_blockbreak4, spr_player_blockbreak5, spr_player_blockbreak6, spr_player_blockbreak7);
			state = states.tackle;
		}
	}
	else
		instance_destroy();
}
else if (DestroyedBy.object_index == obj_baddie)
{
	if (hp <= 1)
		instance_destroy();
	if (hp > 1)
	{
		ShakeBuffer = 5;
		hp -= 1;
		scr_sound(choose(sound_destroyblock1, sound_destroyblock2));
		sprite_index = spr_bigbreak;
		with (instance_create(x + (image_xscale * 32), y + 32, obj_debris))
			sprite_index = spr_bigdebrisBandage;
		repeat (3)
			instance_create(x + 32, y + 32, obj_debris);
	}
}
else
	instance_destroy();

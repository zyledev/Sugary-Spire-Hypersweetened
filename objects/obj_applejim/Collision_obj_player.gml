if (obj_player.state == states.handstandjump && state != baddiestates.stun && state != baddiestates.applejimbash)
{
	state = baddiestates.stun;
	obj_player.state = states.normal;
	hp -= 1;
	stunned = 100;
}
if (state == baddiestates.applejimbash)
{
	with (obj_player)
	{
		if (state == states.cheesepep || state == states.cheesepepstick)
		{
			scr_sound(sound_metaldestroy);
			obj_player.grav = 0.5;
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			if (x != other.x)
				obj_player.hsp = sign(x - other.x) * 5;
			else
				obj_player.hsp = 5;
			vsp = -3;
			image_index = 0;
			obj_player.image_index = 0;
			obj_player.flash = true;
			state = states.bump;
		}
		else if (state != states.hurt && !hurted && !cutscene && state != states.bump)
		{
			scr_sound(sound_becomeknight);
			global.hurtcounter += 1;
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
			if (global.collect > 100)
				global.collect -= 100;
			else
				global.collect = 0;
			if (global.collect != 0)
			{
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
			}
			instance_create(x, y, obj_spikehurteffect);
			state = states.hurt;
			image_index = 0;
			flash = true;
		}
	}
}

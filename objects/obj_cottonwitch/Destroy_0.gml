if (ds_list_find_index(global.baddieroom, id) == -1)
{
	obj_tv.image_index = random_range(0, 4);
	ds_list_add(global.baddieroom, id);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_baddiegibs);
	instance_create(x, y, obj_baddiegibs);
	instance_create(x, y, obj_baddiegibs);
	with (obj_camera)
	{
		shake_mag = 3;
		shake_mag_acc = 3 / room_speed;
	}
	if (!reset)
	{
		instance_create(x, y + 30, obj_bangeffect);
		if (!stomped && !shot)
		{
			with (obj_camera)
			{
				shake_mag = 5;
				shake_mag_acc = 20 / room_speed;
			}
			with (instance_create(x, y, obj_sausageman_dead))
				sprite_index = spr_cottonwitch_dead;
		}
		if (stomped && !shot)
		{
			with (instance_create(x, y, obj_sausageman_dead))
				sprite_index = spr_cottonwitch_dead;
			with (obj_camera)
			{
				shake_mag = 5;
				shake_mag_acc = 20 / room_speed;
			}
			hsp = 0;
			vsp = 0;
		}
		if (shot && !stomped)
		{
			with (instance_create(x, y, obj_sausageman_dead))
				sprite_index = spr_cottonwitch_dead;
			with (obj_camera)
			{
				shake_mag = 20;
				shake_mag_acc = 40 / room_speed;
			}
			hsp *= 3;
			vsp *= 3;
		}
		global.combo += 1;
		if (global.combo == 1)
		{
			scr_sound(sound_combo1);
			create_small_number(x, y, "10");
			global.collect += 10;
		}
		if (global.combo == 2)
		{
			scr_sound(sound_combo2);
			create_small_number(x, y, "20");
			global.collect += 20;
		}
		if (global.combo == 3)
		{
			scr_sound(sound_combo3);
			create_small_number(x, y, "40");
			global.collect += 40;
		}
		if (global.combo >= 4)
		{
			scr_sound(sound_combo4);
			create_small_number(x, y, "80");
			global.collect += 80;
		}
		global.combotime = 60;
		global.style += 4;
		global.combofreeze = 30;
	}
}

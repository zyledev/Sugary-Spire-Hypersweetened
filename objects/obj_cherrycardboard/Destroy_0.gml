if (ds_list_find_index(global.baddieroom, id) == -1 || important)
{
	obj_tv.image_index = irandom_range(0, 4);
	repeat (3)
	{
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_baddiegibs);
	}
	instance_create(x, y + 30, obj_bangeffect);
	camera_shake(3, 3);
	with (instance_create(x, y, obj_sausageman_dead))
		sprite_index = other.deadspr;
	switch (global.combo)
	{
		case 0:
		case 1:
			scr_sound(sound_combo1);
			break;
		case 2:
			scr_sound(sound_combo2);
			break;
		case 3:
			scr_sound(sound_combo3);
			break;
		default:
			scr_sound(sound_combo4);
			break;
	}
	if (!important)
	{
		switch (global.combo)
		{
			case 0:
			case 1:
				create_small_number(x, y, "10");
				global.collect += 10;
				break;
			case 2:
				create_small_number(x, y, "20");
				global.collect += 20;
				break;
			case 3:
				create_small_number(x, y, "40");
				global.collect += 40;
				break;
			default:
				create_small_number(x, y, "80");
				global.collect += 80;
				break;
		}
	}
	ds_list_add(global.baddieroom, id);
}

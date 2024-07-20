if (ds_list_find_index(global.saveroom, id) == -1)
{
	camera_shake(20, 40);
	repeat (2)
	{
		instance_create(x, y, obj_bangeffect);
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_baddiegibs);
	}
	instance_create(x, y, obj_harrydead);
	instance_create(0, 0, obj_sugarrush);
	global.panic = true;
	obj_camera.alarm[1] = 60;
	var time_array = scr_escapetimes();
	global.minutes = time_array[0];
	global.seconds = time_array[1];
	global.wave = 0;
	global.maxwave = ((global.minutes * 60) + global.seconds) * 60;
	instance_create(x, y, obj_panicchanger);
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
	global.combofreeze = 30;
	global.combotime = 60;
	ds_list_add(global.saveroom, id);
}

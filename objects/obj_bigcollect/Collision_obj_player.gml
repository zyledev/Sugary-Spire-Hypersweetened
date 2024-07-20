if (global.collectsound == 10)
	scr_sound(sound_points);
global.collectsound = 0;
global.collect += 100;
global.pizzameter += 5;
scr_queue_tvanim(spr_pizzytvhappy, 50);
create_small_number(x, y, "100");
global.combofreeze = 30;
global.combotime += 5;
repeat (5)
	instance_create(x + random_range(-32, 32), y + random_range(-32, 32), obj_collecteffect);
instance_destroy();

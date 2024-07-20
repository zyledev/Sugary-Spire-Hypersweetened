if (global.collectsound == 10)
{
	scr_sound(sound_points);
	scr_sound(sound_pizzacoin);
}
global.collectsound = 0;
scr_queue_tvanim(spr_pizzytvhappy, 200);
global.collect += 1000;
global.pizzameter += 5;
create_small_number(x, y, "1000");
global.combofreeze = 30;
global.combotime = 60;
repeat (15)
	instance_create(x + random_range(-60, 60), y + random_range(-60, 60), obj_collecteffect);
instance_destroy();

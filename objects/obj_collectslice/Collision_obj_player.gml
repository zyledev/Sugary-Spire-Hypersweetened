global.collect += 25;
global.combofreeze = 30;
global.combotime += 3;
create_small_number(x, y, "25");
if (audio_is_playing(sound_points))
	audio_stop_sound(sound_points);
scr_sound(sound_points);
repeat (3)
	instance_create(x + random_range(-5, 5), y + random_range(-5, 5), obj_collecteffect);
instance_destroy();

if (state == states.handstandjump)
{
	bombpeptimer = 100;
	global.combofreeze = 30;
	state = states.bombpep;
	image_index = 0;
	sprite_index = spr_bombpep_intro;
	with (instance_nearest(x, y, obj_bomb))
		instance_deactivate_object(obj_bomb);
}

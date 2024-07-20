if (global.panic)
{
	if (state != baddiestates.cherrywait)
	{
		instance_destroy();
		instance_create(x, y, obj_bombexplosion);
		other.state = states.bombpep;
		other.bombpeptimer = false;
		other.sprite_index = spr_bombpep_end;
		instance_create(x, y, obj_bombexplosioncherry);
	}
	else if (other.instakillmove && sprite_index == spr_charcherry_popout)
		instance_destroy();
}

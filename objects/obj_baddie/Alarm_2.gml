if (cottoned)
{
	with (instance_create(x + irandom_range(-10, 10), y + irandom_range(-4, 4), obj_debris))
	{
		sprite_index = spr_cottonwitchprojectile;
		hsp = -other.hsp / 2;
		vsp = 0;
		grav = 0.15;
	}
	alarm[2] = 2;
}

if (ds_list_find_index(global.saveroom, id) == -1)
{
	instance_create(x, y, obj_bombexplosionharmless);
	with (instance_create(x, y, obj_debris))
	{
		sprite_index = spr_gnomewalldebris;
		image_index = 0;
		vsp = floor(random_range(-5, -9));
		hsp = floor(random_range(-5, 7));
	}
	with (instance_create(x, y, obj_debris))
	{
		sprite_index = spr_gnomewalldebris;
		image_index = 1;
		vsp = floor(random_range(-5, -9));
		hsp = floor(random_range(-5, 7));
	}
	with (instance_create(x, y, obj_debris))
	{
		sprite_index = spr_gnomewalldebris;
		image_index = 2;
		vsp = floor(random_range(-5, -9));
		hsp = floor(random_range(-5, 7));
	}
	with (instance_create(x, y, obj_debris))
	{
		sprite_index = spr_gnomewalldebris;
		image_index = 3;
		vsp = floor(random_range(-5, -9));
		hsp = floor(random_range(-5, 7));
	}
	with (instance_create(x, y, obj_debris))
	{
		sprite_index = spr_gnomewalldebris;
		image_index = 4;
		vsp = floor(random_range(-5, -9));
		hsp = floor(random_range(-5, 7));
	}
}
ds_list_add(global.saveroom, id);

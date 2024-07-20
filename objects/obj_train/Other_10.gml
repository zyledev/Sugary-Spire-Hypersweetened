camera_shake(10, 30);
instance_create(x, y, obj_spraydebris);
repeat (15)
{
	with (instance_create(x, y, obj_debris))
	{
		sprite_index = spr_spraydebris;
		image_index = 0;
		vsp = floor(random_range(-10, -14));
		hsp = floor(random_range(-5, 7));
	}
	with (instance_create(x, y, obj_debris))
	{
		sprite_index = spr_spraydebris;
		image_index = 1;
		vsp = floor(random_range(-10, -14));
		hsp = floor(random_range(-5, 7));
	}
	with (instance_create(x, y, obj_debris))
	{
		sprite_index = spr_spraydebris;
		image_index = 2;
		vsp = floor(random_range(-10, -14));
		hsp = floor(random_range(-5, 7));
	}
}
repeat (5)
	instance_create(x + irandom_range(-90, 90), y + irandom_range(20, -20), obj_bombexplosion);
instance_create(x + irandom_range(-64, 64), y, obj_pizzanodebris);
image_index = 0;
sprite_index = spr_spray;
x = xstart;
y = ystart;
movespeed = 10;
go = false;

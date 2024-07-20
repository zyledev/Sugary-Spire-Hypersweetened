image_angle += 4;
if (fire_afterimagetimer > 0)
	fire_afterimagetimer--;
if (fire_afterimagetimer <= 0)
{
	with (instance_create(x, y, obj_fire_aftereffect))
	{
		playerid = other.id;
		image_blend = make_colour_rgb(248, 0, 0);
		image_alpha = 1;
		sprite_index = other.sprite_index;
		image_index = other.image_index;
		image_speed = 0;
		image_angle = other.image_angle;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
		playerid = other.id;
	}
	fire_afterimagetimer = 6;
}

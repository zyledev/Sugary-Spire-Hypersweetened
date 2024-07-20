if (instance_exists(obj_cardboardgummy))
{
	sprite_index = spr_cardboardpillaroff;
	x = -900;
	y = -900;
}
else if (!instance_exists(obj_cardboardgummy))
{
	sprite_index = spr_cardboardpillaron;
	x = xstart;
	y = ystart;
}

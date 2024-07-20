if (grounded)
{
	if (image_xscale == 1)
		movespeed = 4;
	if (image_xscale == -1)
		movespeed = -4;
	vsp = -6;
	image_xscale = sign(obj_player.xscale);
	grounded = false;
}

if (vsp < 12)
	vsp += grav;
if (inv_frame)
	image_alpha = 0.5;
if (!inv_frame)
	image_alpha = 1;
scr_collide();

if (!grounded || floor(image_index) == (image_number - 1))
	image_speed = 0;
else
	image_speed = 0.35;
scr_collide();

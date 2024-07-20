up -= 5;
if (up == -50)
	image_alpha -= 0.1;
if (image_alpha <= 0)
	instance_destroy();

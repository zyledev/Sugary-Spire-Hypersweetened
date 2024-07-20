if (!global.panic)
	image_angle += (abs(sin(current_time / 500) * rotspd) * sign(image_xscale));
else
	image_angle += (rotspd * 2 * sign(image_xscale));

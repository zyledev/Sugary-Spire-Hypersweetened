ang = choose(-1, 1);
spd = random_range(6, 8);
image_speed = 0.35;
hspeed = spd * ang;
vspeed = spd;
image_xscale = ang;
if (ang)
	image_angle = -38;
else
	image_angle = 38;

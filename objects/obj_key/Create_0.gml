if (global.key_inv)
{
	vsp = -15;
	hsp = random_range(-4, 4);
}
hsp = 0;
vsp = 0;
inv_frame = false;
grav = 0.4;
image_speed = 0.35;
if (global.key_inv)
	instance_destroy();

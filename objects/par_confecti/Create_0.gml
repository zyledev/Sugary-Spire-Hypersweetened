enum confectistates
{
	normal,
	taunt,
	appear
}
image_speed = 0.35;
depth = -6;
followQueue = ds_queue_create();
hsp = 0;
vsp = 0;
grav = 0.23;
movespeed = 3;
panic = false;
distance = 0;
confecti = "M";
magnitude = 0;
drawxscale = image_xscale;
targetx = xstart;
targety = ystart;
scr_confecti_init();
sprite_index = spr_appear;
mask_index = spr_crouchmask;
state = confectistates.appear;

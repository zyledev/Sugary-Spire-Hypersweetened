x += (image_xscale * 6);
if (scr_solid(x + (1 * image_xscale), y))
{
	instance_create(x, y, obj_bumpeffect);
	instance_destroy();
}

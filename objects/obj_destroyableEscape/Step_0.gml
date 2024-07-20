if (!global.panic)
{
	x = -999;
	y = -999;
}
if (OldPanic != global.panic && global.panic && !place_meeting(xstart, ystart, obj_player))
{
	x = xstart;
	y = ystart;
	OldPanic = global.panic;
	instance_create(x, y, obj_poofeffectsmall);
}

if (!global.panic)
{
	sprite_index = spr_minipillarsleep;
	x = -900;
	y = -900;
}
else if (global.switchactivated || global.panic)
{
	sprite_index = spr_minipillarwoke;
	x = xstart;
	y = ystart;
}

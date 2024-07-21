function scr_mach_pizzano()
{
	move = -input.key_left.check + input.key_right.check;
	hsp = xscale * movespeed;
	if (movespeed < 12)
		movespeed += 0.07;
	if (movespeed > 12)
		movespeed = 12;
	hsp = xscale * movespeed;
	if (!grounded && (move != 0 && move != xscale) && movespeed > 1)
		movespeed -= 0.05;
	if (!grounded && (move != 0 && move == xscale) && movespeed < 12)
		movespeed += 0.05;
}

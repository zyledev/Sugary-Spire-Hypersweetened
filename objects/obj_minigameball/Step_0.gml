scr_collide();
hsp = xscale * movespeed;
if (movespeed <= 1 && movespeed != 0 && grounded)
	movespeed += 0.2;
if (movespeed >= 1 && movespeed != 0 && grounded)
	movespeed -= 0.2;

stuntouch--;
stuntouch = max(0, stuntouch);
if (squashed)
{
	squashval = approach(squashval, 0.4, 0.15);
	if (squashval >= 0.4)
		squashed = false;
}
else if (!squashed)
	squashval = approach(squashval, 0, 0.05);
scr_collide();

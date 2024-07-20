stuntouch--;
stuntouch = max(0, stuntouch);
if (squashed)
{
	squashval = approach(squashval, 0.4, 0.15);
	if (squashval >= 0.4)
		squashed = false;
}
else if (squashed == 0)
	squashval = approach(squashval, 0, 0.05);
if (state != baddiestates.grabbed && state != baddiestates.panic)
	scr_collide();
if (state == baddiestates.grabbed)
{
	vsp = 0;
	hsp = 0;
}

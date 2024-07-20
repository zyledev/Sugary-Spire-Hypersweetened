image_speed = 0.35;
image_xscale = playerid.xscale;
x = playerid.x;
y = playerid.y;
if (!playerid.angry || playerid.state != states.normal)
	instance_destroy();

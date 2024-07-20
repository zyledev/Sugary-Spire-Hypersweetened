if (vanish)
{
	if (gonealpha > 0)
		gonealpha -= 0.15;
	else if (gonealpha <= 0)
		instance_destroy();
}
visible = playerid.visible;
with (realcol)
{
	switch (other.color)
	{
		case 1:
			r = 48;
			g = 168;
			b = 248;
			r2 = 15;
			g2 = 57;
			b2 = 121;
			break;
		case 2:
			r = 232;
			g = 80;
			b = 152;
			r2 = 95;
			g2 = 9;
			b2 = 32;
			break;
	}
}
x += hsp;
y += vsp;

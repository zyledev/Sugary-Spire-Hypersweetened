if (playerid.state != states.mach3 && playerid.state != states.hookshot && playerid.state != states.charge && playerid.state != states.mach2 && playerid.state != states.handstandjump && playerid.state != states.machslide && playerid.state != states.slam && playerid.state != states.timesup && playerid.state != states.shotgun && playerid.state != states.superslam && playerid.state != states.minecart && playerid.state != states.machroll && playerid.state != states.chainsaw && playerid.state != states.Sjump && playerid.state != states.parry && playerid.state != states.tumble && playerid.state != 125 && (playerid.state != states.jump && playerid.state != states.uppercut && playerid.state != states.machtumble && !global.cane && playerid.state != states.rocketfistpizzano && playerid.state != states.pizzanoshoulderbash))
	vanish = true;
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

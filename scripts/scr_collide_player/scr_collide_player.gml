function scr_collide_player()
{
	grounded = false;
	grinding = false;
	repeat (abs(vsp))
	{
		if (!scr_solid_player(x, y + sign(vsp)))
			y += sign(vsp);
		else
		{
			vsp = 0;
			break;
		}
	}
	repeat (abs(hsp))
	{
		var MaxIncline = 3;
		for (var i = MaxIncline; i > 0; i--)
		{
			var _check = true;
			var _z = i - 1;
			repeat (i - 1)
			{
				if (!scr_solid_player(x + sign(hsp), y - _z))
					_check = false;
				_z--;
			}
			if (scr_solid_player(x + sign(hsp), y) && _check && !scr_solid_player(x + sign(hsp), y - i))
			{
				y -= i;
				break;
			}
		}
		var MaxDecline = 3;
		for (i = 1; i < (MaxDecline + 1); i++)
		{
			_check = true;
			_z = 1;
			repeat (i)
			{
				if (scr_solid_player(x + sign(hsp), y + _z))
					_check = false;
				_z++;
			}
			if (!scr_solid_player(x + sign(hsp), y) && _check && scr_solid_player(x + sign(hsp), y + (i + 1)))
			{
				y += i;
				break;
			}
		}
		if (!scr_solid_player(x + sign(hsp), y))
			x += sign(hsp);
		else
		{
			hsp = 0;
			break;
		}
	}
	if (vsp < 20)
		vsp += grav;
	grounded = scr_solid_player(x, y + 1);
}

var _player = instance_nearest(x, y, obj_player);
if (grabbedPlayer <= -4)
{
	var _player_dir = point_direction(xstart, ystart, _player.x, _player.y);
	targetX = lengthdir_x(80, _player_dir);
	targetY = lengthdir_y(80, _player_dir);
	hsp = 0;
	vsp = 0;
	x = round(xstart + targetX);
	y = round(max(ystart + targetY, ystart));
}
if (place_meeting(x, y, _player) && !scr_solid(x, y) && _player.vsp >= -3 && _player.state != states.fling && grabbedPlayer <= -4 && waitTimer <= 0)
{
	grabbedPlayer = _player;
	old_hsp = grabbedPlayer.hsp / 4;
	hsp = old_hsp;
	vsp = (grabbedPlayer.vsp / 1.5) + 5;
	max_vsp = -15;
	with (grabbedPlayer)
	{
		if (!instance_exists(obj_candifiedeffect1))
		{
			instance_create(x, y, obj_candifiedeffect1);
			scr_sound(sfx_bloop);
		}
		state = states.fling;
		hsp = 0;
		vsp = 0;
		x = other.x;
		y = other.y;
	}
}
if (grabbedPlayer != -4)
{
	with (grabbedPlayer)
	{
		x = other.x;
		y = other.y;
		if (sprite_index != spr_player_candyidle)
			sprite_index = spr_player_candybegin;
		state = states.fling;
		if (!instance_exists(obj_candifiedeffect2))
			instance_create(x, y, obj_candifiedeffect2);
		move = key_left + key_right;
		hsp = move * movespeed;
		if (move != 0 && !scr_solid(x + move, y))
		{
			xscale = move;
			if (movespeed < 6)
				movespeed += 0.25;
		}
		else
			movespeed = 0;
	}
	old_hsp = approach(old_hsp, 0, 0.2);
	hsp = old_hsp + grabbedPlayer.hsp;
	if (scr_solid(x + sign(hsp), y))
	{
		old_hsp = -sign(hsp) * 5;
		grabbedPlayer.movespeed /= 2;
	}
	if (scr_solid(x, y + 1) && vsp >= 0)
		vsp -= 5;
	vsp -= 0.5;
	x = clamp(x, xstart - 216, xstart + 216);
	if ((x >= (xstart + 200) || x <= (xstart - 200)) || ((xprevious - x) == 0 && (yprevious - y) == 0))
		farBuffer++;
	else
		farBuffer = 0;
	if (grabbedPlayer.y <= ystart && vsp < 0)
	{
		with (grabbedPlayer)
		{
			scr_sound(sfx_bloop2);
			state = states.jump;
			jumpstop = true;
			hsp = other.hsp;
			movespeed = abs(hsp);
			vsp = other.max_vsp;
			sprite_index = spr_player_candytransitionup;
			if (sign(hsp) != 0)
				xscale = sign(hsp);
		}
		grabbedPlayer = -4;
		waitTimer = 25;
	}
	if (obj_player.key_jump || farBuffer >= 100)
	{
		with (grabbedPlayer)
		{
			state = states.jump;
			jumpstop = true;
			hsp = other.hsp;
			movespeed = abs(hsp);
			vsp = -5;
			sprite_index = spr_player_candytransitionup;
			if (sign(hsp) != 0)
				xscale = sign(hsp);
		}
		grabbedPlayer = -4;
		waitTimer = 25;
	}
}
if (waitTimer > 0)
	waitTimer--;
candyindex += 0.35;

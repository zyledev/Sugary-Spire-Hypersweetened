if (state == baddiestates.stun && stunned > 40 && !birdcreated)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state != baddiestates.stun)
	birdcreated = 0;
if (bombreset > 0)
	bombreset--;
if (((obj_player.x > (x - 80) && obj_player.x < (x + 80)) && (y <= (obj_player.y + 100) && y >= (obj_player.y - 100))) && !bombreset)
{
	if (state == baddiestates.walk)
	{
		movespeed = 0;
		bombreset = 100;
		image_index = 0;
		sprite_index = spr_crackerkicker_kick;
		image_xscale = -sign(x - obj_player.x);
		state = baddiestates.scared;
	}
}
if (flash && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state != baddiestates.grabbed)
	depth = 0;
if (state != baddiestates.stun)
	thrown = false;
if (!boundbox)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index;
		mask_index = other.mask_index;
		baddieID = other.id;
		other.boundbox = true;
	}
}
if (state == baddiestates.land || state == baddiestates.walk)
	movespeed = 1;
if ((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 60) && y >= (obj_player.y - 60)))
{
	if (state != states.shocked && obj_player.state == states.mach3)
	{
		state = states.shocked;
		sprite_index = scaredspr;
		if (x != obj_player.x)
			image_xscale = -sign(x - obj_player.x);
		movespeed = 0;
		hsp = 0;
		image_index = 0;
	}
}

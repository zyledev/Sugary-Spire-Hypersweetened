if (point_in_circle(x, y, obj_player.x + (75 * obj_player.xscale), obj_player.y, 125) && obj_player.inhaling && state != baddiestates.inhaled)
	state = baddiestates.inhaled;
if (state == baddiestates.stun && stunned > 40 && !birdcreated)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state != baddiestates.stun)
	birdcreated = false;
if (bombreset > 0)
	bombreset--;
if (((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 60) && y >= (obj_player.y - 60))) && obj_player.state != states.cotton && obj_player.state != states.cottondrill && obj_player.state != states.door && obj_player.state != states.cottonroll && obj_player.state != states.pizzanoshoulderbash)
{
	if (state != baddiestates.thrown && !bombreset && obj_player.state != states.cotton)
	{
		if (state == baddiestates.walk || state == baddiestates.idle)
		{
			image_index = 0;
			state = states.cheesepepstick;
			if (x != obj_player.x)
				image_xscale = -sign(x - obj_player.x);
			sprite_index = spr_throw;
		}
	}
}
if (flash && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state != baddiestates.grabbed)
	depth = 0;
if (state != baddiestates.stun)
	thrown = false;
if (!boundbox && state != baddiestates.inhaled)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index;
		mask_index = other.mask_index;
		baddieID = other.id;
		other.boundbox = true;
	}
}
scr_scareenemy();

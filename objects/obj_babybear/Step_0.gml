movespeed = 5;
if (point_in_circle(x, y, obj_player.x + (75 * obj_player.xscale), obj_player.y, 125) && obj_player.inhaling && state != baddiestates.inhaled)
	state = baddiestates.inhaled;
if (state == baddiestates.stun && stunned > 40 && !birdcreated)
{
	birdcreated = 1;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state != baddiestates.stun)
	birdcreated = 0;
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
if (grounded)
	scr_scareenemy();

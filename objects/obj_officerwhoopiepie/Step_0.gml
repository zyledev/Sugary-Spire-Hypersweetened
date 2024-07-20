if (state == baddiestates.stun && stunned > 40 && !birdcreated)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state != baddiestates.stun)
	birdcreated = false;
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
if (!hitboxcreate && (state == baddiestates.idle || state == baddiestates.walk) && obj_player.state != states.mach3)
{
	hitboxcreate = true;
	with (instance_create(x, y, obj_taserhitbox))
		ID = other.id;
}
if (state == baddiestates.stun)
	hitboxcreate = false;
if (x != obj_player.x)
{
	movespeed = 3;
	image_xscale = -sign(x - obj_player.x);
}

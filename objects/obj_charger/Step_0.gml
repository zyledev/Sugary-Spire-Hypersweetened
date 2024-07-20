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
scr_scareenemy();
var targetplayer = instance_nearest(x, y, obj_player);
if (x != targetplayer.x && grounded)
{
	if ((targetplayer.x > (x - 400) && targetplayer.x < (x + 400)) && (y <= (targetplayer.y + 20) && y >= (targetplayer.y - 20)))
	{
		if (state == baddiestates.walk)
		{
			state = baddiestates.charge;
			movespeed = 0;
			image_xscale = -sign(x - obj_player.x);
			sprite_index = spr_banana_chargestart;
			image_index = 0;
		}
	}
}
if (sprite_index == spr_banana_chargestart && floor(image_index) == (image_number - 1))
	sprite_index = spr_banana_charge;
if (!hitboxcreate && state == baddiestates.charge && sprite_index == spr_banana_charge)
{
	hitboxcreate = true;
	with (instance_create(x, y, obj_forkhitbox))
	{
		ID = other.id;
		image_xscale = other.image_xscale;
		x = other.x;
		y = other.y;
		depth = -1;
		sprite_index = spr_chargershitbox;
		mask_index = spr_chargershitbox;
	}
}
if (state == baddiestates.walk)
{
	movespeed = 0;
	hsp = 0;
}

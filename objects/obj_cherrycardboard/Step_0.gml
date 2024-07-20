movespeed = 0;
if (room == tutorial_10 && ((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 60) && y >= (obj_player.y - 60))) && sprite_index != spr_cardcherry_getup && sprite_index != spr_cardcherry_idle)
{
	if (sprite_index != spr_cardcherry_getup)
	{
		image_index = 0;
		sprite_index = spr_cardcherry_getup;
	}
}
if (floor(image_index) == (image_number - 1) && sprite_index == spr_cardcherry_getup)
{
	sprite_index = spr_cardcherry_idle;
	didthingflag = true;
}
if (didthingflag && sprite_index == spr_cardboardcherry)
	sprite_index = spr_cardcherry_idle;
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
		mask_index = other.sprite_index;
		baddieID = other.id;
		other.boundbox = true;
	}
}
if (!didthingflag)
{
}
if (didthingflag)
	sprite_index = spr_cardcherry_idle;
if (!didthingflag && sprite_index != spr_cardcherry_getup)
	sprite_index = spr_cardboardcherry;

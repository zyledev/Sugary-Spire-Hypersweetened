if (!(state == baddiestates.slugjump && !grounded))
	scr_scareenemy();
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
if (!hitboxcreate && state == baddiestates.slugjump)
{
	hitboxcreate = true;
	with (instance_create(x, y, obj_forkhitbox))
	{
		ID = other.id;
		depth = -1;
		mask_index = spr_sluggy_jumphitbox;
		sprite_index = spr_sluggy_jumphitbox;
	}
}
if (state != baddiestates.idle && state != baddiestates.scared && state != baddiestates.stun && state != baddiestates.grabbed && state != baddiestates.charcherry && state != baddiestates.slugjump && state != baddiestates.slugparry && idletimer > 0)
	idletimer--;
if (state != baddiestates.idle && state != baddiestates.scared && state != baddiestates.stun && state != baddiestates.grabbed && state != baddiestates.charcherry && state != baddiestates.slugjump && state != baddiestates.slugparry && jumptimer > 0)
	jumptimer--;
var _isplayerpresent = jumptimer <= 0 && (obj_player.x > (x - 250) && obj_player.x < (x + 250) && y <= (obj_player.y + 200) && y >= (obj_player.y - 16));
if (grounded && (_isplayerpresent || (scr_solid(x + (image_xscale * 32), y, true) && !scr_solid(x + (image_xscale * 32), y - 100, true) && !scr_slope_ext(x + (image_xscale * 32), y) && !scr_slope_ext(x, y + 1))))
{
	if (state == baddiestates.walk)
	{
		if (_isplayerpresent)
			image_xscale = -sign(x - obj_player.x);
		state = baddiestates.slugjump;
		jumptimer = 100;
		sprite_index = spr_sluggy_jumpstart;
		image_index = 0;
		movespeed = 0;
		hsp = 0;
		vsp = 0;
	}
}

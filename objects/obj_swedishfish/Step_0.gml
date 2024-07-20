if (state == baddiestates.stun && stunned > 100 && !birdcreated)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state != baddiestates.stun)
	birdcreated = false;
if (state == baddiestates.walk && y > ystart && !scr_solid(x, y - 1))
	y--;
if (state == baddiestates.walk && y < ystart && !scr_solid(x, y + 1))
	y++;
if (state == baddiestates.stun)
	grav = 0.5;
else
{
	grav = 0;
	vsp = 0;
}
if (flash && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state != baddiestates.grabbed)
	depth = 0;
if (obj_player.x > (x - 400) && obj_player.x < (x + 400) && y <= (obj_player.y + 60) && y >= (obj_player.y - 60))
{
}
if (!hitboxcreate && state == baddiestates.charge && sprite_index == spr_swed_charge)
{
	hitboxcreate = true;
	with (instance_create(x, y, obj_forkhitbox))
	{
		ID = other.id;
		image_xscale = other.image_xscale;
		x = other.x;
		y = other.y;
		depth = -1;
	}
}
if (sprite_index == spr_swed_chargestart && floor(image_index) == (image_number - 1))
{
	sprite_index = spr_swed_charge;
	movespeed = 10;
}
if (bombreset > 0)
	bombreset--;
if (!obj_player.bushdetection && ((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 60) && y >= (obj_player.y - 60))) && state == baddiestates.walk && !bombreset)
{
	if (state != baddiestates.charge || state != baddiestates.stun)
		state = baddiestates.charge;
	if (state == baddiestates.charge && sprite_index != spr_swed_charge && sprite_index != scaredspr)
	{
		sprite_index = spr_swed_chargestart;
		image_xscale = -sign(x - obj_player.x);
		bombreset = 250;
	}
}
if (state == baddiestates.charge && place_meeting(x + 1, y, obj_solid) && vsp < -18)
{
	state = baddiestates.stun;
	vsp++;
	sprite_index = stunfallspr;
	stunned = 100;
}
if (state == baddiestates.stun || state == baddiestates.walk)
	movespeed = 0;
if (state != baddiestates.stun)
	thrown = 0;
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

bashcooldown--;
if (state == baddiestates.walk)
	movespeed = 0;
if (state == baddiestates.applejimbash)
	movespeed = 5;
if (bashcooldown == 0)
{
	sprite_index = spr_applejim_charge;
	state = baddiestates.applejimbash;
	bashcooldown = 200;
}
if (state == baddiestates.stun && stunned > 40 && !birdcreated)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (hp == 0)
	instance_destroy();
if (state != baddiestates.stun)
	birdcreated = 0;
if (flash && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state != baddiestates.grabbed)
	depth = 0;
instance_destroy(obj_baddiethrow);
instance_destroy(obj_swordhitbox);
instance_destroy(obj_slaphitbox);

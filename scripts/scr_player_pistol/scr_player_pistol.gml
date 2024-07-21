function scr_player_pistol()
{
	mach2 = 0;
	move = -input.key_left.check + input.key_right.check;
	if (sprite_index != spr_player_pistolair && sprite_index != spr_player_shootslide)
		hsp = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	if (floor(image_index) == (image_number - 1) && sprite_index != spr_player_shootup && sprite_index != spr_player_shootdiagonal && sprite_index != spr_player_pistolair && !input.key_down.check)
		state = states.normal;
	else if (floor(image_index) == (image_number - 1) && input.key_down.check && sprite_index != spr_player_shootup && sprite_index != spr_player_shootdiagonal && sprite_index != spr_player_pistolair)
		state = states.crouch;
	else if (floor(image_index) == (image_number - 1) && sprite_index != spr_player_pistolair)
	{
		if (move != 0)
			sprite_index = spr_player_aimdiagonal;
		else
			sprite_index = spr_player_aimup;
		image_index = 2;
		state = states.pistolaim;
	}
	else if (grounded && vsp > 0 && sprite_index == spr_player_pistolair)
	{
		sprite_index = spr_player_shootslide;
		state = states.crouchslide;
	}
	if (shoot && floor(image_index) == 0 && (sprite_index == spr_player_pistol || sprite_index == spr_player_pistolair))
	{
		with (obj_camera)
		{
			shake_mag = 8;
			shake_mag_acc = 30 / room_speed;
		}
		with (instance_create(x + (xscale * 10), y - 5, obj_pistoleffect))
			image_xscale = other.xscale;
		if (xscale == 1)
			var box = bbox_right;
		else
			box = bbox_left;
		var ID = instance_create(box + (xscale * 10), y, obj_pistolbullet);
		ID.hspeed = xscale * 15;
		shoot = false;
	}
	if (shoot && floor(image_index) == 0 && sprite_index == spr_player_shootup)
	{
		with (obj_camera)
		{
			shake_mag = 8;
			shake_mag_acc = 30 / room_speed;
		}
		with (instance_create(x + (-xscale * 10), y - 10, obj_pistoleffect))
		{
			sprite_index = spr_pistoleffectup;
			image_xscale = other.xscale;
		}
		box = bbox_top;
		ID = instance_create(x + (-xscale * 16), box, obj_pistolbullet);
		ID.vspeed = -15;
		shoot = false;
	}
	if (shoot && floor(image_index) == 0 && sprite_index == spr_player_shootdiagonal)
	{
		with (obj_camera)
		{
			shake_mag = 8;
			shake_mag_acc = 30 / room_speed;
		}
		with (instance_create(x, y - 10, obj_pistoleffect))
		{
			if (other.xscale == 1)
				image_angle = -60;
			else
				image_angle = 60;
			sprite_index = spr_pistoleffectup;
			image_xscale = other.xscale;
		}
		box = bbox_top;
		ID = instance_create(x + (-xscale * 5), box + 12, obj_pistolbullet);
		ID.vspeed = -15;
		ID.hspeed = xscale * 15;
		shoot = false;
	}
	if (!grounded && sprite_index != spr_player_pistolair)
		sprite_index = spr_player_pistolair;
	if (floor(image_index) != (image_number - 1))
		image_speed = 0.45;
	else
		image_speed = 0;
}

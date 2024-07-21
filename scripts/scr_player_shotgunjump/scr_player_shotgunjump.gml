function scr_player_shotgunjump()
{
	move = -input.key_left.check + input.key_right.check;
	hsp = move * movespeed;
	if ((scr_solid(x + 1, y) && xscale == 1) || (scr_solid(x - 1, y) && xscale == -1))
		movespeed = 0;
	if (move == 0)
		movespeed = 0;
	if (move != 0 && movespeed < 6)
		movespeed += 0.5;
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 0;
	}
	landAnim = true;
	if (ladderbuffer > 0)
		ladderbuffer--;
	if (scr_solid(x, y - 1) && !jumpstop && jumpAnim)
	{
		vsp = grav;
		jumpstop = true;
	}
	if (sprite_index == spr_player_shotgunjump2 && floor(image_index) == (image_number - 1))
	{
		mach2 = 50;
		state = states.mach2;
	}
	if (grounded && input_buffer_jump < 5 && !input.key_down.check && vsp > 0)
	{
		stompAnim = false;
		vsp = -9;
		state = states.jump;
		jumpAnim = true;
		jumpstop = false;
		image_index = 0;
		if (!place_meeting(x, y, obj_water2))
			instance_create(x, y, obj_landcloud);
		freefallstart = false;
		audio_sound_gain(sfx_jump, 0.7, 0);
		if (!audio_is_playing(sfx_jump))
			audio_play_sound(sfx_jump, 1, false);
	}
	if (shoot && floor(image_index) == 0)
	{
		with (obj_camera)
		{
			shake_mag = 8;
			shake_mag_acc = 30 / room_speed;
		}
		with (instance_create(x + (xscale * 5), y + 40, obj_shotgunjumpeffect))
			image_xscale = other.xscale;
		var box = bbox_bottom;
		var ID = instance_create(x + (xscale * 5), y, obj_shotgunbullet);
		ID.hspeed = xscale * -2;
		ID.vspeed = 20;
		ID.sprite_index = spr_shotgunbulletdown;
		ID.image_angle = xscale * -4;
		var ID4 = instance_create(x + (xscale * 5), y, obj_shotgunbullet);
		ID4.hspeed = xscale * -1;
		ID4.vspeed = 20;
		ID4.sprite_index = spr_shotgunbulletdown;
		ID4.image_angle = xscale * -2;
		var ID2 = instance_create(x + (xscale * 5), y, obj_shotgunbullet);
		ID2.vspeed = 20;
		ID2.sprite_index = spr_shotgunbulletdown;
		var ID3 = instance_create(x + (xscale * 5), y, obj_shotgunbullet);
		ID3.hspeed = xscale * 2;
		ID3.vspeed = 20;
		ID3.sprite_index = spr_shotgunbulletdown;
		ID3.image_angle = xscale * 4;
		var ID5 = instance_create(x + (xscale * 5), y, obj_shotgunbullet);
		ID5.hspeed = xscale * 1;
		ID5.vspeed = 20;
		ID5.image_angle = xscale * 2;
		ID5.sprite_index = spr_shotgunbulletdown;
		shoot = false;
	}
	if (input.key_jump.pressed)
		input_buffer_jump = 0;
	if (sprite_index == spr_player_shotgunjump1 && floor(image_index) == 3)
		sprite_index = spr_player_shotgunjump2;
	if (move != 0)
		xscale = move;
	image_speed = 0.35;
}

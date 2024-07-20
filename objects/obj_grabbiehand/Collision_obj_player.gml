if (sprite_index == spr_grabbiehand_fall)
{
	with (obj_player)
	{
		if (state == states.chainsawbump)
		{
			scr_sound(sound_losetransformation);
			with (instance_create(x, y, obj_boxxeddebris))
				image_index = 0;
			with (instance_create(x, y, obj_boxxeddebris))
				image_index = 1;
			with (instance_create(x, y, obj_boxxeddebris))
				image_index = 2;
			with (instance_create(x, y, obj_boxxeddebris))
				image_index = 3;
			with (instance_create(x, y, obj_boxxeddebris))
				image_index = 4;
		}
		if (state == states.portal || state == states.secondjump)
		{
			scr_sound(sound_losetransformation);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
		}
	}
	grav = 0;
	vsp = 0;
	grabbing = true;
	sprite_index = spr_grabbiehand_catch;
	other.image_index = 0;
	obj_player.sprite_index = spr_player_catched;
	other.state = states.door;
	other.x = x;
	other.y = y;
	other.vsp = 0;
	other.hsp = 0;
	scr_sound(sound_losetransformation);
}
if (sprite_index == spr_grabbiehand_catch)
{
	other.vsp = 0;
	other.hsp = 0;
	other.state = states.door;
	obj_player.sprite_index = spr_player_catched;
	other.x = x;
	other.y = y;
}
if (obj_player.state == states.grabbing)
{
	if (!thumbingup && ((x <= (xstarte + 5) && x >= (xstarte - 5)) && ((y <= (ystarte + 5) && y >= (ystarte - 5)) && !grabbing)))
	{
		scr_sound(sound_losetransformation);
		delay = 5;
		image_xscale = -obj_player.xscale;
		thumbingup = true;
		instance_create(x, y, obj_bangeffect);
		sprite_index = spr_grabbiehand_hifive;
		image_index = 0;
	}
}

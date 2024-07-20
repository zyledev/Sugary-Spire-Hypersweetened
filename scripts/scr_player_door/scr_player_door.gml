function scr_player_door()
{
	hsp = 0;
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	machhitAnim = false;
	if (sprite_index != spr_player_downpizzabox && sprite_index != spr_player_uppizzabox)
		sprite_index = spr_lookdoor;
	if (animation_end())
	{
		image_speed = 0;
		if (!instance_exists(obj_fadeout) && !instance_exists(obj_endlevelfade))
		{
			instance_create(x, y, obj_fadeout);
			scr_sound(sound_door);
		}
	}
	if (place_meeting(x, y, obj_door) || place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_keydoorclock))
	{
		with (instance_place(x, y, par_door))
		{
			other.x = approach(other.x, (x - sprite_xoffset) + (sprite_width / 2), 2);
			other.y = approach(other.y, (y - sprite_yoffset) + (sprite_height / 2), 5);
		}
	}
	global.combofreeze = 30;
}

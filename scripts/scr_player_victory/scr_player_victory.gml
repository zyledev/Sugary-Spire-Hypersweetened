function scr_player_victory()
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
	if (place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_keydoorclock))
		sprite_index = spr_player_enterkey;
	if (animation_end())
	{
		if (sprite_index == spr_player_enterkey)
		{
			if (!instance_exists(obj_fadeout))
			{
				scr_sound(sound_door);
				instance_create(x, y, obj_fadeout);
			}
		}
		else
		{
			if (!instance_exists(obj_fadeout))
				instance_create(x, y, obj_fadeout);
			obj_tv.tvsprite = spr_tvturnon;
			obj_tv.image_index = 0;
		}
	}
	if (place_meeting(x, y, obj_startgate))
	{
		sprite_index = spr_entergate;
		with (instance_place(x, y, obj_startgate))
		{
			other.x = approach(other.x, x, 5);
			other.y = approach(other.y, bbox_bottom - (other.bbox_bottom - other.y), 5);
		}
	}
	if (floor(image_index) == (image_number - 1))
		image_speed = 0;
	else
		image_speed = 0.35;
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

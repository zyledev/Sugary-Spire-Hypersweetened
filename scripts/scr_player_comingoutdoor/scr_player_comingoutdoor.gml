function scr_player_comingoutdoor()
{
	static darkColor = 0;
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	machhitAnim = false;
	hsp = 0;
	vsp = 0;
	sprite_index = spr_walkfront;
	image_speed = 0.35;
	if (place_meeting(x, y, obj_door) || place_meeting(x, y, obj_exitgate) || place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_keydoorclock))
	{
		darkColor = image_index / image_number;
		image_blend = make_color_hsv(0, 0, darkColor * 255);
	}
	if (animation_end())
	{
		start_running = true;
		movespeed = 0;
		state = states.normal;
		image_alpha = 1;
		image_blend = make_color_hsv(0, 0, 255);
	}
	global.combofreeze = 30;
}

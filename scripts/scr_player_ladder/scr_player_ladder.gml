function scr_player_ladder()
{
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	turning = false;
	jumpstop = false;
	movespeed = 0;
	hsp = 0;
	if (input.key_up.check)
	{
		sprite_index = spr_laddermove;
		vsp = -6;
		image_speed = 0.35;
	}
	else if (input.key_down.check)
	{
		sprite_index = spr_ladderdown;
		vsp = 6;
		image_speed = -0.35;
	}
	else
	{
		sprite_index = spr_Ladder;
		vsp = 0;
	}
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	machhitAnim = false;
	if (!place_meeting(x, y, obj_ladder))
	{
		landAnim = false;
		jumpAnim = false;
		state = states.normal;
		image_index = 0;
		vsp = 0;
	}
	if (input.key_jump.pressed)
	{
		scr_sound(sound_jump);
		sprite_index = spr_jump;
		ladderbuffer = 20;
		jumpAnim = true;
		state = states.jump;
		vsp = -9;
		image_index = 0;
	}
	if (input.key_down.check && grounded && !place_meeting(x, y, obj_platform))
	{
		state = states.normal;
		image_index = 0;
	}
}

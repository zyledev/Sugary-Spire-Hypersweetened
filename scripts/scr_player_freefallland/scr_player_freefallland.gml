function scr_player_freefallland()
{
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	movespeed = 0;
	facehurt = true;
	start_running = true;
	alarm[4] = 14;
	vsp = 0;
	hsp = 0;
	if (floor(image_index) == (image_number - 1))
	{
		state = states.normal;
		sprite_index = spr_idle;
		freefallsmash = false;
	}
	image_speed = 0.35;
}

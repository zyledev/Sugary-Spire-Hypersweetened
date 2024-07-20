function scr_player_tackle()
{
	combo = 0;
	movespeed = 0;
	mach2 = 0;
	start_running = true;
	if (grounded && vsp > 0)
		hsp = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	if (floor(image_index) == (image_number - 1))
		state = states.normal;
	image_speed = 0.35;
}

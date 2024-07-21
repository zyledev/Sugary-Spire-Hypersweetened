function scr_player_crouchjump()
{
	move = -input.key_left.check + input.key_right.check;
	fallinganimation++;
	if (fallinganimation >= 40 && fallinganimation < 80)
	{
		sprite_index = spr_player_facestomp;
		state = states.jump;
	}
	mask_index = spr_crouchmask;
	hsp = move * movespeed;
	movespeed = 4;
	if (!input.key_jump.check && !jumpstop && jumpAnim)
	{
		vsp /= 2;
		jumpstop = true;
	}
	if (scr_solid(x, y - 1) && !jumpstop && jumpAnim)
	{
		vsp = grav;
		jumpstop = true;
	}
	if (grounded && input.key_down.check)
	{
		state = states.crouch;
		jumpAnim = true;
		crouchAnim = true;
		image_index = 0;
		jumpstop = false;
	}
	if (grounded && !input.key_down.check && !scr_solid(x, y - 16))
	{
		movespeed = 0;
		state = states.normal;
		jumpAnim = true;
		landAnim = true;
		crouchAnim = true;
		image_index = 0;
		jumpstop = false;
		mask_index = spr_player_mask;
	}
	if (grounded)
	{
		state = states.crouch;
		jumpAnim = true;
		crouchAnim = true;
		image_index = 0;
		jumpstop = false;
	}
	if (jumpAnim)
	{
		sprite_index = spr_crouchjump;
		if (floor(image_index) == (image_number - 1))
			jumpAnim = false;
	}
	if (!jumpAnim)
		sprite_index = spr_crouchfall;
	if (move != 0)
		xscale = move;
	image_speed = 0.35;
}

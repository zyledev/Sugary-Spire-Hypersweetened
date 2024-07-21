function scr_player_crouch()
{
	move = key_left + key_right;
	hsp = move * movespeed;
	mask_index = spr_crouchmask;
	turning = false;
	movespeed = 4;
	if (!grounded && !key_jump)
	{
		jumpAnim = false;
		state = states.crouchjump;
		movespeed = 4;
		crouchAnim = true;
		image_index = 0;
	}
	if (key_jump && grounded && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
	{
		scr_sound(sound_jump);
		vsp = -8;
		state = states.crouchjump;
		movespeed = 4;
		image_index = 0;
		crouchAnim = true;
		jumpAnim = true;
	}
	if (grounded && !key_down && !scr_solid(x, y - 16) && !scr_solid(x, y - 32) && !key_jump)
	{
		state = states.normal;
		movespeed = false;
		crouchAnim = true;
		jumpAnim = true;
		image_index = 0;
		mask_index = spr_player_mask;
	}
	if (!crouchAnim)
	{
		if (move == 0)
		{
			if (!shotgunAnim)
				sprite_index = spr_crouch;
			else
				sprite_index = spr_shotgun_duck;
		}
		if (move != 0)
			sprite_index = spr_crawl;
	}
	if (crouchAnim)
	{
		if (move == 0)
		{
			if (!shotgunAnim)
				sprite_index = spr_couchstart;
			else
				sprite_index = spr_shotgun_goduck;
			if (floor(image_index) == (image_number - 1))
				crouchAnim = false;
		}
	}
	if (move != 0)
	{
		xscale = move;
		crouchAnim = false;
	}
	if (key_taunt2 && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
	{
		taunttimer = 20;
		tauntstoredmovespeed = movespeed;
		tauntstoredsprite = sprite_index;
		tauntstoredstate = state;
		state = states.backbreaker;
		if (supertauntcharged)
		{
			image_index = 0;
			sprite_index = choose(spr_player_supertaunt1, spr_player_supertaunt2, spr_player_supertaunt3);
		}
		else
		{
			image_index = irandom_range(0, sprite_get_number(spr_player_taunt));
			sprite_index = spr_player_taunt;
		}
		instance_create(x, y, obj_taunteffect);
	}
	image_speed = 0.3;
}

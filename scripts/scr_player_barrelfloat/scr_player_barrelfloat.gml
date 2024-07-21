function scr_player_barrelfloat()
{
	mask_index = spr_player_mask;
	move = -input.key_left.check + input.key_right.check;
	hsp = move * movespeed;
	vsp = 0;
	if (input.key_jump.pressed)
	{
		jumpstop = true;
		jumpAnim = true;
		state = states.jump;
		landAnim = false;
		vsp = -7;
		with (instance_create(x, y, obj_barrelfloat))
			image_xscale = other.image_xscale;
		image_index = 0;
		barrel = false;
	}
	movespeed = 2.5;
	if (move != 0)
		image_xscale = move;
	sprite_index = spr_player_barrelfloat;
	image_speed = 0.35;
	if (place_meeting(x, y, obj_water2))
		vsp -= 1;
}

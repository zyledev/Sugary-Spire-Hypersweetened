function scr_player_backbreaker()
{	
	if (sprite_index != spr_player_machfreefall)
	{
		hsp = 0;
		movespeed = 0;
	}
	else
		hsp = xscale * movespeed;
	landAnim = false;
	if (sprite_index == spr_pizzelle_taunt || sprite_index == spr_gumbob_taunt || sprite_index == spr_player_supertaunt || sprite_index == spr_pizzano_taunt)
	{
		taunttimer--;
		vsp = 0;
	}
	if (sprite_index == spr_player_machfreefall && place_meeting(x, y + 1, obj_solid))
	{
		state = states.machslide;
		sprite_index = spr_player_crouchslide;
	}
	if (sprite_index == spr_pizzelle_taunt || sprite_index == spr_gumbob_taunt || sprite_index == spr_player_supertaunt || sprite_index == spr_pizzano_taunt)
	{
		if (!instance_exists(parryid))
		{
			with (instance_create(x, y, obj_parryhitbox))
			{
				other.parryid = id;
				image_xscale = other.xscale;
			}
		}
	}
	if (sprite_index == spr_player_supertaunt1 || sprite_index == spr_player_supertaunt2 || sprite_index == spr_player_supertaunt3)
	{
		vsp = 0;
		hsp = 0;
		supertauntbuffer = 100;
		if (floor(image_index) >= 5 && supertauntcharged)
		{
			instance_create(x, y, obj_supertaunthitbox);
			with (instance_create(x, y, obj_tauntaftereffectspawner))
				playerid = other.id;
			if (!instance_exists(parryid))
			{
				with (instance_create(x, y, obj_parryhitbox))
				{
					other.parryid = id;
					image_xscale = other.xscale;
				}
			}
			supertauntcharged = false;
		}
		if (animation_end())
		{
			supertauntbuffer = 0;
			supertauntcharged = false;
			movespeed = tauntstoredmovespeed;
			sprite_index = tauntstoredsprite;
			state = tauntstoredstate;
		}
	}
	if (taunttimer == 0 && (sprite_index == spr_pizzelle_taunt || sprite_index == spr_gumbob_taunt || sprite_index == spr_player_supertaunt || sprite_index == spr_pizzano_taunt))
	{
		movespeed = tauntstoredmovespeed;
		sprite_index = tauntstoredsprite;
		state = tauntstoredstate;
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_eatspaghetti)
		state = states.normal;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_Timesup && !place_meeting(x, y, obj_exitgate))
	{
		global.panic = true;
		sprite_index = spr_bossintro;
		image_index = 0;
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_Timesup && place_meeting(x, y, obj_exitgate))
		state = states.normal;
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_player_levelcomplete || sprite_index == spr_playerN_victory))
		state = states.normal;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_bossintro)
		state = states.normal;
	if (sprite_index == spr_bossintro)
	{
		obj_tv.showtext = true;
		obj_tv.message = "GET BACK TO THE START!!";
		obj_tv.alarm[0] = 150;
	}
	if (sprite_index != spr_player_taunt)
		image_speed = 0.35;
	else if (sprite_index == spr_player_supertaunt1 || sprite_index == spr_player_supertaunt2 || sprite_index == spr_player_supertaunt3)
		image_speed = 0.5;
	else if (sprite_index == spr_player_taunt)
		image_speed = 0;
}

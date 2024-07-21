if (object_index != obj_charcherry)
{
	scr_sound(sound_slaphit);
	if (obj_player.character == "P")
	{
		if (!global.cane)
		{
			with (obj_player)
			{
				suplexhavetomash = 5;
				sprite_index = spr_grab;
			}
			obj_player.baddiegrabbedID = id;
			obj_player.state = states.grab;
			obj_player.sprite_index = spr_player_haulingstart;
			obj_player.image_index = 0;
			state = baddiestates.grabbed;
			instance_destroy(other.id);
		}
		else
		{
			state = baddiestates.stun;
			hp -= 1;
			thrown = true;
			hsp = obj_player.xscale * 15;
			vsp = -6;
			obj_player.hsp = 0;
			obj_player.vsp = 0;
			obj_player.sprite_index = obj_player.spr_canehit;
			obj_player.state = states.finishingblow;
		}
	}
	if (obj_player.character == "N")
	{
		state = baddiestates.stun;
		hp -= 1;
		thrown = true;
		hsp = obj_player.xscale * 15;
		vsp = -6;
		with (obj_player)
		{
			grounded = false;
			movespeed = -3.5;
			vsp = -8;
			mach2 = 0;
			state = states.bump;
			image_index = 0;
			machslideAnim = true;
			machhitAnim = false;
		}
	}
}

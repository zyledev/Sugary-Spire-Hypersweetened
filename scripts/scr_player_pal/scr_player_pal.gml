function scr_player_pal()
{
	move = key_left2 + key_right2;
	move2 = key_up2 - key_down2;
	if (move != 0)
	{
		switch (character)
		{
			default:
				paletteselect = wrap(paletteselect + move, 1, sprite_get_width(spr_palette) - 1);
		}
		with (obj_palexample)
		{
			instance_create_depth(x, y, -6, obj_poofeffect);
			sprite_index = spr_pizzelleselectedpal;
			image_index = 0;
		}
	}
	with (obj_playerhatselect)
	{
		if (other.move2 != 0)
			Selection = wrap(image_index + other.move2, 0, arrayEnd - 1);
	}
	if (key_slap2)
	{
		with (obj_playerhatselect)
			Selection = obj_playerhat.image_index;
		state = states.normal;
		targetRoom = hub_room1;
		targetDoor = "C";
		instance_create(x, y, obj_fadeout);
	}
	sprite_index = spr_idle;
}

with (obj_player)
{
	if (other.image_yscale == 1)
	{
		if (((input.key_down.check && !place_meeting(x, y + 1, obj_destructibles) && place_meeting(x, y + 1, other.id) && (state == states.crouch || state == states.machroll)) || ((state == states.crouchslide || state == states.freefall || state == states.freefallland) && !place_meeting(x, y + 1, obj_destructibles) && place_meeting(x, y + 1, other.id))) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
		{
			other.depth = -10;
			scr_sound(sound_box);
			obj_player.box = 1;
			mach2 = 0;
			obj_camera.chargecamera = 0;
			x = other.x;
			obj_player.targetDoor = other.targetDoor;
			obj_player.targetRoom = other.targetRoom;
			sprite_index = spr_player_downpizzabox;
			image_index = 0;
			state = states.door;
		}
	}
	if (other.image_yscale == -1)
	{
		if ((((input.key_up.check || state == states.Sjump) && !place_meeting(x, y - 1, obj_destructibles) && place_meeting(x, y - 1, other.id) && (state == states.jump || state == states.uppercut || state == states.Sjump)) && !place_meeting(x, y - 1, obj_destructibles) && place_meeting(x, y - 1, other.id)) && !instance_exists(obj_fadeout))
		{
			scr_sound(sound_box);
			other.depth = -10;
			obj_player.box = 1;
			other.depth = -8;
			mach2 = 0;
			obj_camera.chargecamera = 0;
			x = other.x;
			obj_player.targetDoor = other.targetDoor;
			obj_player.targetRoom = other.targetRoom;
			sprite_index = spr_player_uppizzabox;
			image_index = 0;
			state = states.door;
		}
	}
}

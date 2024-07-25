if (sprite_index != spr_exitgateclosed)
{
	with (obj_player)
	{
		if (input.key_up.check && grounded && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3) && !instance_exists(obj_fadeout) && state != states.victory && state != states.comingoutdoor)
		{
			mach2 = 0;
			obj_camera.chargecamera = 0;
			image_index = 0;
			sprite_index = spr_entergate;
			state = states.victory;
			targetDoor = other.targetDoor;
			targetRoom = other.targetRoom;
			obj_music.is_playing = false;
		}
	}
}

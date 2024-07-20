with (obj_player)
{
	if (place_meeting(x, y, other.id) && key_up && grounded && (state == states.normal || state == states.Sjumpprep || state == states.mach1 || state == states.mach2 || state == states.mach3) && !instance_exists(obj_fadeout) && state != states.door && state != states.victory && state != states.comingoutdoor)
	{
		if (ds_list_find_index(global.saveroom, other.id) != -1)
		{
			mach2 = 0;
			image_index = 0;
			obj_camera.chargecamera = 0;
			targetDoor = other.targetDoor;
			targetRoom = other.targetRoom;
			state = states.door;
			global.roomsave = false;
		}
		else if (global.key_inv)
		{
			scr_sound(sound_unlockingdoor);
			state = states.victory;
			image_index = 0;
			obj_camera.chargecamera = 0;
			targetDoor = other.targetDoor;
			targetRoom = other.targetRoom;
			with (other)
			{
				ds_list_add(global.saveroom, id);
				image_index = 0;
				sprite_index = spr_doorvisited;
				image_speed = 0.35;
			}
			global.key_inv = false;
			instance_create(x, y, obj_lock);
			global.roomsave = false;
		}
	}
}

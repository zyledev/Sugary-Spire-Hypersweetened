if (global.panic)
	sprite_index = spr_enterexitgate;
if (place_meeting(x, y, obj_player) && obj_player.state != states.comingoutdoor && sprite_index == spr_enterexitgate && !global.panic && obj_player.sprite_index != obj_player.spr_lookdoor && sprite_index != spr_exitgateclosed)
{
	ds_list_add(global.saveroom, id);
	sprite_index = spr_exitgateclosing;
	scr_sound(sound_maximumspeedland);
	with (obj_camera)
	{
		shake_mag = 3;
		shake_mag_acc = 3 / room_speed;
	}
	obj_player.state = states.backbreaker;
	obj_player.image_index = 0;
	obj_player.sprite_index = obj_player.spr_Timesup;
}
if (sprite_index == spr_exitgateclosing && floor(image_index) == (image_number - 1))
	sprite_index = spr_exitgateclosed;
if (global.starrmode)
	image_alpha -= 0.1;
if (image_alpha == 0)
{
	instance_destroy();
	ds_list_add(global.saveroom, id);
}

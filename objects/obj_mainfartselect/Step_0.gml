scr_getinput();
if (abletomove)
{
	if (-key_left2 && selected < 2)
	{
		scr_sound(sound_step);
		selected++;
	}
	if (key_right2 && selected > 0)
	{
		scr_sound(sound_step);
		selected--;
	}
	if (key_jump && selected == 0 && obj_file1.sprite_index != spr_file1confirm)
	{
		scr_sound(sound_toppingot);
		abletomove = false;
		obj_file1.image_index = 0;
		obj_file1.sprite_index = spr_file1confirm;
	}
	if (key_jump && selected == 1 && !instance_exists(obj_Options_Main))
	{
		scr_sound(sound_toppingot);
		abletomove = false;
		instance_create(0, 0, obj_Options_Main);
	}
	if (key_jump && selected == 2 && !instance_exists(obj_erasefile))
	{
		scr_sound(sound_toppingot);
		abletomove = false;
		instance_create(0, 0, obj_erasefile);
	}
}
var justfarded = 0;
switch (selected)
{
	case 0:
		justfarded = 96;
		_message = "PLAY GAME";
		break;
	case 1:
		justfarded = 480;
		_message = "OPTIONS";
		break;
	case 2:
		justfarded = 828;
		_message = "ERASE SAVE FILE";
		break;
}
lightX = lerp(lightX, justfarded, 0.2);
var asset = layer_sprite_get_id(layer_get_id("Assets_1"), "graphic_5C74AFEA");
layer_sprite_index(asset, selected);
if (showtext)
	yi = approach(yi, 490, 5);
xi = 480 + random_range(1, -1);

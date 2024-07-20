function rousr_dissonance_set_large_image()
{
	var _image_key = argument[0];
	var _image_text = (argument_count > 1) ? argument[1] : undefined;
	with (global.__rousr_dissonance)
	{
		Is_dirty = true;
		discord_set_large_image((_image_key != undefined) ? _image_key : "", (_image_text != undefined) ? _image_text : "");
	}
}

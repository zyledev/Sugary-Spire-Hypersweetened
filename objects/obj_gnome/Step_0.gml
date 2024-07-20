don += 0.35;
if (place_meeting(x, y, obj_player) && global.treat && instance_exists(wall) && !instance_exists(obj_cutsceneManager))
{
	cutscene_create([cutscene_gnomeMines_start, cutscene_gnomeMines_middle, cutscene_gnomeMines_end]);
	cutscene_declare_actor(id, "GNOMECHOMPSKI");
}
if (sprite_index == spr_gnomechompskiblowupbegin && floor(image_index) >= (image_number - 1))
{
	image_index = 0;
	sprite_index = spr_gnomechompskiblowup;
	image_xscale *= -1;
}
if (sprite_index == spr_gnomechompskiblowup && floor(image_index) >= (image_number - 1))
{
	image_index = 0;
	sprite_index = spr_gnomechompski;
}
if (sprite_index == spr_gnomechompskiblowup && floor(image_index) == 3)
{
	image_speed = 0;
	alarm[0] = 35;
	image_index++;
}
if (sprite_index == spr_gnomechompskiblowup && floor(image_index) == 6)
{
	with (wall)
		instance_destroy();
}

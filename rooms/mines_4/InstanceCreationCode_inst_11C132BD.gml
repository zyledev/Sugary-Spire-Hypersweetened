flags.do_save = false
flags.do_once = false
condition = function()
{
    return (place_meeting(x, y, obj_player) && (!instance_exists(obj_cutsceneManager)) && (!global.treat));
}

output = function()
{
    cutscene_create([cutscene_rosetteMines_prestart, cutscene_rosetteMines_start, cutscene_rosetteMines_middle, cutscene_rosetteMines_grab, cutscene_rosetteMines_end])
}


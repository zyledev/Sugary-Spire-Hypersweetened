flags.do_once_per_save = true
condition = function()
{
	// if someone can pinpoint the exact instance if im wrong ill be grateful!
    return ((ds_list_find_index(global.saveroom, inst_3FAD6CD6) != -1) && (!global.minesProgress));
}

output = function()
{
    global.minesProgress = true
    obj_music.fadeoff = 0
    audio_stop_all_music()
}


if (ds_list_find_index(flags.saveroom, id) != -1)
{
	if (flags.do_save != 0)
	{
		if (flags.do_once_per_save == 0)
			output();
		activated = true;
	}
}

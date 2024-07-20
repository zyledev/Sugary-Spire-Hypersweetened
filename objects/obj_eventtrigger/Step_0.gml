if (condition != -4 && condition())
{
	if (!activated || !flags.do_once)
	{
		output();
		if (flags.do_save && ds_list_find_index(flags.saveroom, id) == -1)
			ds_list_add(flags.saveroom, id);
		activated = true;
	}
}
else if (reverse_output != -4 && condition != -4 && !condition())
{
	if (activated || !flags.do_once)
	{
		reverse_output();
		activated = false;
	}
}
if (activated && flags.do_once)
	instance_destroy();

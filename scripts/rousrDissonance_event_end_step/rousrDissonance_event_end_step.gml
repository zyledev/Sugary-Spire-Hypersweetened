function rousrDissonance_event_end_step()
{
	if (Is_dirty && Is_ready)
	{
		discord_update_presence();
		Is_dirty = false;
	}
}

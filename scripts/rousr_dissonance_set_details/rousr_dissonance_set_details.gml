function rousr_dissonance_set_details(_details)
{
	with (global.__rousr_dissonance)
	{
		Is_dirty = true;
		discord_set_details(_details);
	}
}

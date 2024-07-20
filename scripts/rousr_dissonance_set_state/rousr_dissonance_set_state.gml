function rousr_dissonance_set_state(_state)
{
	with (global.__rousr_dissonance)
	{
		Is_dirty = true;
		discord_set_state(_state);
	}
}

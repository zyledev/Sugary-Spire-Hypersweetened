function rousr_dissonance_set_join_secret()
{
	var _secret = argument0;
	with (global.__rousr_dissonance)
	{
		Is_dirty = true;
		discord_set_join_secret(_secret);
	}
}

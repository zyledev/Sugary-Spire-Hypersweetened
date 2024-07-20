function rousr_dissonance_set_spectate_secret()
{
	var _secret = argument0;
	with (global.__rousr_dissonance)
	{
		Is_dirty = true;
		discord_set_spectate_secret(_secret);
	}
}

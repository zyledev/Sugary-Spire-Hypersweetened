function rousr_dissonance_set_party()
{
	var _party_size = argument[0];
	var _party_max = argument[1];
	var _party_id = (argument_count > 2) ? argument[2] : "";
	with (global.__rousr_dissonance)
	{
		Is_dirty = true;
		discord_set_party((_party_id != undefined) ? _party_id : "", _party_size, _party_max);
	}
}

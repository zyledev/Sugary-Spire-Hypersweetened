function rousr_dissonance_respond_to_join()
{
	var _user_id = argument[0];
	var _reply = argument[1];
	with (global.__rousr_dissonance)
		discord_respond(_user_id, _reply);
}

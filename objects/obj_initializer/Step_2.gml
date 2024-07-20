// in Playtest3.2 the debug menu macro is active, im assuming because they built as it for a playtest build.
if !IS_DEBUG
{
	obj_player.state = states.titlescreen;
	room_goto(realtitlescreen);
}
else
{
	obj_player.state = states.normal;
	room_goto(devroom);
}
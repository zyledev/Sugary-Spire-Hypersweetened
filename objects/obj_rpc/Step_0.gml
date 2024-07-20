if (global.collect > global.crank && global.collect < global.brank)
	global.rpcrank = "C";
else if (global.collect > global.brank && global.collect < global.arank)
	global.rpcrank = "B";
else if (global.collect > global.arank && global.collect < global.srank)
	global.rpcrank = "A";
else if (global.collect > global.srank)
	global.rpcrank = "S";
else if (global.collect < global.crank)
	global.rpcrank = "D";
if (!obj_pause.pause)
{
	if (global.panic)
		rousr_dissonance_set_timestamps(undefined, (global.minutes * 60) + global.seconds);
	else
		rousr_dissonance_set_timestamps(undefined, undefined);
	if (room != realtitlescreen && room != scootercutsceneidk && room != outer_room1 && room != outer_room2 && room != hub_room1 && room != palroom && room != rank_room)
		rousr_dissonance_set_state(string(global.collect) + " Points | Rank " + string(global.rpcrank));
	else if (room == rank_room)
		rousr_dissonance_set_state("Rank " + string(global.rpcrank));
	else
		rousr_dissonance_set_state("");
}

function scr_shell_openconsole()
{
	global.shellactivate = true;
}
function scr_shell_closeconsole()
{
	if (instance_exists(obj_pause))
	{
		obj_pause.canmove = false;
		obj_pause.alarm[0] = 3;
		obj_pause.key_jump = false;
	}
	if (instance_exists(obj_mainfartselect))
	{
		obj_mainfartselect.abletomove = false;
		obj_mainfartselect.alarm[0] = 3;
	}
	global.shellactivate = false;
}
function scr_fartcommand(_fart = "BALLS")
{
	switch (_fart)
	{
		case "fart":
		case "poop":
		case "crap":
		case "fard":
		case "shart":
		case "shit":
		case "brap":
			return true;
			break;
	}
}
function scr_shell_roomstart()
{
	toggle_collision_function();
}

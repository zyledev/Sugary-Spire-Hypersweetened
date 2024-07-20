for (var i = 0; room_exists(i); i++)
	global.roomlist[i] = room_get_name(i);
function sh_escape()
{
	var arg0 = string(argument0[1]);
	var arg1 = argument0[2];
	var arg2 = argument0[3];
	switch (arg0)
	{
		case "true":
		case "1":
			arg0 = true;
			break;
		case "false":
		case "0":
			arg0 = false;
			break;
		default:
			arg0 = !global.panic;
			break;
	}
	global.panic = arg0;
	global.minutes = real(string_digits(arg1));
	global.seconds = real(string_digits(arg2));
	global.wave = 0;
	global.maxwave = ((global.minutes * 60) + global.seconds) * 60;
	obj_camera.alarm[1] = 60;
	if (!instance_exists(obj_panicchanger))
		instance_create(x, y, obj_panicchanger);
}
function meta_escape()
{
	return 
	{
		description: "activates escape and sets escape time",
		arguments: ["<bool>", "<min>", "<sec>"],
		suggestions: [["true", "false"], [], []],
		argumentDescriptions: ["activate/deactivate escape", "set minutes", "set seconds"]
	};
}
function sh_toggle_collisions()
{
	var arg1 = argument0[1];
	switch (arg1)
	{
		case "true":
		case "1":
			arg1 = true;
			break;
		case "false":
		case "0":
			arg1 = false;
			break;
		default:
			arg1 = !global.showcollisions;
			break;
	}
	global.showcollisions = arg1;
	toggle_collision_function();
}
function meta_toggle_collisions()
{
	return 
	{
		description: "toggles collision object visibility",
		arguments: ["<bool>"],
		suggestions: [["true", "false"]],
		argumentDescriptions: ["toggles visibility"]
	};
}
function toggle_collision_function()
{
	if (!variable_global_exists("showcollisionarray"))
	{
		var i = 0;
        global.showcollisionarray[i++] = obj_solid;
        global.showcollisionarray[i++] = obj_cameraRegion;
        global.showcollisionarray[i++] = obj_slope;
        global.showcollisionarray[i++] = obj_platform;
        global.showcollisionarray[i++] = obj_cottonplatform;
        global.showcollisionarray[i++] = obj_traingo;
        global.showcollisionarray[i++] = obj_traindestroy;
        global.showcollisionarray[i++] = obj_trainSlowDownTrigger;
        global.showcollisionarray[i++] = obj_trainSpeedUpTrigger;
        global.showcollisionarray[i++] = obj_secretdestroyable;
        global.showcollisionarray[i++] = obj_secretdestroyable_big;
        global.showcollisionarray[i++] = obj_secretdestroyable_metal;
        global.showcollisionarray[i++] = obj_secretdestroyable_tiles2;
        global.showcollisionarray[i++] = obj_secretdestroyable_tiles3;
        global.showcollisionarray[i++] = obj_secretdestroyable_tiles4;
        global.showcollisionarray[i++] = obj_secretdestroyable_tiles5;
        global.showcollisionarray[i++] = obj_eventtrigger;
        global.showcollisionarray[i++] = obj_doortrigger_parent;
        global.showcollisionarray[i++] = obj_doorS;
        global.showcollisionarray[i++] = obj_doorA;
        global.showcollisionarray[i++] = obj_doorB;
        global.showcollisionarray[i++] = obj_doorC;
        global.showcollisionarray[i++] = obj_doorD;
        global.showcollisionarray[i++] = obj_doorE;
        global.showcollisionarray[i++] = obj_doorP;
	}
	var array = global.showcollisionarray;
	var length = array_length(array);
	for (i = length - 1; i >= 0; i--)
	{
		with (array[i])
		{
			if (object_index == array[i])
			{
				visible = global.showcollisions;
				image_alpha = 0.6;
			}
		}
	}
}
function sh_toggle_debugmode()
{
	var arg1 = argument0[1];
	switch (arg1)
	{
		case "true":
		case "1":
			arg1 = true;
			break;
		case "false":
		case "0":
			arg1 = false;
			break;
		default:
			arg1 = !global.debugmode;
			break;
	}
	global.debugmode = arg1;
}
function meta_toggle_debugmode()
{
	return 
	{
		description: "toggles debugmode",
		arguments: ["<bool>"],
		suggestions: [["true", "false"]],
		argumentDescriptions: ["toggles debugmode"]
	};
}
function sh_room_goto()
{
	var arg1 = asset_get_index(argument0[1]);
	var arg2 = argument0[2];
	if (asset_get_type(argument0[1]) != 3)
		return "Can't find room " + string(argument0[1]);
	if (asset_get_type(argument0[1]) == 3)
	{
		obj_player.targetRoom = arg1;
		obj_player.targetDoor = arg2;
		instance_create(0, 0, obj_fadeout);
	}
}
function meta_room_goto()
{
	return 
	{
		description: "allows you to go to another room",
		arguments: ["<room>", "<door>"],
		suggestions: [global.roomlist, ["N/A", "A", "B", "C", "D", "E", "P", "S"]],
		argumentDescriptions: ["sets targetRoom", "sets targetDoor"]
	};
}
function sh_instance_create()
{
	instance_create(argument0[1], argument0[2], asset_get_index(argument0[3]));
}
function meta_instance_create()
{
	return 
	{
		description: "create an object",
		arguments: ["<x>", "<y>", "<object>"],
		suggestions: [[], [], []],
		argumentDescriptions: ["the X coordinate to create the object at", "the Y coordinate to create the object at", "the object to create"]
	};
}

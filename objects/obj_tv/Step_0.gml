scr_tvsprites();
if (room == steamy_1)
{
	global.srank = 22000;
	global.arank = global.srank - (global.srank / 4);
	global.brank = global.srank - ((global.srank / 4) * 2);
	global.crank = global.srank - ((global.srank / 4) * 3);
}
if (room == entryway_1)
{
	global.srank = 10000;
	global.arank = global.srank - (global.srank / 4);
	global.brank = global.srank - ((global.srank / 4) * 2);
	global.crank = global.srank - ((global.srank / 4) * 3);
}
if (room == molasses_1)
{
	global.srank = 21000;
	global.arank = global.srank - (global.srank / 4);
	global.brank = global.srank - ((global.srank / 4) * 2);
	global.crank = global.srank - ((global.srank / 4) * 3);
}
if (room == mines_1)
{
	global.srank = 24000;
	global.arank = global.srank - (global.srank / 4);
	global.brank = global.srank - ((global.srank / 4) * 2);
	global.crank = global.srank - ((global.srank / 4) * 3);
}
if (showtext)
{
	xi = 500 + random_range(1, -1);
	if (yi > 475)
		yi -= 5;
}
if (!showtext)
{
	xi = 500 + random_range(1, -1);
	if (yi < 675)
		yi += 1;
}
if (!(obj_player.state == states.knightpep && obj_player.state == states.knightpepattack && obj_player.state == states.knightpepslopes))
	once = false;
if (obj_player.y < (180 + obj_camera.Cam_y) && obj_player.x > ((camera_get_view_width(view_camera[0]) - 350) + obj_camera.Cam_x))
{
	DrawY = lerp(DrawY, -300, 0.15);
	alpha = 0.5;
}
else
{
	DrawY = lerp(DrawY, 0, 0.15);
	alpha = 1;
}
if (global.collect > global.arank && !shownranka)
{
	message = "YOU GOT ENOUGH FOR RANK A";
	showtext = true;
	alarm[0] = 200;
	shownranka = true;
}
else if (global.collect > global.brank && !shownrankb)
{
	message = "YOU GOT ENOUGH FOR RANK B";
	showtext = true;
	alarm[0] = 200;
	shownrankb = true;
}
else if (global.collect > global.crank && !shownrankc)
{
	message = "YOU GOT ENOUGH FOR RANK C";
	showtext = true;
	alarm[0] = 200;
	shownrankc = true;
}
if (global.hurtcounter >= global.hurtmilestone)
{
	alarm[0] = 150;
	if (obj_player.character == "P")
		character = "PIZZELLE";
	else
		character = "THE PIZZANO";
	message = "YOU HAVE HURT " + string(character) + " " + string(global.hurtmilestone) + " TIMES...";
	global.hurtmilestone += 3;
}
if (obj_player.state == states.keyget)
{
	showtext = true;
	message = "KEY OBTAINED!";
	alarm[0] = 50;
}
if (staticdraw)
	statictimer--;
if (statictimer < 0)
	staticdraw = false;
if (tvsprite != spr_tvturnon && ds_queue_size(global.newhudtvanim) < 1 && tvlength <= 0)
{
	switch (obj_player.state)
	{
		case states.hurt:
			ChannelState = 0;
			tvsprite = hurttvspr;
			break;
		case states.minecart:
			ChannelState = 1;
			tvsprite = minecarttvspr;
			break;
		case states.fireass:
			ChannelState = 2;
			tvsprite = firetvspr;
			break;
		case states.bombpep:
			ChannelState = 3;
			tvsprite = bombtvspr;
			break;
		case states.cotton:
		case states.cottondrill:
		case states.cottonroll:
			ChannelState = 4;
			tvsprite = cottontvspr;
			break;
		case states.mach2:
		case states.machslide:
		case states.climbwall:
		case states.mach3:
			ChannelState = 5;
			if (obj_player.state == states.mach3)
				tvsprite = maxspeedtvspr;
			else
				tvsprite = machtvspr;
			break;
		case states.fling:
			ChannelState = 6;
			tvsprite = orbtvspr;
			break;
		default:
			if (!obj_player.angry)
			{
				ChannelState = 7;
				if (tvsprite != idletvspr && !(tvsprite == tvchange1 || tvsprite == tvchange2))
				{
					tvcount = choose(500, 450, 400, 550);
					tvsprite = idletvspr;
					image_index = 0;
				}
				if (tvsprite == idletvspr && tvcount < 1)
				{
					tvsprite = choose(tvchange1, tvchange2, tvchange2, tvchange1);
					image_index = 0;
				}
				if ((tvsprite == tvchange1 || tvsprite == tvchange2) && animation_end())
				{
					tvcount = choose(500, 450, 400, 550);
					tvsprite = idletvspr;
					image_index = 0;
				}
				if (tvsprite == idletvspr)
					tvcount--;
			}
			else
			{
				ChannelState = 8;
				tvsprite = angrytvspr;
			}
			break;
	}
	if (OLDChannelState != ChannelState)
	{
		staticdraw = true;
		statictimer = 20;
		OLDChannelState = ChannelState;
	}
}
else if (tvsprite != spr_tvturnon && ds_queue_size(global.newhudtvanim) > 1)
{
	tvsprite = ds_queue_dequeue(global.newhudtvanim);
	tvlength = ds_queue_dequeue(global.newhudtvanim);
}
if (tvlength > 0)
{
	ChannelState = 99;
	if (OLDChannelState != ChannelState)
	{
		staticdraw = true;
		statictimer = 20;
		OLDChannelState = ChannelState;
	}
}
tvlength--;
if (global.key_inv)
	invsprite = spr_invkey;
else if (global.treat && global.key_inv != true) // yes this is actual code
	invsprite = spr_invdonut;
else
	invsprite = spr_invempty;
if (tvsprite == spr_tvturnon && floor(image_index) == (image_number - 1))
	tvsprite = idletvspr;
sprite_index = tvsprite;

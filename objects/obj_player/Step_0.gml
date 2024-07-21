scr_getinput();
scr_characterspr();
scr_playerstate();
if (state != states.comingoutdoor)
	image_blend = make_color_hsv(0, 0, 255);
if (firetrailbuffer > 0)
	firetrailbuffer -= ((movespeed / 24) * 26);
if (firetrailbuffer <= 0)
{
	if (movespeed >= 12 && (state == states.mach2 || state == states.mach3 || state == states.machroll))
		instance_create(x, y, obj_flamecloud);
	firetrailbuffer = 100;
}
if (global.playerrotate)
{
	if (grounded && vsp >= 0 && !(state == states.climbwall || state == states.tumble || state == states.grab || state == states.freefallland || state == states.shotgun || state == states.finishingblow || state == states.minecart))
	{
		if (abs(hsp) >= 8)
		{
			var targetangle = scr_slopeangle();
			var RotationStep = (((abs(hsp) / 16) + (abs(hsp) / 32)) - 2) * -1;
		}
		else
		{
			targetangle = 360;
			RotationStep = ((abs(hsp) / 16) - 2) * -1;
		}
		draw_angle = darctan2(dsin(targetangle) + (dsin(draw_angle) * RotationStep), dcos(targetangle) + (dcos(draw_angle) * RotationStep));
	}
	else
	{
		if (draw_angle <= 0)
			draw_angle += 360;
		if (draw_angle < 180)
			draw_angle = max(draw_angle - 2.8125, 0);
		else
			draw_angle = min(draw_angle + 2.8125, 360);
	}
}
if (room == realtitlescreen || room == scootercutsceneidk)
	state = states.titlescreen;
if (grounded)
	groundedcot = true;
if (state != states.gameover && y > (room_height + 64) && !place_meeting(x, y, obj_vertical_hallway) && !instance_exists(obj_fadeout) && room != outer_room2)
{
	if (instance_exists(obj_checkpoint))
	{
		var _checkpoint = instance_nearest(x, y, obj_checkpoint);
		x = _checkpoint.x;
		y = _checkpoint.y;
		instance_create(_checkpoint.x, _checkpoint.y, obj_poofeffect);
	}
	else
	{
		x = roomstartx;
		y = roomstarty;
		instance_create(roomstartx, roomstarty, obj_poofeffect);
	}
	if (instance_exists(obj_train))
	{
		with (obj_train)
		{
			x = xstart;
			y = ystart;
			movespeed = 10;
			image_index = 0;
			sprite_index = spr_spray;
			go = false;
		}
	}
}
if (state != states.freefall && state != states.freefallprep && state != states.freefallland)
	freefallsmash = 0;
if (!instance_exists(baddiegrabbedID) && (state == states.grab || (state == states.superslam && sprite_index != spr_piledriverland) || state == states.charge))
	state = states.normal;
if (!(state == states.grab || state == states.charge || state == states.superslam || state == states.finishingblow))
	baddiegrabbedID = -4;
if (character == "P")
{
	if (anger == 0)
		angry = false;
	if (anger > 0)
	{
		angry = true;
		anger -= 1;
	}
}
if (angry && sprite_index == spr_idle)
	sprite_index = spr_player_3hpidle;
scr_playersounds();
if (state == states.machroll)
{
	if (!audio_is_playing(sound_tumble))
		scr_sound(sound_tumble);
}
else
	audio_stop_sound(sound_tumble);
if (sprite_index == spr_player_winding && state != states.normal)
	windingAnim = 0;
else
	audio_stop_sound(sound_superjumpcharge2);
if (state == states.cottonroll && sprite_index == spr_cotton_run)
{
	if (!audio_is_playing(sound_customdash1))
		scr_sound(sound_customdash1);
}
else
	audio_stop_sound(sound_customdash1);
if (state == states.cottonroll && sprite_index == spr_cotton_maxrun)
{
	if (!audio_is_playing(sound_customdash2))
		scr_sound(sound_customdash2);
}
else
	audio_stop_sound(sound_customdash2);
if (suplexmove && grounded)
{
	suplexmove = false;
	flash = true;
}
if (obj_player.state != states.handstandjump)
	grav = 0.5;
if (angry && !instance_exists(obj_angrycloud) && obj_player.state == states.normal)
	instance_create(x, y, obj_angrycloud);
global.combotime = clamp(global.combotime, 0, 60);
if (global.combofreeze <= 0)
	global.combotime = approach(global.combotime, 0, 0.25);
if ((global.combo % 3) == 0 && playComboVariable != global.combo && global.combotime > 0 && global.combo > 0)
{
	scr_queue_tvanim(spr_pizzytv_combo, 250);
	playComboVariable = global.combo;
}
global.combofreeze--;
global.combofreeze = clamp(global.combofreeze, 0, 75);
if (global.combotime <= 0 && global.combo != 0)
{
	if (global.combo > 5)
		scr_queue_tvanim(spr_pizzytvhappy, 200);
	global.combo = 0;
	playComboVariable = -4;
}
if (input_buffer_jump < 8)
	input_buffer_jump++;
if (input_buffer_secondjump < 8)
	input_buffer_secondjump++;
if (input_buffer_highjump < 8)
	input_buffer_highjump++;
if (key_particles)
	instance_create(random_range(x + 25, x - 25), random_range(y + 35, y - 25), obj_keyeffect);
if (inv_frames == 0 && !hurted)
	image_alpha = 1;
if (state == states.mach2 || state == states.charge || state == states.skateboard || state == states.knightpep || state == states.boxxedpep || state == states.cheesepep || state == states.knightpepslopes || state == states.knightpepattack || state == states.bombpep || state == states.facestomp || state == states.shotgun || state == states.facestomp || state == states.machroll || state == states.mach3 || state == states.freefall || state == states.Sjump)
	attacking = true;
else
	attacking = false;
if (state == states.throwing || state == states.punch || state == states.backkick || state == states.shoulder || state == states.uppunch)
	grabbing = true;
else
	grabbing = false;
if ((state == states.mach3 || state == states.machtumble || state == states.minecart || state == states.fireass || state == states.puddle || state == states.hookshot || state == states.skateboard || state == states.timesup || state == states.freefall || state == states.Sjump || state == states.machroll || state == states.shotgun || state == states.charge || (state == states.superslam && sprite_index == spr_piledriver) || (state == states.superslam && sprite_index == spr_player_piledriverstart) || state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes || state == states.boxxedpep || state == states.cheesepep || state == states.cheeseball) || state == states.uppercut)
	instakillmove = true;
else
	instakillmove = false;
if (flash && alarm[0] <= 0)
	alarm[0] = 0.15 * room_speed;
if (state != states.mach3 && state != states.machslide)
	autodash = false;
if ((state != states.jump && state != states.crouchjump && state != states.slap) || vsp < 0)
	fallinganimation = false;
if (state != states.freefallland && state != states.normal && state != states.machslide)
	facehurt = 0;
if (state != states.normal && state != states.machslide)
	machslideAnim = false;
if (state != states.normal)
{
	idle = 0;
	dashdust = false;
}
if (state != states.mach1 && state != states.jump && state != states.hookshot && state != states.handstandjump && state != states.normal && state != states.mach2 && state != states.mach3 && state != states.freefallprep && state != states.knightpep && state != states.shotgun && state != states.knightpepslopes)
	momemtum = false;
if (state != states.Sjump && state != states.Sjumpprep)
	a = 0;
if (state != states.facestomp)
	facestompAnim = false;
if (state != states.freefall && state != states.facestomp && state != states.superslam && state != states.freefallland)
	superslam = 0;
if (state != states.mach2)
	machpunchAnim = false;
if (state != states.jump)
	ladderbuffer = 0;
if (state != states.jump)
	stompAnim = false;
if (toomuchalarm1 > 0)
	toomuchalarm1 -= 1;
if (toomuchalarm1 <= 0 && (state == states.mach3 || state == states.hookshot || state == states.mach2 || state == states.charge || (state == states.machslide && mach2 >= 100) || state == states.machroll || state == states.handstandjump || state == states.cottondrill || state == states.cottonroll || state == states.minecart || (state == states.rocketfistpizzano && sprite_index != spr_pizzano_sjumpprepside) || state == states.pizzanoshoulderbash || (state == states.chainsaw && mach2 >= 100)))
{
	with (instance_create(x, y, obj_mach3effect))
	{
		playerid = other.object_index;
		image_index = other.image_index - 1;
		image_xscale = other.xscale;
		sprite_index = other.sprite_index;
	}
	toomuchalarm1 = 6;
}
if (state != states.bump && state != states.crouch && state != states.boxxedpep && state != states.pistol && state != states.tumble && state != states.Sjumpprep && state != states.chainsaw && state != states.machroll && state != states.hurt && state != states.crouchslide && state != states.crouchjump && sprite_index != spr_pizzano_crouchslide)
	mask_index = spr_player_mask;
else
	mask_index = spr_crouchmask;
if (state == states.gottreasure || state == states.keyget || state == states.door || state == states.victory || state == states.comingoutdoor || state == states.gameover)
	cutscene = true;
else
	cutscene = false;
if (state != states.hurt)
	hurtsound = false;
if (((place_meeting(x, y, obj_door) && !place_meeting(x, y, obj_doorblocked)) || (place_meeting(x, y, obj_startgate) && state != states.victory) || place_meeting(x, y, obj_keydoorclock) || place_meeting(x, y, obj_keydoor) || (place_meeting(x, y, obj_exitgate) && global.panic)) && !instance_exists(obj_uparrow) && scr_solid(x, y + 1) && state == states.normal)
	instance_create(x, y, obj_uparrow);
if ((state == states.mach2 || state == states.mach3) && !instance_exists(obj_speedlines))
	instance_create(x, y, obj_speedlines);
if (state != states.backbreaker)
{
	if (global.combo >= 3 && supertauntbuffer < 500 && !supertauntcharged)
		supertauntbuffer++;
	else if (supertauntbuffer > 0)
		supertauntbuffer--;
	if (supertauntbuffer >= 500 && !supertauntcharged && state != states.backbreaker)
	{
		supertauntbuffer = 500;
		supertauntcharged = true;
	}
	if ((supertauntbuffer <= 0 && supertauntcharged) || global.combo < 3)
	{
		supertauntbuffer = 0;
		supertauntcharged = false;
	}
	if (supertauntcharged && room != rank_room)
	{
		if (!instance_exists(supertaunteffect))
		{
			with (instance_create(x, y, obj_supertaunteffect))
			{
				other.supertaunteffect = id;
				playerid = other.id;
			}
		}
	}
}
scr_collide_destructibles();
if (state != states.titlescreen && state != states.door && state != states.Sjump && state != states.comingoutdoor && state != states.boulder && state != states.keyget && state != states.victory && state != states.portal && state != states.timesup && state != states.gottreasure && state != states.gameover && state != states.door)
	scr_collide_player();
if (state == states.boulder)
	scr_collide_player();
if (state != states.bushdisguise)
	bushdetection = false;
if (state != states.crouch)
	crouchjumptimer = 0;
if (gumbobpropellercooldown > 0)
	gumbobpropellercooldown--;
if (global.starrmode)
{
	if (global.starrmode && state == states.mach3)
		movespeed = 12;
	else if (state == states.mach3 && movespeed > 12)
		movespeed = 12;
}
if (state == states.door || place_meeting(x, y, obj_hallway) || state == states.victory)
	global.roomsave = false;
if (state == states.finishingblow && !floor(image_index) == (image_number - 1))
{
	with (instance_place(x, y, obj_baddie))
		vsp = 0;
	grav = 0;
}
if (state == states.finishingblow && floor(image_index) == (image_number - 0))
{
	with (instance_place(x, y, obj_baddie))
		vsp = 0.1;
	grav = 0.5;
}
if (place_meeting(x, y, obj_molasseswater))
	grav = 0.35;
else if (!place_meeting(x, y, obj_molasseswater))
	grav = 0.5;
if (Dashpad_buffer > 0)
	Dashpad_buffer = max(Dashpad_buffer - 1, 0);
if (sprite_index == spr_player_machpunch1 && floor(image_index) == (image_number - 1))
	sprite_index = spr_mach;
if (sprite_index == spr_player_machpunch2 && floor(image_index) == (image_number - 1))
	sprite_index = spr_mach;
if (sprite_index == spr_mach2jump)
{
	if (!audio_is_playing(sfx_flip))
		scr_sound(sfx_flip);
}
if (audio_is_playing(sfx_flip) && sprite_index != spr_mach2jump)
	audio_stop_sound(sfx_flip);

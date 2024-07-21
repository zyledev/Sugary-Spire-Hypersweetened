if (!instance_exists(baddieID))
	instance_destroy();
if (instance_exists(baddieID))
{
	x = baddieID.x;
	y = baddieID.y;
	image_xscale = baddieID.image_xscale;
}
if (instance_exists(baddieID) && place_meeting(x, y, obj_player) && !obj_player.cutscene && obj_player.state != states.hurt)
{
	if (baddieID.state != baddiestates.grabbed)
	{
		with (obj_player)
		{
			if (instakillmove)
			{
				instance_destroy(other.baddieID);
				instance_destroy(other.id);
				global.hit += 1;
				global.combotime = 60;
				if (!grounded && state != states.freefall && key_jump2)
				{
					suplexmove = false;
					vsp = -11;
				}
			}
			if (instance_exists(other.baddieID) && y < other.baddieID.y && !attacking && state == states.jump && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep)
			{
				scr_sound(sound_enemyslap);
				suplexmove = false;
				if (vsp > 0)
				{
					other.baddieID.squashed = true;
					other.baddieID.squashval = 0;
					other.baddieID.stunned = 200;
					if (x != other.baddieID.x)
						other.baddieID.image_xscale = -sign(other.baddieID.x - x);
					image_index = 0;
					if (key_jump2)
					{
						other.baddieID.vsp = -5;
						other.baddieID.hsp = -other.baddieID.image_xscale * 3;
						instance_create(x, y + 50, obj_stompeffect);
						other.baddieID.state = baddiestates.stun;
						stompAnim = true;
						other.baddieID.image_index = 0;
						vsp = -14;
						sprite_index = spr_stompprep;
					}
					else
					{
						other.baddieID.vsp = -5;
						other.baddieID.hsp = -other.baddieID.image_xscale * 3;
						instance_create(x, y + 50, obj_stompeffect);
						other.baddieID.state = baddiestates.stun;
						stompAnim = true;
						other.baddieID.image_index = 0;
						vsp = -9;
						sprite_index = spr_stompprep;
					}
				}
			}
			if (instance_exists(other.baddieID) && state == states.cotton && sprite_index == spr_cotton_attack)
			{
				with (other.baddieID)
				{
					cottoned = true;
					alarm[2] = 1;
					instance_create(x, y, obj_bangeffect);
					scr_sound(sound_slaphit);
					hp = 0;
					thrown = true;
					hsp = obj_player.xscale * 20;
					vsp = -6;
					state = baddiestates.stun;
					stunned = 500;
				}
			}
			if (instance_exists(other.baddieID) && !instakillmove && other.baddieID.vsp > 0 && state != states.hurt && state != states.superslam && state != states.finishingblow && state != states.handstandjump)
			{
				if (other.baddieID.stuntouch <= 0)
				{
					scr_sound(sound_bump);
					other.baddieID.stuntouch = 50;
					other.baddieID.state = baddiestates.stun;
					if (other.baddieID.stunned < 100)
						other.baddieID.stunned = 100;
					if (x != other.baddieID.x)
						other.baddieID.image_xscale = -sign(other.baddieID.x - x);
					other.baddieID.hsp = -other.baddieID.image_xscale * 2;
					other.baddieID.vsp = -5;
				}
			}
			if (instance_exists(other.baddieID) && state == states.mach1)
			{
				global.hit += 1;
				global.combotime = 60;
				instance_create(other.baddieID.x, other.baddieID.y, obj_slapstar);
				instance_create(other.baddieID.x, other.baddieID.y, obj_baddiegibs);
				other.baddieID.flash = true;
				other.baddieID.hp = 0;
				scr_sound(sound_enemystomp);
				instance_create(x, y, obj_bumpeffect);
				other.baddieID.stunned = 200;
				if (x != other.baddieID.x)
					other.baddieID.image_xscale = -sign(other.baddieID.x - x);
				other.baddieID.vsp = -5;
				other.baddieID.hsp = -other.baddieID.image_xscale * 5;
				hsp = -xscale * 4;
				vsp = -4;
				machpunchAnim = true;
				if (x != other.baddieID.x)
					other.baddieID.image_xscale = -sign(other.baddieID.x - x);
				other.baddieID.state = baddiestates.stun;
				image_index = 0;
				state = states.tackle;
				if (other.baddieID.hp == 0)
				{
					instance_destroy(other.id);
					instance_destroy(other.baddieID);
				}
			}
			if (instance_exists(other.baddieID) && (state == states.mach2 || state == states.rocketfistpizzano || state == states.pizzanoshoulderbash) && other.baddieID.grounded)
			{
				global.hit += 1;
				global.combotime = 60;
				instance_create(other.baddieID.x, other.baddieID.y, obj_slapstar);
				instance_create(other.baddieID.x, other.baddieID.y, obj_baddiegibs);
				other.baddieID.flash = true;
				other.baddieID.hp = 0;
				scr_sound(sound_enemystomp);
				instance_create(x, y, obj_bumpeffect);
				other.baddieID.vsp = -10;
				other.baddieID.hsp = xscale;
				other.baddieID.image_index = 0;
				machpunchAnim = true;
				other.baddieID.stunned = 200;
				other.baddieID.state = baddiestates.stun;
				if (!grounded && state != states.freefall && key_jump2)
				{
					suplexmove = false;
					sprite_index = spr_mach2jump;
					vsp = -11;
				}
				if (other.baddieID.hp == 0)
				{
					instance_destroy(other.baddieID);
					instance_destroy(other.id);
				}
			}
			if (instance_exists(other.baddieID) && other.baddieID.state != baddiestates.charge && !attacking && state != states.tackle && state != states.hurt && !y < other.baddieID.y && !y > other.baddieID.y && !grabbing && other.baddieID.state != baddiestates.stun && state != states.handstandjump && state != states.hookshot)
			{
				if (x != other.baddieID.x)
				{
					other.baddieID.image_xscale = -sign(other.baddieID.x - x);
					xscale = -sign(x - other.baddieID.x);
				}
				hsp = -xscale * 8;
				vsp = -4;
				other.baddieID.image_xscale = -xscale;
				other.baddieID.hsp = -other.baddieID.image_xscale * 4;
				other.baddieID.vsp = -4;
				if (other.baddieID.state == baddiestates.walk || other.baddieID.state == baddiestates.turn)
					other.baddieID.state = baddiestates.stun;
				if (other.baddieID.state == 87)
				{
					stunned = 30;
					other.baddieID.state = baddiestates.stun;
				}
				image_index = 0;
				state = states.bump;
				if (other.baddieID.state == states.fling)
					other.baddieID.state = baddiestates.stun;
			}
		}
	}
}
if (!instance_exists(baddieID))
	instance_destroy();

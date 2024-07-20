switch (state)
{
	case baddiestates.idle:
		scr_enemy_idle();
		break;
	case baddiestates.turn:
		scr_enemy_turn();
		break;
	case baddiestates.walk:
		scr_enemy_walk();
		break;
	case baddiestates.land:
		scr_enemy_land();
		break;
	case baddiestates.hit:
		scr_enemy_hit();
		break;
	case baddiestates.charge:
		scr_enemy_charge();
		break;
	case baddiestates.stun:
		scr_enemy_stun();
		break;
	case baddiestates.panic:
		visible = false;
		hsp = 0;
		vsp = 0;
		x = -900;
		y = -200;
		if (global.panic)
		{
			if (!instance_exists(escapePortal) && point_in_rectangle(xstart, ystart, obj_player.x - 900, obj_player.y - 250, obj_player.x + 900, obj_player.y + 250))
			{
				escapePortal = instance_create(xstart, ystart, obj_panicPortal);
				escapePortal.drawSprite = sprite_index;
				escapePortal.drawXscale = image_xscale;
			}
			if (instance_exists(escapePortal) && floor(escapePortal.image_index) >= 8)
			{
				instance_create(xstart, ystart, obj_poofeffect);
				visible = true;
				flash = true;
				state = baddiestates.stun;
				vsp = -5;
				squashed = true;
				squashval = 0;
				stunned = 10;
				x = xstart;
				y = ystart;
			}
		}
		break;
	case baddiestates.thrown:
		scr_enemy_throw();
		break;
	case baddiestates.grabbed:
		scr_enemy_grabbed();
		break;
	case baddiestates.scared:
		scr_enemy_scared();
		break;
	case baddiestates.inhaled:
		scr_enemy_inhaled();
		break;
	case baddiestates.cherrywait:
		scr_enemy_cherrywait();
		break;
	case baddiestates.charcherry:
		scr_enemy_charcherry();
		break;
	case baddiestates.slugidle:
		scr_enemy_slugidle();
		break;
	case baddiestates.slugjump:
		scr_enemy_slugjump();
		break;
	case baddiestates.slugparry:
		scr_enemy_slugparry();
		break;
	case baddiestates.kick:
		scr_enemy_kick();
		break;
	case baddiestates.applejimbash:
		scr_applejim_bash();
		break;
}
if (y > (room_height + 64))
	instance_destroy();
if (state != baddiestates.scared)
	ScareBuffer = 0;

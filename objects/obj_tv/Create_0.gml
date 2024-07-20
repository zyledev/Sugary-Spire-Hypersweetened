image_speed = 0.35;
chose = 0;
message = "";
comboAnim = false;
showtext = 0;
tvsprite = spr_tvoff;
noisesprite = spr_player_keyget;
xi = 500;
yi = 600;
imageindexstore = 0;
chooseOnecomboend = true;
ComboShake = false;
comboendImage = 0;
comboendSprite = spr_badcombo_boil;
combocanFade = true;
once = 0;
global.hurtcounter = 0;
global.hurtmilestone = 3;
global.mallowfollow = false;
global.crackfollow = false;
alpha = 1;
shownranka = false;
shownrankb = false;
shownrankc = false;
global.erank = 0;
global.srank = 0;
global.arank = 0;
global.brank = 0;
global.crank = 0;
character = "PIZZELLE";
BarSurface = -4;
BarX = 0;
tvcount = 500;
draw_combo = false;
combofade = 0;
invsprite = spr_invempty;
scr_pal_swap_init_system(shd_pal_swapper);
staticdraw = false;
statictimer = 20;
ChannelState = 0;
OLDChannelState = 0;
playerstate = obj_player.state;
supermario = 0;
tvlength = 0;
global.newhudtvanim = ds_queue_create();
alarm[1] = 1;
DrawY = 0;
function scr_combotext(_combo = global.combo)
{
	var sprite = spr_badcombo_intro;
	if (_combo < 5)
	{
		sprite = spr_badcombo_intro;
		scr_sound(sfx_bad);
	}
	else if (_combo < 10)
	{
		sprite = spr_sourcombo_intro;
		scr_sound(sfx_sour);
	}
	else if (_combo < 15)
	{
		sprite = spr_okcombo_intro;
		scr_sound(sfx_eheheh_ok);
	}
	else if (_combo < 15)
	{
		sprite = spr_alrightcombo_intro;
		scr_sound(sfx_alright);
	}
	else if (_combo < 20)
	{
		sprite = spr_sweetcombo_intro;
		scr_sound(sfx_sweet);
	}
	else if (_combo < 25)
	{
		sprite = spr_spicycombo_intro;
		scr_sound(sfx_spicy);
	}
	else if (_combo < 30)
	{
		sprite = spr_ruthlesscombo_intro;
		scr_sound(sfx_ruthless);
	}
	else
	{
		sprite = spr_wtfcombo_intro;
		if (chance(0.000000001))
			scr_sound(sound_youfuckindick);
		else
			scr_sound(sfx_what_the_fuck);
	}
	return sprite;
}

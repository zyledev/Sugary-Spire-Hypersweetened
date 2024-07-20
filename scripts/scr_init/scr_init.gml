#macro IS_DEBUG (os_get_config() == "Debug")
#macro obj_blank obj_gmliveblank
#macro rm_blank room_gmliveblank
global.__rousr_dissonance = undefined;

global.PAUSEfadeoff = 0;
global.minesProgress = false;
global.GMLIVE_roomstart = false;
global.GMLIVE_realroom = -4;
global.cutsceneManager = -4;
global.combomode = false;
global.font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.0123456789:", 1, 0);
global.smallfont = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-", 1, 0);
global.creditsfont = font_add_sprite_ext(spr_creditsfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz", 1, 0);
global.combofont = font_add_sprite_ext(spr_fontcombo, "0123456789", 1, 0);
global.collectfont = font_add_sprite_ext(spr_fontcollect, "0123456789", 1, 0);
global.shellactivate = false;
global.showcollisions = false;
global.debugmode = false;
global.fartcounter = 0;
global.parallaxbg_surface = -4;
global.ParallaxMap = ds_map_create();
scr_default_parallax(true);
global.FollowerList = ds_list_create();
global.mallowfollow = false;
global.crackfollow = false;
global.chocofollow = false;
global.wormfollow = false;
global.candyfollow = false;
ini_open("optionData.ini");
global.fullscreen = ini_read_real("Settings", "fullscrn", 0);
global.selectedResolution = ini_read_real("Settings", "resolution", 1);
global.smoothcam = ini_read_real("Settings", "smthcam", 1);
global.hitstunEnabled = ini_read_real("Settings", "hitstun", 1);
global.screentilt = ini_read_real("Settings", "scrntilt", 1);
global.playerrotate = ini_read_real("Settings", "playrot", 1);
global.musicVolume = ini_read_real("Settings", "musicvol", 1);
global.soundVolume = ini_read_real("Settings", "soundvol", 1);
global.masterVolume = ini_read_real("Settings", "mastervol", 1);
ini_close();
audio_master_gain(global.masterVolume);
global.targetCamX = 0;
global.targetCamY = 0;
switch (global.selectedResolution)
{
	case 0:
		window_set_size(480, 260);
		break;
	case 1:
		window_set_size(960, 540);
		break;
	case 2:
		window_set_size(1280, 720);
		break;
}
window_set_fullscreen(global.fullscreen);

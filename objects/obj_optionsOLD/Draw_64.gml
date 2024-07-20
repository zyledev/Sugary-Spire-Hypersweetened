draw_sprite_tiled(bg_options, 0, bgx, bgy);
draw_set_halign(fa_center);
draw_set_font(global.font);
draw_sprite(spr_arrow, 0, 200, arrowy);
draw_text(480, 0, title);
switch (menu)
{
	case "HOME":
		draw_text(480, 96, "VIDEO SETTINGS");
		draw_text(480, 192, "AUDIO SETTINGS");
		draw_text(480, 288, "KEY CONFIG");
		break;
	case "VIDEO":
		draw_text(480, 96, "FULLSCREEN");
		if (!global.fullscreen)
			draw_text(480, 141, "OFF");
		else
			draw_text(480, 141, "ON");
		draw_text(480, 192, "SMOOTH CAMERA");
		if (!global.smoothcam)
			draw_text(480, 236, "OFF");
		else
			draw_text(480, 236, "ON");
		draw_text(480, 288, "SCREEN TILT");
		if (!global.screentilt)
			draw_text(480, 333, "OFF");
		else
			draw_text(480, 333, "ON");
		draw_text(480, 383, "PLAYER ROTATION");
		if (!global.playerrotate)
			draw_text(480, 428, "OFF");
		else
			draw_text(480, 428, "ON");
		break;
	case "AUDIO":
		break;
	case "KEY":
		break;
}
draw_set_font(global.smallfont);
draw_text(480, 512, subtitle);

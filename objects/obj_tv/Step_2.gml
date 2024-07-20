if (global.combotime > 0 && global.combo > 0)
{
	chooseOnecomboend = false;
	combocanFade = false;
}
if (global.combotime <= 0)
{
	if (!chooseOnecomboend)
	{
		comboendImage = 0;
		comboendSprite = scr_combotext(draw_combo);
		scr_sound(sound_comboend);
		chooseOnecomboend = true;
	}
}
var sprName = string_get_split(sprite_get_name(comboendSprite), "_");
if (sprName[2] == "intro" && animation_end(comboendImage, sprite_get_number(comboendSprite) - 1))
{
	comboendSprite = asset_get_index(sprName[0] + "_" + sprName[1] + "_boil");
	combocanFade = true;
	combofade = 5;
}
comboendImage += 0.35;
if (!combocanFade)
	combofade = clamp(combofade + 0.25, 0, 25);
else
	combofade = clamp(combofade - 0.05, 0, 25);
if (draw_combo != global.combo && global.combotime > 0 && global.combo > 0)
{
	draw_combo = global.combo;
	ComboShake = true;
	alarm[2] = 20;
}

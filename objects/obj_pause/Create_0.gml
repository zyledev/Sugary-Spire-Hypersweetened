input = 
{
	key_jump : new Input(global.keybinds.key_jump),
	key_up : new Input(global.keybinds.key_up),
	key_down : new Input(global.keybinds.key_down),
	key_pause : new Input(global.keybinds.key_start),
	key_confirm : new Input(global.keybinds.key_jump)
}
canmove = true;
pause = false;
i = 0;
color = make_color_rgb(121, 103, 151);
selected = 0;
image_speed = 0;
shroomdone = 0;
cheesedone = 0;
tomatodone = 0;
sausagedone = 0;
pineappledone = 0;
depth = -98;
draw_screen = 0;
pal = 1;

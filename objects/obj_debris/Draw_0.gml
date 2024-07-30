// the very specific instance of the debris needing to be paletted.
if (sprite_index == spr_introdebris) pal_swap_set(spr_pal, obj_player.paletteselect);
draw_self();
if (shader_current() != -1) pal_swap_reset();
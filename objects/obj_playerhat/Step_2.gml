x = lerp(obj_player.x, x, 0.25);
y = (obj_player.y + sprite_get_bbox_top(obj_player.sprite_index) + wave(5, -5, 1, 0)) - 80;
image_xscale = obj_player.xscale;
visible = obj_player.visible;

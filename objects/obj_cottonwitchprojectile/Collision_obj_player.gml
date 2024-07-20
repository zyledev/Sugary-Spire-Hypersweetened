obj_player.state = states.cotton;
instance_destroy();
instance_create(obj_player.x, obj_player.y, obj_poofeffectcotton);
obj_player.sprite_index = spr_cotton_idle;
global.combofreeze = 30;

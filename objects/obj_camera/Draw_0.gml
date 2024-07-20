draw_set_color(c_black);
draw_rectangle(-128, -128, room_width, 0, false);
draw_rectangle(-128, room_height, room_width, room_height + 128, false);
draw_rectangle(-128, -128, 0, room_height + 128, false);
draw_rectangle(room_width, -128, room_width + 128, room_height + 128, false);
draw_set_color(c_white);

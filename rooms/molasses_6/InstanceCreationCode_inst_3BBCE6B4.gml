condition = function()
{
    return (place_meeting(x, y, obj_player) && (obj_player.state == (72 << 0)));
}

output = function()
{
    inst_61588644.alarm[1] = 5
    inst_32550AD4.alarm[1] = 10
    inst_4523D294.alarm[1] = 1
}


output = function()
{
    with (inst_D67D4BF5)
    {
        if (!((ds_list_find_index(global.saveroom, id) != -1)))
        {
            instance_create(x, y, obj_cloudeffect)
            repeat (3)
                instance_create((x + random_range(-5, 5)), (y + random_range(-5, 5)), obj_cloudeffect)
            instance_destroy()
        }
    }
    with (inst_51CADD8D)
    {
        if (!((ds_list_find_index(global.saveroom, id) != -1)))
        {
            instance_create(x, y, obj_cloudeffect)
            repeat (3)
                instance_create((x + random_range(-5, 5)), (y + random_range(-5, 5)), obj_cloudeffect)
            instance_destroy()
        }
    }
}


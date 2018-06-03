///scr_inventory(SHOW/HIDE)

if (argument0 == "SHOW") {
    var ins = instance_create(view_xview[0] + 200, view_yview[0] + 100, obj_inventory_slot);
    ins.sprite_index = spr_empty_slot;
    var ins = instance_create(view_xview[0] + 202, view_yview[0] + 117, obj_inventory_slot);
    ins.sprite_index = obj_player_stats.inventory[0];
    ins.depth = -11;

} else {
    with (obj_inventory_slot){
        instance_destroy();
    }
}

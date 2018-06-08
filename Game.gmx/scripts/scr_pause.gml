/// scr_pause()
if (obj_control.game_state == PLAY) {
    obj_control.game_state = PAUSE;
    scr_pause_alarms();
    
    //---create button gui---
    
    //create resume button
    scr_create_gui(view_xview[0] + 100, view_yview[0] + 100, spr_resume, 0, -1);
    //create exit button
    scr_create_gui(view_xview[0] + 100, view_yview[0] + 142, spr_menu, 0, -1);
    
    //---create inventory gui---
    var temp_g = scr_create_gui(view_xview[0] + 174, view_yview[0] + 100, spr_pause_ui, 1, -1);
    temp_g.tab_num = 0;
    
    
    
    /* old inventory
    //create key slot
    scr_create_gui(view_xview[0] + 179, view_yview[0] + 105, spr_key, 2, obj_player_stats.keys);
    //create inventory background
    scr_create_gui(view_xview[0] + 174, view_yview[0] + 100, spr_profile, 6, -1);
    scr_create_gui(view_xview[0] + 264, view_yview[0] + 100, spr_weapon_stats, 1, -1);
    with(obj_gui_parent){
        if(string_copy(type, 1, 8) == "gui_weap"){
            lines = scr_draw_item_stats(obj_player_stats.inventory[0], 0);
        }
    }
    */
    
    
} else if(obj_control.game_state == PAUSE){
    obj_control.game_state = PLAY;
    scr_unpause_alarms();
    
    //destroy pause menu buttons
    with (obj_button_parent) {
        if (sprite_index == spr_resume or sprite_index == spr_menu) {
            instance_destroy();
        }
    }
    
    //destroy gui menu items
    with (obj_gui_parent) {
        if (type == "spr_bottom_ui") lines = noone;
        else instance_destroy();
    }
}

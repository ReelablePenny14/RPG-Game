/// scr_button_pressed(btn_type)

// Find out which button it is and do what it does
switch (argument0){
    case "spr_resume":
        scr_pause();
        break;
    case "spr_exit":
        game_end();
        break; 
    case "spr_start":
        with (obj_button_parent) {
            if (sprite_index == spr_start) {
                instance_destroy();
            }
        }
        if (room_exists(room_next(room))){
            room_goto_next();
            obj_control.game_state = PLAY;
        }
        break; 
    case "spr_menu":
        room_goto(rm_menu);
        break;
}

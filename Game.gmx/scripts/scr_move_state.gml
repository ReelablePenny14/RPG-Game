///scr_move_state
movement = MOVE;

// Move 1 tile at a time also check if wall is next to player to prevent corner wall glitch
if (alarm[0] == -1) {
    if (obj_input.right_key){
        scr_push_wall(phy_position_x, phy_position_y, 16, 0);
        obj_player_show.sprite_index = move_sprites[RIGHT];
    }
    else if (obj_input.left_key){
        scr_push_wall(phy_position_x, phy_position_y, -16, 0);
        obj_player_show.sprite_index = move_sprites[LEFT];
    }
    else if (obj_input.down_key){
        scr_push_wall(phy_position_x, phy_position_y, 0, 16);
        obj_player_show.sprite_index = move_sprites[DOWN];
    }
    else if (obj_input.up_key){
        scr_push_wall(phy_position_x, phy_position_y, 0, -16);
        obj_player_show.sprite_index = move_sprites[UP];
    }
} 


//attack_state (move to own script later)
if(obj_input.attack_key and obj_player.alarm[1] == -1 and obj_player.can_fight and obj_player_stats.inventory[0].sprite_index!=spr_empty) {
    if (obj_player_show.sprite_index==idle_sprites[RIGHT]){
        var owa = instance_create(obj_player_show.x+4, obj_player_show.y+4, obj_weapon_animation);
        owa.dir = 0;
        owa.image_angle = (owa.dir*90)+45;
        obj_player_show.sprite_index=attack_sprites[RIGHT];
        obj_player.alarm[1] = obj_player_stats.attack_spd;
        var temp_target = instance_place(obj_player_show.x+16, obj_player_show.y, obj_parent)
        if(temp_target!=noone){
            obj_player.target = temp_target;
            obj_player.state = scr_attack_state;
        }
    }
    else if (obj_player_show.sprite_index==idle_sprites[LEFT]){
        var owa = instance_create(obj_player_show.x+4, obj_player_show.y+4, obj_weapon_animation);
        owa.dir = 2;
        owa.image_angle = (owa.dir*90)+45;
        obj_player_show.sprite_index=attack_sprites[LEFT];
        obj_player.alarm[1] = obj_player_stats.attack_spd;
        var temp_target = instance_place(obj_player_show.x-16, obj_player_show.y, obj_parent)
        if(temp_target!=noone){
            obj_player.target = temp_target;
            obj_player.alarm[1] = obj_player_stats.attack_spd;
            obj_player.state = scr_attack_state;
        }
    }
    else if (obj_player_show.sprite_index==idle_sprites[UP]){
        var owa = instance_create(obj_player_show.x+4, obj_player_show.y+4, obj_weapon_animation);
        owa.dir = 1;
        owa.image_angle = (owa.dir*90)+45;
        obj_player_show.sprite_index=attack_sprites[UP];
        obj_player.alarm[1] = obj_player_stats.attack_spd;
        var temp_target = instance_place(obj_player_show.x, obj_player_show.y-16, obj_parent)
        if(temp_target!=noone){
            obj_player.target = temp_target;
            obj_player.alarm[1] = obj_player_stats.attack_spd;
            obj_player.state = scr_attack_state;
        }
    }
    else if (obj_player_show.sprite_index==idle_sprites[DOWN]){
        var owa = instance_create(obj_player_show.x+4, obj_player_show.y+4, obj_weapon_animation);
        owa.dir = 3;
        owa.image_angle = (owa.dir*90)+45;
        obj_player_show.sprite_index=attack_sprites[DOWN];
        obj_player.alarm[1] = obj_player_stats.attack_spd;
        var temp_target = instance_place(obj_player_show.x, obj_player_show.y+16, obj_parent)
        if(temp_target!=noone){
            obj_player.target = temp_target;
            obj_player.alarm[1] = obj_player_stats.attack_spd;
            obj_player.state = scr_attack_state;
        }
    }
    obj_player_show.image_index = 0;
    obj_player_show.image_speed = 10/room_speed;
    
}
if(obj_player_show.xmove==0 and obj_player_show.ymove==0){
    if (obj_player_show.sprite_index==obj_player.move_sprites[RIGHT]) {obj_player_show.sprite_index=obj_player.idle_sprites[RIGHT]; obj_player_show.image_speed = 3/room_speed;}
    else if (obj_player_show.sprite_index==obj_player.move_sprites[UP]) {obj_player_show.sprite_index=obj_player.idle_sprites[UP]; obj_player_show.image_speed = 3/room_speed;}
    else if (obj_player_show.sprite_index==obj_player.move_sprites[LEFT]) {obj_player_show.sprite_index=obj_player.idle_sprites[LEFT]; obj_player_show.image_speed = 3/room_speed;}
    else if (obj_player_show.sprite_index==obj_player.move_sprites[DOWN]) {obj_player_show.sprite_index=obj_player.idle_sprites[DOWN]; obj_player_show.image_speed = 3/room_speed;}
    
    //drop duckling (for quest only)
    if(obj_input.switch_key and obj_player_stats.inventory[0].display_sprite==obj_duck.idle_sprites[DOWN]){
        var duck = instance_create(x, y, obj_duck);
        duck.type = 0;
        duck.able_to_be_picked_up = true;
        obj_player_stats.inventory[0] = obj_item_stats.emptyw;
    }
}


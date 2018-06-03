///scr_mob_attack_state
if(obj_control.game_state == PLAY){
    if(alarm[0] == -1){
        //create damage object
        var d = instance_create((obj_player_show.x-x)/2+x, (obj_player_show.y-y)/2+y, obj_damage);
        d.creator = id;
        d.damage = damage;
        alarm[0] = attack_spd;
        //change to attacking sprite
        if(sprite_index == idle_sprites[RIGHT]){
            sprite_index = attack_sprites[RIGHT];
            image_speed = 7/room_speed;
        }else if(sprite_index == idle_sprites[LEFT]){
            sprite_index = attack_sprites[LEFT];
            image_speed = 7/room_speed;
        }else if(sprite_index == idle_sprites[UP]){
            sprite_index = attack_sprites[UP];
            image_speed = 7/room_speed;
        }else if(sprite_index == idle_sprites[DOWN]){
            sprite_index = attack_sprites[DOWN];
            image_speed = 7/room_speed;
        }
    }

    //---return sprite to idle after attack is over---
    if(sprite_index == attack_sprites[RIGHT] and image_index>=image_number-1){
        sprite_index = idle_sprites[RIGHT];
        image_speed = 3/room_speed;
    }else if(sprite_index == attack_sprites[LEFT] and image_index>=image_number-1){
        sprite_index = idle_sprites[LEFT];
        image_speed = 3/room_speed;
    }else if(sprite_index == attack_sprites[UP] and image_index>=image_number-1){
        sprite_index = idle_sprites[UP];
        image_speed = 3/room_speed;
    }else if(sprite_index == attack_sprites[DOWN] and image_index>=image_number-1){
        sprite_index = idle_sprites[DOWN];
        image_speed = 3/room_speed;
    }
    if(obj_player.target != self) state = scr_mob_move_state; 
}

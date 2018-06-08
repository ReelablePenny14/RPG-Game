///scr_mob_move_state

if(obj_control.game_state == PLAY){
    //---if mob starts to get attacked---
    if(obj_player.target == self and alarm[0] == -1 and able_attack){
        //mob_attack_state
        //frames till unit attacks back
        alarm[0] = irandom_range(0, attack_spd/2);
        //move to player and face him
        xmove = 0;
        ymove = 0;
        if(obj_player_show.sprite_index == obj_player.attack_sprites[RIGHT] or obj_player_show.sprite_index == obj_player.idle_sprites[RIGHT]){
            phy_position_x = obj_player.x + 16;
            phy_position_y = obj_player.y;
            sprite_index = idle_sprites[LEFT];
        }else if(obj_player_show.sprite_index == obj_player.attack_sprites[LEFT] or obj_player_show.sprite_index == obj_player.idle_sprites[LEFT]){
            phy_position_x = obj_player.x - 16;
            phy_position_y = obj_player.y;
            sprite_index = idle_sprites[RIGHT];
        }else if(obj_player_show.sprite_index == obj_player.attack_sprites[DOWN] or obj_player_show.sprite_index == obj_player.idle_sprites[DOWN]){
            phy_position_x = obj_player.x;
            phy_position_y = obj_player.y + 16;
            sprite_index = idle_sprites[UP];
        }else if(obj_player_show.sprite_index == obj_player.attack_sprites[UP] or obj_player_show.sprite_index == obj_player.idle_sprites[UP]){
            phy_position_x = obj_player.x;
            phy_position_y = obj_player.y - 16;
            sprite_index = idle_sprites[DOWN];
        }
        state = scr_mob_attack_state;
    }
    
    //---choose where to move next---
    if(alarm[1] = -1 and obj_player.target!=self){
        //calc the chance if the mob moves and what direction
        var tempdir = -1;
        if(random(1) < move_chance) tempdir = irandom(3);
        
        //tell mob where to move based on direction
        xmove = 0;
        ymove = 0;
        if(tempdir == 0) xmove = 16;
        else if(tempdir == 1) xmove = -16;
        else if(tempdir == 2) ymove = 16;
        else if(tempdir == 3) ymove = -16;
        alarm[1] = move_spd;
        //check for collisions
        if(place_meeting(x+xmove, y+ymove, obj_wall)){xmove=0; ymove=0;}
        else if(place_meeting(x+xmove, y+ymove, obj_tree_pine)){xmove=0; ymove=0;}
        else if(place_meeting(x+xmove, y+ymove, obj_tree_oak)){xmove=0; ymove=0;}
        else if(place_meeting(x+xmove, y+ymove, obj_gate_closed) and obj_gate_closed.image_index != obj_gate_closed.image_number-1){xmove=0; ymove=0;}
        else if(place_meeting(x+xmove, y+ymove, obj_lever)){xmove=0; ymove=0;}
        else if(place_meeting(x+xmove, y+ymove, obj_door)){xmove=0; ymove=0;}
        else if(place_meeting(x+xmove, y+ymove, obj_moveable_wall)){xmove=0; ymove=0;}
        else if(place_meeting(x+xmove, y+ymove, obj_player)){xmove=0; ymove=0;}
        else if(x+xmove>startingx+radius*16 or x+xmove<startingx-radius*16 or y+ymove>startingy+radius*16 or y+ymove<startingy-radius*16){xmove=0; ymove=0;}
        //for the duckling quest only
        else if(instance_exists(obj_farmer) and place_meeting(x, y, obj_objective_area) and !place_meeting(x+xmove, y+ymove, obj_objective_area)){xmove=0; ymove=0;}
    }
    //---change sprite based on direction its moving and speed---
    if(xmove>0){
        sprite_index = move_sprites[RIGHT];
    }else if(xmove<0){
        sprite_index = move_sprites[LEFT];
    }else if(ymove<0){
        sprite_index = move_sprites[UP];
    }else if(ymove>0){
        sprite_index = move_sprites[DOWN];
    }
    if(xmove==0 and ymove==0){
        if(sprite_index == move_sprites[RIGHT]) sprite_index = idle_sprites[RIGHT];
        else if(sprite_index == move_sprites[UP]) sprite_index = idle_sprites[UP];
        else if(sprite_index == move_sprites[LEFT]) sprite_index = idle_sprites[LEFT];
        else if(sprite_index == move_sprites[DOWN]) sprite_index = idle_sprites[DOWN];
    
    }

}
if(obj_control.game_state != PAUSE){
    if(alarm[1] = -1 and obj_player.target!=self){
        xmove = 0;
        ymove = 0;
    }
    //---move mob---
    //add one because otherwise it messes things up
    phy_position_x += xmove/(move_spd+1);
    phy_position_y += ymove/(move_spd+1);
}


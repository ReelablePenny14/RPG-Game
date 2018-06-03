///scr_attack_state
movement = ATTACK;

if(instance_exists(obj_weapon_animation)){
    if(obj_weapon_animation.index == 5){
        var xx = 0;
        var yy = 0;
        if (obj_player_show.sprite_index==idle_sprites[RIGHT] or obj_player_show.sprite_index== attack_sprites[RIGHT]){
                xx = obj_player_show.x+8;
                yy = obj_player_show.y;
        }
        else if (obj_player_show.sprite_index==idle_sprites[LEFT] or obj_player_show.sprite_index==attack_sprites[LEFT]){
                xx = obj_player_show.x-8;
                yy = obj_player_show.y;
        }
        else if (obj_player_show.sprite_index==idle_sprites[UP] or obj_player_show.sprite_index==attack_sprites[UP]){
                xx = obj_player_show.x;
                yy = obj_player_show.y-8;
        }
        else if (obj_player_show.sprite_index==idle_sprites[DOWN] or obj_player_show.sprite_index==attack_sprites[DOWN]){
                xx = obj_player_show.x;
                yy = obj_player_show.y+8;
        }
        var damage = instance_create(xx, yy, obj_damage);
        var bonus_damage = 0;
        var bonus_crit_percent = 0;
        var bonus_crit_boost = 0;
        for(var i=1;i<array_length_1d(obj_player_stats.inventory);i++){
            bonus_damage+=obj_player_stats.inventory[i].attack_boost;
            bonus_crit_percent+=obj_player_stats.inventory[i].crit_chance_boost;
            bonus_crit_boost+=obj_player_stats.inventory[i].crit_boost;
        }
        damage.creator = obj_player_show.id;
        if(random(1) < obj_player_stats.inventory[0].chance_crit + bonus_crit_percent) damage.damage = obj_player_stats.inventory[0].crit_damage + bonus_crit_boost;
        else damage.damage = obj_player_stats.inventory[0].damage + bonus_damage;
    }
}


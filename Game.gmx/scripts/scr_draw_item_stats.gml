///scr_draw_item_stats(item, slotnum)
var tempitem = argument0;
var slotnum = argument1;
var temp_lines = noone;
if(slotnum == 0){
    var j = 0;
    //name
    temp_lines[j, 0] = tempitem.name;
    temp_lines[j, 1] = "Weapon Name:";
    j++;
    //damage
    if(tempitem.damage > 0){
        temp_lines[j, 0] = string(tempitem.damage);
        temp_lines[j, 1] = "Damage:";
        j++;
    }
    //crit damage
    if(tempitem.crit_damage > 0){
        temp_lines[j, 0] = string(tempitem.crit_damage);
        temp_lines[j, 1] = "Crit Damage:";
        j++;
    }
    //crit chance
    if(tempitem.chance_crit > 0){
        temp_lines[j, 0] = string(tempitem.chance_crit*100)+"%";
        temp_lines[j, 1] = "Crit Chance:";
        j++;
    }

}

else{
    var j = 0;
    //name
    temp_lines[j, 0] = tempitem.name;
    temp_lines[j, 1] = "Item Name:";
    j++;
    //protection
    if(tempitem.protection > 0){
        temp_lines[j, 0] = string(tempitem.protection);
        temp_lines[j, 1] = "Protection:";
        j++;
    }
    //full protection chance
    if(tempitem.full_protection_chance > 0){
        temp_lines[j, 0] = string(tempitem.full_protection_chance*100)+"%";
        temp_lines[j, 1] = "Full Protection:";
        j++;
    }
    //Attack boost
    if(tempitem.attack_boost > 0){
        temp_lines[j, 0] = string(tempitem.attack_boost);
        temp_lines[j, 1] = "Attack Bonus:";
        j++;
    }
    
}
    
    

return temp_lines;

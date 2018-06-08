//scr_push_wall(x, y, change_x, change_y)
var xx = argument0;
var yy = argument1;
var cx = argument2;
var cy = argument3;
var wall = noone;
var door = noone;
var setmoves = false;

//find id of moveable_wall
wall = instance_place(xx+cx, yy+cy, obj_moveable_wall)
door = instance_place(xx+cx, yy+cy, obj_door)

//move the moveable_wall obj if you can
if(place_meeting(xx+cx, yy+cy, obj_wall)) return true;
if(place_meeting(xx+cx, yy+cy, obj_tree_pine)) return true;
if(place_meeting(xx+cx, yy+cy, obj_tree_oak)) return true;
if(place_meeting(xx+cx, yy+cy, obj_gate_closed) and obj_gate_closed.image_index != obj_gate_closed.image_number-1) return true;
if(place_meeting(xx+cx, yy+cy, obj_lever)){ 
    var lever = instance_place(xx+cx, yy+cy, obj_lever);
    scr_move_gates("lever", lever);
    obj_player.alarm[0] = obj_player.move_spd/2;
    return true;
}
if(place_meeting(xx+cx, yy+cy, obj_door)){ 
    if(door!=noone){
        if(door.keys_required != 0) {
            if(obj_player_stats.keys >= door.keys_required){
                obj_player_stats.keys -= door.keys_required;
                door.keys_required = 0;
                obj_player.alarm[0] = obj_player.move_spd/2;
            }
            return true;
        }
    }
}
if(place_meeting(xx+cx, yy+cy, obj_talking_npc)){ 
    var npc = instance_place(xx+cx, yy+cy, obj_talking_npc);
    npc.player_wants_to_talk = true;
    obj_player.alarm[0] = obj_player.move_spd;
    return true;
}
if(wall!=noone){
    if(place_meeting(xx+cx*2, yy+cy*2, obj_moveable_wall)) return true;
    else if(place_meeting(xx+cx*2, yy+cy*2, obj_wall)) return true;
    else if(place_meeting(xx+cx*2, yy+cy*2, obj_tree_pine)) return true;
    else if(place_meeting(xx+cx*2, yy+cy*2, obj_tree_oak)) return true;
    else if(place_meeting(xx+cx*2, yy+cy*2, obj_ladder)) return true;
    else if(place_meeting(xx+cx*2, yy+cy*2, obj_lever)) return true;
    else if(place_meeting(xx+cx*2, yy+cy*2, obj_key)) return true;
    else if(place_meeting(xx+cx*2, yy+cy*2, obj_door)) return true;
    else {
        wall.xmove = cx/(obj_player.move_spd+obj_player.push_block);
        wall.ymove = cy/(obj_player.move_spd+obj_player.push_block);
        wall.alarm[0] = obj_player.move_spd+obj_player.push_block;
        setmoves = true;
        obj_player.alarm[0] = obj_player.move_spd+obj_player.push_block
        obj_player_show.xmove = cx/(obj_player.move_spd+obj_player.push_block);
        obj_player_show.ymove = cy/(obj_player.move_spd+obj_player.push_block);
        obj_player_show.image_speed = 3/room_speed;
    }
}
//moves player if it can
obj_player.phy_position_x += cx;
obj_player.phy_position_y += cy;
if (!setmoves){
    obj_player.alarm[0] = obj_player.move_spd
    obj_player_show.xmove = cx/obj_player.move_spd;
    obj_player_show.ymove = cy/obj_player.move_spd;
    if(place_meeting(xx+cx, yy+cy, obj_ladder)) obj_player_show.image_speed = 3/room_speed;
    else obj_player_show.image_speed = 7/room_speed;
}
return false; //player can move




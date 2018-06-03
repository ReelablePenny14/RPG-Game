//scr_collide(x, y, change_x, change_y)
var xx = argument0;
var yy = argument1;
var cx = argument2;
var cy = argument3;
var wall = noone;

wall = instance_place(xx+cx, yy+cy, obj_moveable_wall)


//move the moveable_wall obj if you can
if(place_meeting(xx+cx, yy+cy, obj_wall)) return true;
else if(wall!=noone){
    if(place_meeting(xx+cx*2, yy+cy*2, obj_moveable_wall)) return true;
    else if(place_meeting(xx+cx*2, yy+cy*2, obj_wall)) return true;
    else {
        wall.xmove = cx/obj_player.move_spd;
        wall.xmove = cx/obj_player.move_spd;
        wall.alarm[0] = obj_player.move_spd;
    }
}
obj_player.phy_position_x += cx;
obj_player.phy_position_x += cy;
obj_player.alarm[0] = obj_player.move_spd
obj_player_show.xmove = cx/obj_player.move_spd;
obj_player_show.ymove = cy/obj_player.move_spd;
return false;




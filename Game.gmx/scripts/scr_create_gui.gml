/// scr_create_gui(x, y, spr, (0button/1gui/2guinum/3buttonnum/4guiHotbar), -1/number)
var gx = argument0;
var gy = argument1;
var gspr = argument2;
var gui_object = argument3;
var num = argument4;
var exist = false;

if(gui_object == 0 or gui_object == 3){
    // loop through buttons to see if it exists already
    with(obj_button_parent) {
        if(sprite_index == gspr) exist = true;
    }
    
    // create the button
    if (!exist) {
        var b = instance_create(gx, gy, obj_button_parent);
        b.sprite_index = gspr;
        b.type = sprite_get_name(gspr);
        b.number = num;
        return b;
    }
} else{
    // loop through to see if it exists already
    with(obj_gui_parent) {
        if(sprite_index == gspr) exist = true;
    }
    
    // create the gui
    if (!exist) {
        var g = instance_create(gx, gy, obj_gui_parent);
        g.sprite_index = gspr;
        g.type = sprite_get_name(gspr);
        if(gui_object == 4) {
            g.startingx = g.x - view_xview[0];
            g.startingy = g.y - view_yview[0];
        }
        g.number = num;
        return g;
    }
    
}

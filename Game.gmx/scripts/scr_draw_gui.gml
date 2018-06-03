///scr_draw_gui
if(number != -1){
    var tempx = x+16;
    var tempy = y+16;
    var temp = 0;

    if (number_length == 0) {
        number_length = 1;
        temp = number/10;
            while(temp>=1){
                number_length++;
                temp/=10;
            }
    }
    if(type == "spr_level_button"){
        tempx = x+(sprite_width/2)-(sprite_get_width(spr_zero)/2)+(sprite_get_width(spr_zero)/2*(number_length-1));
        tempy = y+(sprite_height/2)-(sprite_get_height(spr_zero)/2);
    }
    scr_draw_numbers(tempx, tempy, string(number), number_length, 0)
}

///scr_draw_numbers(x, y, num, num_len, colornum)
var tempx = argument0;
var tempy = argument1;
var num = argument2;
var num_len = argument3;
var colornum = argument4;

var num_array = noone;
num_array[0, 0] = spr_zero;
num_array[0, 1] = spr_one;
num_array[0, 2] = spr_two;
num_array[0, 3] = spr_three;
num_array[0, 4] = spr_four;
num_array[0, 5] = spr_five;
num_array[0, 6] = spr_six;
num_array[0, 7] = spr_seven;
num_array[0, 8] = spr_eight;
num_array[0, 9] = spr_nine;
num_array[1, 0] = spr_zero_1;
num_array[1, 1] = spr_one_1;
num_array[1, 2] = spr_two_1;
num_array[1, 3] = spr_three_1;
num_array[1, 4] = spr_four_1;
num_array[1, 5] = spr_five_1;
num_array[1, 6] = spr_six_1;
num_array[1, 7] = spr_seven_1;
num_array[1, 8] = spr_eight_1;
num_array[1, 9] = spr_nine_1;

for(i=0;i<num_len;i++){
    if (string_char_at(num, num_len-i) == "%") draw_sprite(spr_percent_1, 0, tempx-(i*6), tempy);
    else draw_sprite(num_array[colornum, real(string_char_at(num, num_len-i))], 0, tempx-(i*6), tempy);      
}

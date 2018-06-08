///scr_get_input

//keyboard input
right_key = keyboard_check(vk_right) or keyboard_check(ord('D'));
left_key = keyboard_check(vk_left) or keyboard_check(ord('A'));
up_key = keyboard_check(vk_up) or keyboard_check(ord('W'));
down_key = keyboard_check(vk_down) or keyboard_check(ord('S'));
pause_key = keyboard_check_pressed(vk_escape);
continue_key = keyboard_check_pressed(vk_anykey);
attack_key = keyboard_check(vk_space);
switch_key = keyboard_check_pressed(ord('Q'));

// Check for gamepad input
if (gamepad_is_connected(0)) {
    if(!right_key) right_key = (gamepad_axis_value(0, gp_axislh) >= 0.5);
    if(!left_key) left_key = (gamepad_axis_value(0, gp_axislh) <= -0.5);
    if(!down_key) down_key = (gamepad_axis_value(0, gp_axislv) >= 0.5);
    if(!up_key) up_key = (gamepad_axis_value(0, gp_axislv) <= -0.5);
    if(!pause_key) pause_key = gamepad_button_check_pressed(0, gp_start);
    if(!continue_key) continue_key = gamepad_button_check_pressed(0, gp_start) or gamepad_button_check_pressed(0, gp_face1);
    if(!attack_key) attack_key = gamepad_button_check(0, gp_face2);
    if(!switch_key) switch_key = gamepad_button_check_pressed(0, gp_face4);
}

if(right_key or up_key or left_key or down_key) continue_key = false;

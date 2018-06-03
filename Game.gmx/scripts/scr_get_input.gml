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

// Check for gamepad input (overrides keyboard input)
if (gamepad_is_connected(0)) {
    right_key = (gamepad_axis_value(0, gp_axislh) >= 0.5);
    left_key = (gamepad_axis_value(0, gp_axislh) <= -0.5);
    down_key = (gamepad_axis_value(0, gp_axislv) >= 0.5);
    up_key = (gamepad_axis_value(0, gp_axislv) <= -0.5);
}

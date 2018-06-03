/// scr_pause_alarms
if (instance_exists(obj_player)){
    obj_player.stop_alarm0 = obj_player.alarm[0];
    obj_player.stop_alarm1 = obj_player.alarm[1];
}
with(obj_parent){
    stop_alarm0 = alarm[0];
    stop_alarm1 = alarm[1];
}


/// scr_unpause_alarms
if (instance_exists(obj_player)){
    obj_player.alarm[0] = obj_player.stop_alarm0;
    obj_player.alarm[1] = obj_player.stop_alarm1;
}
with(obj_parent){
    alarm[0] = stop_alarm0;
    alarm[1] = stop_alarm1;
}

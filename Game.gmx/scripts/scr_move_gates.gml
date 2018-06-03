///scr_move_gates(type_of_switch, instance)
var type = argument0;
var controller = argument1;


//loop through all gate ids
for(var i=0; i<array_length_1d(controller.gate_id); i++){
    //loop through all gates
    with(obj_gate_closed){
        //see if the ids equal
        if(controller.gate_id[i] == gate_id){
            //if the lever caused this switch it on/off
            if(type == "lever" and controller.image_index == controller.image_number-1){
                controller.image_speed = (-3)/room_speed;
                //move gate up or down
                if(image_index == image_number-1 or image_speed > 0) image_speed = (image_number-1)/room_speed*(-1);
                else if(image_index == 0 or image_speed < 0) image_speed = (image_number-1)/room_speed;
            } else if (type == "lever" and controller.image_index == 0){
                controller.image_speed = 3/room_speed;
                //move gate up or down
                if(image_index == image_number-1 or image_speed > 0) image_speed = (image_number-1)/room_speed*(-1);
                else if(image_index == 0 or image_speed < 0) image_speed = (image_number-1)/room_speed;
            } else if (type == "pressure_plate"){
                //move gate up or down
                if(image_index == image_number-1 or image_speed > 0) image_speed = (image_number-1)/room_speed*(-1);
                else if(image_index == 0 or image_speed < 0) image_speed = (image_number-1)/room_speed;
            }
        }
    }
}

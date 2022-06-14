// creates enemy ships 
if(room != rm_game){
	exit;
}


if (ship_count < 9){
	
	spawn_off_cam(obj_ship_bad, 1);
	ship_count += 1;
	

}




alarm[2] = time_multiplier*room_speed;

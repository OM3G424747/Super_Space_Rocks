// removes alarm if user is not currently in game room
if(room != rm_game){
	exit;
}

//ofset by 66 to hide the image out of bounds
spawn_off_cam(obj_astroid, 1);

alarm[0] = time_multiplier*room_speed;

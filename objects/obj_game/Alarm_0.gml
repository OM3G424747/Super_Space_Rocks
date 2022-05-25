// removes alarm if user is not currently in game room
if(room != rm_game){
	exit;
}

//ofset by 66 to hide the image out of bounds
if(choose(0,1) == 0) {
	// go down sides
	var xx = choose(-32, room_width+32);
	var yy = irandom_range(0, room_height);

}else{
	// go top or bottom
	var xx = irandom_range(0, room_width);
	var yy = choose(-32, room_height+32);

}

instance_create_layer(xx, yy, "Instances", obj_astroid);

alarm[0] = 3.6*room_speed;

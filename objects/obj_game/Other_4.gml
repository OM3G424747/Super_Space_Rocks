window_get_fullscreen();


if (room == rm_game){
	
	
	repeat(7){
		var xx = choose(
			// set's 1st 3rd of the room "left column"
			irandom_range(0, room_width*0.3),
			// set's final 3rd of the game room width
			irandom_range(room_width*0.7, room_width)
		);
	
		var yy = choose(
			// set's 1st 3rd of the room height "upper row"
			irandom_range(0, room_height*0.3),
			// set's final 3rd of the game room height "bottom row"
			irandom_range(room_height*0.7, room_height)
		);
	
	
		//spawns in asteroid
		instance_create_layer(xx, yy, "Instances", obj_astroid);
	
	}
	
	// triggers alarm to spawn more asteroids
	alarm[0] = 60;


}


if (room == rm_game){
	
	audio_stop_sound(snd_menu);
	
	
	repeat(8){
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


} else if (room == rm_gameover){
	
	hint1 = "Your thrusters can push rocks away";
	hint2 = "Try taking care of the smaller rocks first";
	hint3 = "Try shooting faster to clear clusters of small rocks";
	hint4 = "Charged shots are more effective against big rocks";
	select_hint = choose(hint1, hint2, hint3, hint4);

} else if (room == rm_start){
	
	audio_play_sound(snd_menu, 1, true);


}  
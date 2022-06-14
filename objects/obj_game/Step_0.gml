if(keyboard_check_pressed(vk_enter)){
	
	switch(room){
		
		case rm_start:
		// hides mouse cursor
		window_set_cursor(cr_none);
		room_goto(rm_game);
			break;
		
		
		
		case rm_win:
		case rm_gameover:
			// resets mouse cursor
			
			game_restart();
			break;
		
	}
}


if (room == rm_game){
	
	counter +=1;

	if (counter >= room_speed){
	
		if (time_multiplier <= 5){
			time_multiplier -= 0.04;
		}

		counter = 0;
	}
	

	if (score >= score_to_win){
		room_goto(rm_win);
		window_set_cursor(cr_arrow);
	}

	if (lives <= 0){
		room_goto(rm_gameover);
		window_set_cursor(cr_arrow);
	}

// shows screen with remaining lives
} else if (room == rm_life){

	counter += 1;
	if (counter == room_speed){
		
		alarm[3] = room_speed;
		counter = 0;
	
	}
	
	


}





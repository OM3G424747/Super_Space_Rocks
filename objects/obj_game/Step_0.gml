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
	if (score >= 30000){
		room_goto(rm_win);
		window_set_cursor(cr_arrow);
	}

	if (lives <= 0){
		room_goto(rm_gameover);
		window_set_cursor(cr_arrow);
	}
}

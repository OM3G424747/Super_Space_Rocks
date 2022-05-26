


switch(room){
	case rm_game:
		draw_text(20,20, "SCORE: "+string(score));
		draw_text(20,40, "LIVES: "+string(lives));
		break;
		
	case rm_start:
		
		draw_set_halign(fa_center);
	
		// set's colour for Title 
		var c = c_lime;
		
		draw_text_transformed_color(
			room_width/2, 200, "SUPER SPACE ROCKS",
			3, 3, 0, c, c, c, c, 1
			
		);
		
		draw_text(
			room_width/2, 300, 
			@"Score 30,000 points to win!

W or Space Bar: Thrusters
Mouse: Aim / Steer
Left Mouse Button Click: Shoot
Left Mouse Button Hold: Charged Shot

>> PRESS ENTER TO START <<
"
		);
		
		draw_set_halign(fa_left);
		
		break;
		
	case rm_win:
	
		draw_set_halign(fa_center);
	
		var c = c_lime;
		
		draw_text_transformed_color(
			room_width/2, 200, "YOU WIN!!!",
			3, 3, 0, c, c, c, c, 1
			
		);
		
		draw_text(
			room_width/2, 300, 
			"PRESS ENTER TO RESTART"
		);
		
		draw_set_halign(fa_left);
	
	
		break;
		
	case rm_gameover:
	
	
		draw_set_halign(fa_center);
	
		var c = c_red;
		
		draw_text_transformed_color(
			room_width/2, 150, "GAME OVER",
			3, 3, 0, c, c, c, c, 1
			
		);
		
		draw_text(
			room_width/2, 250, 
			"FINAL SCORE " + string(score));
			

		draw_text(
			room_width/2, 300, 
			"HINT: " + select_hint );
		
		draw_text(
			room_width/2, 400, 
			"PRESS ENTER TO RESTART");
			
		
		draw_set_halign(fa_left);
	
	
		break;

}



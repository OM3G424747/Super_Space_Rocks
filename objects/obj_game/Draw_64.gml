


switch(room){
	case rm_game:
		draw_text(20,20, "SCORE: "+string(score));
		
		// informs player max shards reached or current total
		if (cube_shards < 100){
			draw_text(20,40, "SHARDS: "+string(cube_shards));
		} else {
			draw_text(20,40, "SHARDS: 100 MAX REACHED!");
		}
		
		draw_text(20,60, "LIVES: "+string(lives));
		break;
		
	case rm_start:
		
		draw_set_halign(fa_center);
	
		// set's colour for Title 
		var c = c_lime;
		
		draw_text_transformed_color(
			room_width/2, 75, "SUPER SPACE ROCKS",
			3, 3, 0, c, c, c, c, 1
			
		);
		
		draw_text(
			room_width/2, 150, 
			@"Score 50,000 points to win!

W or Space Bar: Thrusters
S or Shift: Air Breaks
Mouse: Aim / Steer
Left Mouse Button Click: Shoot
Left Mouse Button Hold: Charged Shot
Death: Converts shards to score

>> PRESS ENTER TO START <<
"
		);
		
		draw_set_halign(fa_left);
		
		break;
		
	
	case rm_life:
	
		draw_set_halign(fa_center);
	
		var c = c_white;
		
		var lives_left = "Ships remaining = " + string(lives)
		
		draw_text_transformed_color(
			room_width/2, 150, lives_left,
			3, 3, 0, c, c, c, c, 1
			
		);
		

		
		draw_set_halign(fa_left);
	
	
		break;
		
		
		
	case rm_win:
	
		draw_set_halign(fa_center);
	
		var c = c_lime;
		
		draw_text_transformed_color(
			room_width/2, 100, "YOU WIN!!!",
			3, 3, 0, c, c, c, c, 1
			
		);
		
		draw_text(
			room_width/2, 200, 
			"PRESS ENTER TO RESTART"
		);
		
		draw_set_halign(fa_left);
	
	
		break;
		
	case rm_gameover:
	
	
		draw_set_halign(fa_center);
	
		var c = c_red;
		
		draw_text_transformed_color(
			room_width/2, 50, "GAME OVER",
			3, 3, 0, c, c, c, c, 1
			
		);
		
		draw_text(
			room_width/2, 150, 
			"FINAL SCORE " + string(score));
			

		draw_text(
			room_width/2, 200, 
			"HINT: " + select_hint );
		
		draw_text(
			room_width/2, 300, 
			"PRESS ENTER TO RESTART");
			
		
		draw_set_halign(fa_left);
	
	
		break;

}



/// @description checks if two ships crashed into each other
// You can write your code in this editor


with(other){
		
	if(object_index == obj_ship_bad){
		

		var other_speed = other.speed;
		var other_direction = other.direction;
		
		// checks if ship is in stand still
		if(speed <= 0.10){
		
			direction = other_direction;
		
		} else {
		
			direction = direction - other_direction;
		
		}
		
		
		
		speed = (speed*0.5  + other_speed*0.5);
		
	
	
	}

}
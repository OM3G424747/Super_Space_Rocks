with(other){

	// sets force for cube size
	var thrust_force = 0.15;
	
	// reduces force based on cube mass / size
	if(sprite_index == spr_astroid_med){
		
		thrust_force = thrust_force/4;
	
	} else if (sprite_index == spr_astroid_lrg){
	
		thrust_force = thrust_force/16;
	
	}
	
	ox = obj_wave.x;
	oy = obj_wave.y
	
	wave_direction = point_direction(ox, oy, x, y)
	
	motion_add(wave_direction, thrust_force);
	
	dist = point_distance(ox, oy, x, y);
	
	dir = point_direction(ox, oy, x, y) + image_angle;
	
	rx = ox + lengthdir_x(dist, dir);
	ry = oy + lengthdir_y(dist, dir);
	

	
	if (ry < y and rx < x){
		
		rotate_direction -= thrust_force;
	
	} else if (ry > y and rx > x){
		
		rotate_direction += thrust_force;
	
	} else if (ry < y and rx > x){
		
		rotate_direction += thrust_force;
	
	
	} else if (ry > y and rx < x){
		
		rotate_direction -= thrust_force;
		
	}
	
}



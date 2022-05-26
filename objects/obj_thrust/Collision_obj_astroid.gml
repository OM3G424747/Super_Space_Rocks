with(other){

	// sets force for cube size
	var thrust_force = 0.02;
	
	// reduces force based on cube mass / size
	if(sprite_index == spr_astroid_med){
		
		thrust_force = thrust_force/4;
	
	} else if (sprite_index == spr_astroid_lrg){
	
		thrust_force = thrust_force/16;
	
	}
	
	
	motion_add(obj_thrust.direction, thrust_force);
	
	// x & y == cube pivot point
	// ox & oy == thrust colusion point
	ox = obj_thrust.x;
	oy = obj_thrust.y
	
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

// destroys thurst that hit cubes
instance_destroy();

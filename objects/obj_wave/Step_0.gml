
if (image_alpha >= 0 ){
	
	image_xscale += 0.8;
	image_yscale += 0.8;
	
	image_alpha -= 0.05;

	image_angle += 180;

}




outer_limits += outer_limits*0.2;



repeat(20){
	
	var select_dir = irandom_range(0,359);
	
	orb_x = x + lengthdir_x(outer_limits, select_dir);
	orb_y = y + lengthdir_y(outer_limits, select_dir);
	

	var orb = instance_create_layer(orb_x, orb_y, "Instances", obj_wave_glow);
		
	// points orb back at ship
	orb.direction = select_dir - 180;
	
	orb.speed = 2;
	
	orb.image_alpha = image_alpha;
		

}



// spawns player at end of wave
if (image_alpha <= 0){
	
	counter += 1
	
	if (counter >= room_speed/4){
		
		// creates a new ship to respawn
		instance_create_layer(x,y,"Instances", obj_ship)

		instance_destroy();
	
	}
	

}
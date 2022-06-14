/// @checks if bullet still in view

// if bullet not in view, destroy bullet
if(!point_in_rectangle(x,y, 
	global.cam_x, 
	global.cam_y, 
	global.cam_x + (global.cam_width*2), 
	global.cam_y + (global.cam_height*2)
	)){

	// only destroys player bullets
	if(faction == factions.good){
		instance_destroy();
	}
}

// sets enemy bullets to fade
if(faction == factions.bad){
	
	
	image_alpha -=fade_ammount;
	
	// multiplies by self at a small fraction.
	// self multiplication results in agressive fade to end 
	fade_ammount = fade_ammount*1.04;
	
	if(image_alpha <= 0){
	
		instance_destroy();
	
	}

}
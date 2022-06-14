// applied "none" faction properties to ship
event_inherited();

hp = 1;

// used to randomly select a sprite for the astroids 
sprite_index = choose(
	spr_astroid_lrg, 
	spr_astroid_med,
	spr_astroid_sml
	
	);
	

// chooses the starting angle and direction of each asteroid 
direction = irandom_range(0, 359);
image_angle = irandom_range(0, 359);

prive_var = choose(0.50, 1, 1.50);

speed = prive_var;

rotation_speed = prive_var;

// selects a radom rotation direction 
rotate_direction = choose(rotation_speed, -rotation_speed);

// spawns shade
alarm[0] = room_speed;




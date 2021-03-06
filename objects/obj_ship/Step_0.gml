



// used to rotate ship to match mouse
image_angle = point_direction(x,y,mouse_x, mouse_y);

// second counter for mouse press
var seconds = 1;


// used to turn the ship left 
// TODO - redo with controler input
//if(keyboard_check(ord("A"))){
//image_angle += 5;
//}


// used to turn the ship right
// TODO - redo with controler input
//if(keyboard_check(ord("D"))){
//image_angle -= 5;
//}

if(keyboard_check(ord("S")) or keyboard_check(vk_shift)){
	
	if (speed > 0){
		
		
		audio_play_sound(snd_thruster2,1,false);
		
		speed -= 0.10;
		var dust = instance_create_layer(x, y, "Instances", obj_ship_break);
		
		var new_dir = irandom_range(obj_ship.direction - 15, obj_ship.direction + 15);
		
		dust.direction =  new_dir;
		dust.speed = obj_ship.speed + 0.5;
	
	}
	
}


// used to move the ship forward 
if(keyboard_check(ord("W")) or keyboard_check(vk_space)){
	
	// moves ship forward in direction of nose
	motion_add(image_angle, 0.10);
	
	
	// pulls get streams closer to jet at high speed
	var away_from_ship = 12;
	
	// sets hub for thruster objects to rotate arround at the rear of the ship 7px away
	var hub_x = obj_ship.x + lengthdir_x(away_from_ship,image_angle-180);
	var hub_y = obj_ship.y + lengthdir_y(away_from_ship,image_angle-180);
	
	// creates hub instance
	var hub = instance_create_layer(hub_x, hub_y, "Instances", obj_hub);
	hub.direction = direction;
	hub.speed = speed;

	// sets left and right thruster based on the location of the hub
	var thrust_left_x = hub.x + lengthdir_x(2,image_angle-270);
	var thrust_left_y = hub.y + lengthdir_y(2,image_angle-270);
	
	var thrust_right_x = hub.x + lengthdir_x(2,image_angle-90);
	var thrust_right_y = hub.y + lengthdir_y(2,image_angle-90);
	
	
	
	if(thrust_counter == 0){
	
		// creates left and right thruster instance
		var thrust_left = instance_create_layer(thrust_left_x, thrust_left_y, "Instances", obj_thrust);
	    var thrust_right = instance_create_layer(thrust_right_x, thrust_right_y, "Instances", obj_thrust);
		thrust_counter += 1;
	
	
		thrust_left.direction = image_angle-180;
		thrust_left.speed = speed;
		thrust_right.direction = image_angle-180;
		thrust_right.speed = speed;
	
		if (prev_thruster_left!= "NA" and prev_thruster_right != "NA"){
			thrust_left.trail_point_obj = prev_thruster_left;
			thrust_right.trail_point_obj = prev_thruster_right;
	
		}
	
		prev_thruster_left = thrust_left;
		prev_thruster_right = thrust_right;
	
		// stores the force from the direction and angle of the ship combined
		//var force_turn = (direction-image_angle);
	

		// changes direction and angle of thrustes to match those of the ship
		thrust_left.image_angle = image_angle-180 ;
		thrust_right.image_angle = image_angle-180 ;
	
	
		//thrust_left.direction = thrust_left.image_angle;
		//thrust_right.direction = thrust_right.image_angle ;

		// sets thrusters to match side ways motion of ship
		with(thrust_left){
			motion_add(obj_ship.direction, obj_ship.speed);
		
		
		}
	
		// sets thrusters sparks to match side ways motion of ship
		with(thrust_right){
			motion_add(obj_ship.direction, obj_ship.speed);
	
		}
	
		//thrust_left.speed += (obj_ship.speed*0.8);
		//thrust_right.speed += (obj_ship.speed*0.8);
	
		// stretches out image based on ship speed
		thrust_right.image_xscale = 0.6 + (obj_ship.speed/10)
		thrust_left.image_xscale = 0.6 + (obj_ship.speed/10)
	} else if (thrust_counter >= 2) {
		
		thrust_counter = 0;
	
	} else {
		thrust_counter += 1;
	
	}
	
	// handles thuster sparks
	
	var spark_spray = choose(irandom_range(355, 359), irandom_range(0,5));
	var select_jet = choose(0,1);
	
	if (select_jet == 0){
		
		// selects left jet for spark
		var spark = instance_create_layer(thrust_left_x, thrust_left_y, "Instances", obj_spark);
		
		spark.direction = (image_angle-180) - spark_spray;
			
	
	} else {
		
		// selects right jet for spark
		var spark = instance_create_layer(thrust_right_x, thrust_right_y, "Instances", obj_spark);
		
		spark.direction = (image_angle-180) - spark_spray;
			
	
	}
		
	// sets sparks to match side ways motion of ship
	with(spark){
		motion_add(obj_ship.direction, obj_ship.speed);		
	}
	

	
}


// set's frequency for charge sound
var number_of_frames = 15;
var freq = room_speed / number_of_frames;

if mouse_check_button(mb_left){

	// increments per frame
	counter += 1
	
	// sets orb hub at front of ship
	var orb_hub_x = x + lengthdir_x(17,image_angle);
	var orb_hub_y = y + lengthdir_y(17,image_angle);
	
	// creates hub instance
	var orb_hub = instance_create_layer(orb_hub_x, orb_hub_y, "Instances", obj_hub);
	
	var deviation = irandom_range(0,40);
	
	// set's deviation to left or right
	var select_deviant = choose(deviation, -deviation);
	
	// sets spawn point for orbs at front of ship during carge
	var orb_x = orb_hub.x + lengthdir_x(75,image_angle + select_deviant);
	var orb_y = orb_hub.y + lengthdir_y(75,image_angle + select_deviant);
	
	if (counter >= room_speed * seconds) {
		
		
		
		// plays sound ever set frame frame
		if(counter %freq = 0){
			audio_play_sound(snd_charge2, 8, false);
		}
		
		var orb_glow = instance_create_layer(orb_hub.x, orb_hub.y, "Instances", obj_ship_glow);
		
		orb_glow.image_xscale += 1;
		orb_glow.image_yscale += 1;
		
		var orb = instance_create_layer(orb_x, orb_y, "Instances", obj_ship_charge);
		
		orb.direction = point_direction(orb_x, orb_y, orb_hub.x, orb_hub.y);
		
	
	} else if (counter >= room_speed * (seconds*0.2)) {
		
	
		// plays sound ever set frame frame
		if(counter %freq = 0){
			audio_play_sound(snd_charge1, 8, false);
		}
		
		
		var orb_glow = instance_create_layer(orb_hub.x, orb_hub.y, "Instances", obj_ship_glow);
		
		var orb = instance_create_layer(orb_x, orb_y, "Instances", obj_ship_charge);
		
		orb.direction = point_direction(orb_x, orb_y, orb_hub.x, orb_hub.y);
		
		orb.image_xscale -= 0.5;
		orb.image_yscale -= 0.5;	
	
	} 
	
	

}


// checks if left mouse button is clicked
else if mouse_check_button_released(mb_left){
	
	var ship_dir = image_angle;
	var basic_bullet_speed = 14;

	// full charge
	if counter >= room_speed * seconds {
	
	
		// full change bullet  
		// level 3 == 8;
		// hit 8 rocks before ending
		// speed buff of 1 unit
		create_bullet(ship_dir, basic_bullet_speed + 2, 8, faction);
   
	    counter = 0;

	// half charge
	} else if (counter >= room_speed * (seconds*0.2)){
	

		// full change bullet  
		// level 2 == 4;
		// hit 4 rocks before ending
		// speed buff of 1 unit
		create_bullet(ship_dir, basic_bullet_speed + 1, 4, faction);
   
		counter = 0;


	} else if (counter < room_speed * (seconds*0.5)){

		create_bullet(ship_dir, basic_bullet_speed, 1, faction);
	
		audio_play_sound(snd_zap, 8, false);
   
		counter = 0;

	}

	
}


// used to warp the ship to the other side of the map if it goes out of bounds
move_wrap(true, true, sprite_height/2);



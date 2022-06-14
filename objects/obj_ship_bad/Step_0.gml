/// @description AI

if(dmg_flash_counter >= 5){
	
	is_damaged = false;
	image_blend = c_white;
	
	dmg_flash_counter = 0;

}

if(is_damaged){

	dmg_flash_counter += 1;
	
	if(dmg_flash_counter%2 == 0){
		image_blend = c_green;
	} else {
		image_blend = c_white;
	}
}



// checks if HP has been depleted
if(hp <= 0){
	
	// destroys ship
	instance_destroy();	
}


// turn to look at the current direction
var new_dir = image_angle;
	

// second counter for firing at player
var seconds = 1;

// set's enemy bullet speed
var basic_bullet_speed = 10;

// exists script if player is destroyed and sets to not agro
if(!instance_exists(obj_ship)){
	
	exit;

}


// checks neares rock
var rock = instance_nearest(x, y, obj_astroid);

// checks if a good rock exists and if it's closer, replaced normal rock

if(instance_exists(obj_good_astroid)){
	var good_rock = instance_nearest(x, y, obj_good_astroid);
	
	if( point_distance(x,y, rock.x, rock.y) > point_distance(x,y, good_rock.x, good_rock.y)){
	
		rock = good_rock;
	
	}
	
}

var rock_location = point_direction(self.x, self.y, rock.x, rock.y);

// other enemey ship
var bad_ship = instance_nearest(x, y, obj_ship_bad);
var bad_ship_location = point_direction(self.x, self.y, bad_ship.x, bad_ship.y);


// sets defaults for rocks
var front_rock = false;
var side_rock = false;

var front_ship = false;



// detects nearby astroids in front to avoid them
// CHECK FRONT 
if(((rock_location > image_angle - 55 and rock_location < image_angle + 55)) and
	(point_distance(x,y, rock.x, rock.y) < 350)){
	
	
	// returns true if a rock is infront
	front_rock = true;
	side_rock = false;


// checks front at closer range
}else if ((point_distance(x,y, rock.x, rock.y) < 100) and 
(rock_location > image_angle - 90 and rock_location < image_angle + 90)
){
	
	// returns true if a rock is infront
	front_rock = true;
	side_rock = false;
	
	
// returns true if rocks are from the sides
} else if (point_distance(x,y, rock.x, rock.y) < 150 ){
	
	front_rock = false;
	side_rock = true;
	
} else {
		
	front_rock = false;
	side_rock = false;
	
}


// checks if another ship is infront and applies breaks if it is
if(((bad_ship_location > image_angle - 45 and bad_ship_location < image_angle + 45))){
		
	// confirms the bad ship found is not the current bad ship
	if(bad_ship.id != id){
		
		front_ship = true;
	}
	
} else if ((point_distance(x,y, bad_ship.x, bad_ship.y) < 100) and 
(bad_ship_location > image_angle - 110 and bad_ship_location < image_angle + 110)
){
	
	// confirms the bad ship found is not the current bad ship
	if(bad_ship.id != id){
		
		front_ship = true;
	}


}




// refreshes ship targeting data
if(is_agro){
	
	
	// set's aim at player
	aim_selection = point_direction(x,y, obj_ship.x, obj_ship.y);
	// sets target range to player
	target_range = point_distance(x,y, obj_ship.x, obj_ship.y);
	
	new_dir = aim_selection;
	
} else if(!is_agro) {
	
	// sets to rock location if a rock is closer
	aim_selection = rock_location;
	target_range = point_distance(x,y, rock.x, rock.y);
	
	new_dir = aim_selection;

}




// fires bullet if player has agroed the ship and is in range
if(target_range < 300 and !front_ship){
	
	

	if (counter >= room_speed * seconds) {

		// creates a bullet fired at the player
		create_bullet(image_angle, basic_bullet_speed*0.5, 1, faction);
		
		on_cam_audio(x, y, snd_zap);

		counter = 0;
	
	// charge animation for enemy bullet
	} else {
		
		// counts 1 second to fire
		counter += 1;
		
		var orb_hub_x = x + lengthdir_x(17,image_angle);
		var orb_hub_y = y + lengthdir_y(17,image_angle);
		
		var orb = instance_create_layer(orb_hub_x, orb_hub_y, "Instances", obj_bad_ship_charge);
		
		if (counter %2 = 0 or counter %3 = 0){
		
			orb.image_xscale = 0.5;
			orb.image_yscale = 0.5;
		
		}

	}
} else {

	// resets counter if player is out of range
	counter = 0;

}





//sets to agro if player is in range
// fires at player when in range
if(point_distance(x,y, obj_ship.x, obj_ship.y) < 200 ){
	
	// locks onto player ship
	is_agro = true;
		
		
}



// accelerates ship if player is out of range up to 180
if(is_agro and target_range > 330 and !is_closing_dist ){
	

		is_closing_dist = true;
	
}



// CONTROLLS FORWARD MOTION OF SHIP ONLY WHEN AGRO
// check if ship is in range to close the distance on player
if(is_agro and (target_range < 350 or target_range > 150) and !is_closing_dist){
	

	// Breaks when player is close
	// assists ship in changing direction towards they player by using air breaks
	if( target_range < 200 or
	(direction > new_dir + 10 or direction < new_dir - 10)or 
	(front_ship or front_rock)){
		
		// applies air breaks
		if(speed > 0){
			speed -= 0.10;
			
			on_cam_audio(x, y, snd_thruster2);
		
			var dust = instance_create_layer(x, y, "Instances", obj_ship_break);
		
			var dust_dir = irandom_range(self.direction - 30, self.direction + 30);
		
			dust.direction =  dust_dir;
			dust.speed = self.speed + 0.5;
	
		}
	
	}
	
	
	


// sets behaviour for when player is in range
}else if(is_agro and target_range < 350 and !is_closing_dist or (front_ship or front_rock)){
	
	
	// applies breaks
	if(speed > 0){
			speed -= 0.10;
			
			on_cam_audio(x, y, snd_thruster2);
		
			var dust = instance_create_layer(x, y, "Instances", obj_ship_break);
		
			var dust_dir = irandom_range(self.direction - 30, self.direction + 30);
		
			dust.direction =  dust_dir;
			dust.speed = self.speed + 0.5;
	
	}
	

}else if(is_agro and is_closing_dist){
	
		if(target_range < 250){
		
			is_closing_dist = false;
		
		}
		
		
		// TODO
		// add codition to check if speed is above limit and direction is too agressive
		// break or add speed
		
		// else if speed is below limit, apply speed
	
		// accelerates in set direction if within 90 angle
		if(speed < 3 and (image_angle < aim_selection + 45 and image_angle > aim_selection - 45) and (!front_ship and !front_rock)){
	
			motion_add(image_angle, 0.10);
			
			var thrust_hub_x = x + lengthdir_x(7,image_angle-180);
			var thrust_hub_y = y + lengthdir_y(7,image_angle-180);
			
			// creates left and right thruster instance
			var thrust = instance_create_layer(thrust_hub_x, thrust_hub_y, "Instances", obj_thrust);
	    
			thrust_counter += 1;
	
			thrust.direction = image_angle-180;
			thrust.speed = speed;

	
			// sets thruster trail
			if ( prev_thruster != "NA"){
				thrust.trail_point_obj = prev_thruster;
			}
	
			prev_thruster = thrust;


			// changes direction and angle of thrustes to match those of the ship
			thrust.image_angle = image_angle-180 ;


			// sets thrusters to match side ways motion of ship
			with(thrust){
				motion_add(other.direction, other.speed);
				// stretches out image based on ship speed
				thrust.image_xscale = 0.6 + (other.speed/10);
		
			} 
		
		// applies air breaks if speed goes over 3
		} else if(speed > 3){
			speed -= 0.10;
			
			on_cam_audio(x, y, snd_thruster2);
		
			var dust = instance_create_layer(x, y, "Instances", obj_ship_break);
		
			var dust_dir = irandom_range(self.direction - 30, self.direction + 30);
		
			dust.direction =  dust_dir;
			dust.speed = self.speed + 0.5;
	
		}
	
	
// checks if the player fired a bullet
}else if(instance_exists(obj_bullet) and obj_bullet.faction == factions.good ){
	

	// sets ship to agro if the bullet was detected nearby
	if(point_distance(x,y, obj_bullet.x, obj_bullet.y) < 100 ){
		
		is_agro = true;
		
		// turn to look at player and accelerate
		var new_dir = point_direction(x,y,obj_ship.x, obj_ship.y);
		
		// sets aim to player
		aim_selection = new_dir;
		// sets target range to player
		target_range = point_distance(x,y, obj_ship.x, obj_ship.y);
	
			
	}


// if no other conditions are met
} else {
	

	if(((direction > image_angle + 20 or direction < image_angle - 20) and speed >= 0.10) or speed > 2.10 or target_range <= 75 or (front_ship or front_rock) ){
		
		// applies air breaks
		if(speed > 0){
			
			speed -= 0.10;
			
			on_cam_audio(x, y, snd_thruster2);
		
			var dust = instance_create_layer(x, y, "Instances", obj_ship_break);
		
			var dust_dir = irandom_range(self.direction - 30, self.direction + 30);
		
			dust.direction =  dust_dir;
			dust.speed = self.speed + 0.5;
		}
	


	// moves shop forward if angle is at acceptable range
	} else if(((direction < image_angle + 15 and direction > image_angle - 15) or speed < 1.90) and target_range > 100 and (!front_ship and !front_rock)){
	
		
		
		// moves ship forward
		
			motion_add(image_angle, 0.10);
	
		
			var thrust_hub_x = x + lengthdir_x(7,image_angle-180);
			var thrust_hub_y = y + lengthdir_y(7,image_angle-180);
			
			// creates left and right thruster instance
			var thrust = instance_create_layer(thrust_hub_x, thrust_hub_y, "Instances", obj_thrust);
	    
			thrust_counter += 1;
	
			thrust.direction = image_angle-180;
			thrust.speed = speed;

			// sets thruster trail
			if ( prev_thruster != "NA"){
				thrust.trail_point_obj = prev_thruster;
			}
	
			prev_thruster = thrust;


			// changes direction and angle of thrustes to match those of the ship
			thrust.image_angle = image_angle-180 ;


			// sets thrusters to match side ways motion of ship
			with(thrust){
				motion_add(other.direction, other.speed);
				// stretches out image based on ship speed
				thrust.image_xscale = 0.6 + (other.speed/10);
			}
	
		
	}

}


// corrects image angle
if(image_angle > 360){

	image_angle = image_angle - 360;

} else if (image_angle < 0){

	image_angle = image_angle + 360;

}

// corrects turning to avoid spinning arround
new_dir = image_angle - angle_difference(image_angle, new_dir);
	
image_angle = lerp(image_angle, new_dir, 0.1);
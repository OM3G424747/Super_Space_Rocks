/// @checks factions to set behaviour

// sets spawn direction for bullets
var spawn_dir = direction-180;
var spawn_speed = choose( 1.3,1.4,1.5,1.6,1.7,1.8,1.9,2,2.1);

// check if faction matches current faction
if (other.faction == faction) exit;


var bullet_charge = charge;

hp = charge;
var bullet_hp = hp;

if(faction == factions.good){
	
	
	//TODO - update to change HP based on charge 
	with(other){
		
		while(hp > 0 and bullet_charge > 0 ){
			// damages object 
			// performs user event 1 on the object

			bullet_charge -= 1;
			hp -= 1;
		
			event_perform(ev_other, ev_user1);
			
			// spawns sparks on impact
			repeat(5){

				var spark = instance_create_layer(x, y, "Instances", obj_spark);
	
				spark.direction = irandom_range(spawn_dir-45, spawn_dir+45);
	
				// set's lower speed for sparks
				spark.speed = spawn_speed - irandom_range(0.3, 0.6);
				spark.image_xscale = 2.5;
				spark.image_yscale = 2.5;

			}
			
		
		}
	
	}
	
	if(bullet_charge <= 0){
		charge = 0;
		
	} else {
		charge = bullet_charge;
		hp = charge
	
	}
	

} else {
	
	// damages object 
	// performs user event 1 on the object

	charge -= 1;

	// set's bullet HP to match charge
	hp = charge;

	with(other)event_perform(ev_other, ev_user0);
	// spawns sparks on impact
	repeat(5){

		var spark = instance_create_layer(x, y, "Instances", obj_spark);
	
		spark.direction = irandom_range(spawn_dir-45, spawn_dir+45);
	
		// set's lower speed for sparks
		spark.speed = spawn_speed;
		spark.image_xscale = 2.5;
		spark.image_yscale = 2.5;

	}

}


// if max charge is depleted, the bullet is destroyed
if (charge <= 0){
	

	// spawns sparks on impact
	repeat(5){

		var spark = instance_create_layer(x, y, "Instances", obj_spark);
	
		spark.direction = irandom_range(spawn_dir-45, spawn_dir+45);
	
		// set's lower speed for sparks
		spark.speed = spawn_speed;
		spark.image_xscale = 2.5;
		spark.image_yscale = 2.5;

	}
	
	instance_destroy();

}



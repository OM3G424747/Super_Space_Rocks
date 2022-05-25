

// used to rotate ship to match mouse
image_angle = point_direction(x,y,mouse_x, mouse_y);


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

// used to move the ship forward 
if(keyboard_check(ord("W")) or keyboard_check(vk_space)){
	
	// sets hub for thruster objects to rotate arround at the rear of the ship 7px away
	var hub_x = x + lengthdir_x(6,image_angle-180);
	var hub_y = y + lengthdir_y(6,image_angle-180);
	
	// creates hub instance
	var hub = instance_create_layer(hub_x, hub_y, "Instances", obj_hub);
	

	
	// sets left and right thruster based on the location of the hub
	var thrust_left_x = hub.x + lengthdir_x(2,image_angle-270);
	var thrust_left_y = hub.y + lengthdir_y(2,image_angle-270);
	var thrust_right_x = hub.x + lengthdir_x(2,image_angle-90);
	var thrust_right_y = hub.y + lengthdir_y(2,image_angle-90);
	
	// creates left and right thruster instance
	var thrust_left = instance_create_layer(thrust_left_x, thrust_left_y, "Instances", obj_thrust);
    var thrust_right = instance_create_layer(thrust_right_x, thrust_right_y, "Instances", obj_thrust);
	
	// changes direction and angle of thrustes to match those of the ship
	thrust_left.direction = image_angle-180;
	thrust_left.image_angle = image_angle-180;
	thrust_right.direction = image_angle-180;
	thrust_right.image_angle = image_angle-180;
	

	motion_add(image_angle, 0.10);
	
	thrust_left.speed += obj_ship.speed;
	thrust_right.speed += obj_ship.speed;
	
	// handles thuster sparks
	var spark_spray = choose(irandom_range(355, 359), irandom_range(0,5));
	var select_jet = choose(0,1);
	
	if (select_jet == 0){
		
		// selects left jet for spark
		var spark = instance_create_layer(thrust_left.x, thrust_left.y, "Instances", obj_spark);
		
		spark.direction = thrust_left.direction - spark_spray;
	
	} else {
		
		// selects right jet for spark
		var spark = instance_create_layer(thrust_right.x, thrust_right.y, "Instances", obj_spark);
		
		spark.direction = thrust_right.direction - spark_spray;
	
	}
	

}

// checks if left mouse button is clicked
if mouse_check_button_pressed(mb_left)
{

	audio_play_sound(snd_zap, 8, false);
	var inst = instance_create_layer(x,y, "Instances", obj_bullet);
	
	inst.direction = image_angle;
	inst.image_angle = image_angle;
	
}


// used to warp the ship to the other side of the map if it goes out of bounds
move_wrap(true, true, sprite_height/2);



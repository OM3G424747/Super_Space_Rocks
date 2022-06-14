// chance sets the number range needed out of the spawn_range to spawn a cube 
var good_spawn_chance = 38;
var good_spawn_range = 40;

// used to warp the asteroid to the other side of the map if it goes out of bounds
move_wrap(true, true, sprite_height);

// adds the selected rotation direction to the current angle
// rotate_direction set on creation 
image_angle += rotate_direction;



if (hp <= 0){
	
	var boom_rock = choose(snd_boom1, snd_boom2, snd_boom3);
	
	on_cam_audio(x, y, boom_rock)

	if(sprite_index == spr_astroid_lrg){
		
			// creates sides 
			var side_top = instance_create_layer(x,y, "Instances", obj_astroid_side);
			var side_right = instance_create_layer(x,y, "Instances", obj_astroid_side);
			var side_bottom = instance_create_layer(x,y, "Instances", obj_astroid_side);
			var side_left = instance_create_layer(x,y, "Instances", obj_astroid_side);
			
			// set's angle to match astroid sides
			side_right.image_angle = side_right.image_angle + 90;
			side_bottom.image_angle = side_right.image_angle + 180;
			side_left.image_angle = side_right.image_angle + 270;
		
		repeat(4){
			
			// sets chance of spawning a good cube
			var good_cube_chance = irandom_range(0, good_spawn_range);
			
			if (good_cube_chance >= good_spawn_chance){
				
				var astroid = instance_create_layer(x,y, "Instances", obj_good_astroid);
				with(astroid){
					astroid.sprite_index = spr_good_astroid_med;
				}	
			
			}else{
			
				var astroid = instance_create_layer(x,y, "Instances", obj_astroid);
				with(astroid){
					astroid.sprite_index = spr_astroid_med;
				}	
			
			}
			
		}
		

		
		// set's dust randomly within the cubes diameters
		repeat(120){
			
			var dust_x = irandom_range(astroid.x-29, astroid.x+29);
			var dust_y = irandom_range(astroid.y-29, astroid.y+29);
			
			instance_create_layer(dust_x,dust_y, "Instances", obj_dust);
		}
		
	
	} else if (sprite_index == spr_astroid_med){
		
		// creates sides 
		var side_top = instance_create_layer(x,y, "Instances", obj_astroid_side);
		var side_right = instance_create_layer(x,y, "Instances", obj_astroid_side);
		var side_bottom = instance_create_layer(x,y, "Instances", obj_astroid_side);
		var side_left = instance_create_layer(x,y, "Instances", obj_astroid_side);
			
		// set's sprites to med
		side_top.sprite_index = spr_astroid_med_side
		side_bottom.sprite_index = spr_astroid_med_side
		side_left.sprite_index = spr_astroid_med_side
		side_right.sprite_index = spr_astroid_med_side
			
		// set's angle to match astroid sides
		side_right.image_angle = side_right.image_angle + 90;
		side_bottom.image_angle = side_right.image_angle + 180;
		side_left.image_angle = side_right.image_angle + 270;
		
		
		repeat(4){
			
			// sets chance of spawning a good cube
			var good_cube_chance = irandom_range(0, good_spawn_range);
			
			if (good_cube_chance >= good_spawn_chance){
				
				var astroid = instance_create_layer(x,y, "Instances", obj_good_astroid);
				with(astroid){
					astroid.sprite_index = spr_good_astroid_sml;
				}	
			
			}else{
			
				var astroid = instance_create_layer(x,y, "Instances", obj_astroid);
			
				with(astroid){
					astroid.sprite_index = spr_astroid_sml;
				}
			}
		}
		
				// set's dust randomly within the cubes diameters
		repeat(60){
			
			var dust_x = irandom_range(astroid.x-15, astroid.x+15);
			var dust_y = irandom_range(astroid.y-15, astroid.y+15);
			
			instance_create_layer(dust_x,dust_y, "Instances", obj_dust);
		}
		
	} else if (sprite_index == spr_astroid_sml){
		
		// creates sides 
		var side_top = instance_create_layer(x,y, "Instances", obj_astroid_side);
		var side_right = instance_create_layer(x,y, "Instances", obj_astroid_side);
		var side_bottom = instance_create_layer(x,y, "Instances", obj_astroid_side);
		var side_left = instance_create_layer(x,y, "Instances", obj_astroid_side);
			
		// set's sprites to med
		side_top.sprite_index = spr_astroid_sml_side
		side_bottom.sprite_index = spr_astroid_sml_side
		side_left.sprite_index = spr_astroid_sml_side
		side_right.sprite_index = spr_astroid_sml_side
			
		// set's angle to match astroid sides
		side_right.image_angle = side_right.image_angle + 90;
		side_bottom.image_angle = side_right.image_angle + 180;
		side_left.image_angle = side_right.image_angle + 270;
		
		repeat(40){
			
			instance_create_layer(x,y, "Instances", obj_dust);
		}
	
	}
	
	// destroys parent asteroid
	instance_destroy();
	
}





charge -= 1;
score += 100;

// if max charge is depleted, the bullet is destroyed
if (charge <= 0){
	
	instance_destroy();

}


with(other){
	instance_destroy();
	var boom_rock = choose(snd_boom1, snd_boom2, snd_boom3);
	
	audio_play_sound(boom_rock, 2, false);
	
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
			var astroid = instance_create_layer(x,y, "Instances", obj_astroid);
			astroid.sprite_index = spr_astroid_med;
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
			var astroid = instance_create_layer(x,y, "Instances", obj_astroid);
			astroid.sprite_index = spr_astroid_sml;
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
	
	
}

// set's rotation speed and movement speed 
image_alpha -= fade_var;

image_angle += rotate_direction;

if (image_alpha <= 0){
	
	instance_destroy();

}

// set's dust to good dust
if(is_good){

	sprite_index = spr_good_dust;

}
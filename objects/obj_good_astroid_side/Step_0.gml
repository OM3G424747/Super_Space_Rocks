// set's rotation speed and movement speed 
image_alpha -= fade_var;

image_angle += rotate_direction;

if (image_alpha <= 0){
	
	instance_destroy();

}

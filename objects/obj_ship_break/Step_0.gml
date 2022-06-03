// set's rotation speed and movement speed 
image_alpha -= fade_var;

image_xscale += fade_var;
image_yscale += fade_var;

if (speed > 0.10){
	speed -= 0.10;

}


if (image_alpha <= 0){
	
	instance_destroy();

}



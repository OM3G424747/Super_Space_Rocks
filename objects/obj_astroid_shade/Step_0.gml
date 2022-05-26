
var fade_step = 0.03;



if (image_alpha <= 0){

	instance_destroy();

} 


//rotation assigned on creation
image_angle += rotate_direction;



// changes scale to give a pulsing effect
image_xscale +=0.03;
image_yscale +=0.03;

image_alpha -= fade_step;


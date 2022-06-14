image_alpha -= 0.01;

speed -= irandom_range(0.3, 0.8);

if (image_alpha <= 0){
	
	instance_destroy();

} else if (image_alpha <= 5){
	
	image_xscale = 0.5;
	image_yscale = 0.5;

}


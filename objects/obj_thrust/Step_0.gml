image_alpha -= 0.07;


if (image_alpha <= 0){
	
	instance_destroy();

}

if(trail_point_obj != "NA" and instance_exists(trail_point_obj)){

	var end_point_x = trail_point_obj.x + lengthdir_x(25,image_angle);
	var end_point_y = trail_point_obj.y + lengthdir_y(25,image_angle);
	
	image_angle = point_direction(x,y,end_point_x, end_point_y);
		

}


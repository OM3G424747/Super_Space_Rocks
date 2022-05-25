shade_instance = instance_create_layer(x, y, "Instances", obj_astroid_shade);
	
shade_instance.sprite_index = sprite_index;
	
shade_instance.image_angle = image_angle;

shade_instance.direction = direction;
	
shade_instance.speed = speed/2;

// assigns rotate_direction variable based on current rotation
with(shade_instance){
	
	 rotate_direction = other.rotate_direction;
}

alarm[0] = room_speed;

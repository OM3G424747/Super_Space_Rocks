/// @creates red sparks & destroys yellow spark



// sets force for cube size
var thrust_force = 0.05;
	
// reduces force based on cube mass / size
if(sprite_index == spr_astroid_med){
		
	thrust_force = thrust_force/4;
	
} else if (sprite_index == spr_astroid_lrg){
	
	thrust_force = thrust_force/16;
	
}
	
	
motion_add(obj_spark.direction, thrust_force);
	
// x & y == cube pivot point
// ox & oy == thrust colusion point
ox = obj_spark.x;
oy = obj_spark.y
	
dist = point_distance(ox, oy, x, y);
	
dir = point_direction(ox, oy, x, y) + image_angle;
	
rx = ox + lengthdir_x(dist, dir);
ry = oy + lengthdir_y(dist, dir);
	

	
if (ry < y and rx < x){
		
	rotate_direction -= thrust_force;
	
} else if (ry > y and rx > x){
		
	rotate_direction += thrust_force;
	
} else if (ry < y and rx > x){
		
	rotate_direction += thrust_force;
	
	
} else if (ry > y and rx < x){
		
	rotate_direction -= thrust_force;
		
}
	



with(other){
	

	repeat(8){
	
		var hit_spark = instance_create_layer(x, y, "Instances", obj_spark_red);
		
	
		hit_spark.image_xscale = image_xscale;
		hit_spark.image_yscale = image_yscale;
	
		// sets image alpha to match current spark
		hit_spark.image_alpha = image_alpha;

	
		
	
		var bounce = obj_astroid.direction - direction;

		hit_spark.direction = irandom_range(bounce, (bounce+180));

		hit_spark.speed = ((hit_spark.speed/2) - obj_astroid.speed) + obj_astroid.speed/0.5;

		

	}
	
	// destroys sparks that hit cubes
	instance_destroy();

}








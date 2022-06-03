/// @destroys sparks and creates blue ones
// You can write your code in this editor

with(other){

	repeat(8){
	
		var hit_spark = instance_create_layer(x, y, "Instances", obj_spark_red);
	
		hit_spark.sprite_index = spr_spark_blue;
		
	
		hit_spark.image_xscale = image_xscale;
		hit_spark.image_yscale = image_yscale;
	
		// sets image alpha to match current spark
		hit_spark.image_alpha = image_alpha;

	
	
		var bounce = obj_good_astroid.direction - direction;

		hit_spark.direction = irandom_range(bounce, (bounce+180));

		hit_spark.speed = ((hit_spark.speed/2) - obj_good_astroid.speed) + obj_good_astroid.speed/0.5;

		

	}



	// destroys sparks that hit cubes
	instance_destroy();
}



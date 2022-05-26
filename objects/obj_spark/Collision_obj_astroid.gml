
repeat(5){
	
	var hit_spark = instance_create_layer(x, y, "Instances", obj_spark_red);
	
	// sets image alpha to match current spark
	hit_spark.image_alpha = image_alpha;

	
	with(other){
	
		var bounce = direction - obj_spark.direction;

		hit_spark.direction = irandom_range(bounce, (bounce+180));

		hit_spark.speed = (hit_spark.speed - speed) + speed/0.5;

	}

}



// destroys sparks that hit cubes
instance_destroy();




with(obj_game){
	
	if (cube_shards < 100){
	
		cube_shards += 1;
	}	;
	
	score += cube_shards * 100;
	
	cube_shards = 0;
	
}

instance_create_layer(x,y,"Instances", obj_wave);

// destroys ship
instance_destroy();

with(other){
	
	hp = 0;

}


audio_play_sound(snd_shipBoom, 1, false);



//TODO - replace with player dust
repeat(20){
	instance_create_layer(x,y, "Instances", obj_ship_dust);
	
}


	

/// @description Event for when player object is destroyed

with(obj_game){
	
	score += cube_shards * 100;
	
	cube_shards = 0;
	
}

audio_play_sound(snd_shipBoom, 1, false);


// Player explode effect
repeat(20){
	instance_create_layer(x,y, "Instances", obj_ship_dust);
	
}
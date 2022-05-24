instance_destroy();
audio_play_sound(snd_shipBoom, 1, false);

// lives reduced at room restart

with(obj_game){
	
	alarm[1] = room_speed;

}


//TODO - replace with player dust
repeat(20){
	instance_create_layer(x,y, "Instances", obj_ship_dust);
	
}

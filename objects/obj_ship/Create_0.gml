counter = 0;

prev_thruster_left = "NA";
prev_thruster_right = "NA";

audio_play_sound(snd_reborn, 1, false);

repeat(20){
	instance_create_layer(x,y, "Instances", obj_ship_dust);
	
}
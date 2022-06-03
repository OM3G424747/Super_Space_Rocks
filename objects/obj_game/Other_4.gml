
if (room == rm_game){
	
	spawn_off_cam(obj_astroid, 10);
	
	audio_stop_sound(snd_menu);
	

	// triggers alarm to spawn more asteroids
	alarm[0] = 60;


} else if (room == rm_gameover){
	
	hint1 = "Blue rocks contain pure energy that can rebuild anything";
	hint2 = "Try taking care of the smaller rocks first";
	hint3 = "Try shooting faster to clear clusters of small rocks";
	hint4 = "Charged shots are more effective against big rocks";
	select_hint = choose(hint1);

} else if (room == rm_start){
	
	audio_play_sound(snd_menu, 1, true);


}  
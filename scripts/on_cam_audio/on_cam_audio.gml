// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@description plays audio only on cam and arround the edges of the cam
///@arg obj_playing_sound
///@arg sound_to_play

function on_cam_audio(obj_x, obj_y, sound_to_play){

		
	if(point_in_rectangle(
		obj_x, 
		obj_y, 
		global.cam_x - 32, 
		global.cam_y - 32,
		global.cam_x + (global.cam_width*2) + 32,
		global.cam_y + (global.cam_height*2) + 32 )){
			
		
		// plays audio	
		audio_play_sound(sound_to_play, 5, false);

	}
		
}
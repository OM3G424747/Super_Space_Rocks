// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@description
///@arg obj
///@arg number_to_spawn

function spawn_off_cam(obj, number_to_spawn){
	
	
	repeat(number_to_spawn){
		var xx = irandom_range(0, room_width);
		var yy = irandom_range(0, room_height);
		
	
		
		while(point_in_rectangle(
			xx, 
			yy, 
			global.cam_x - global.cam_width*2, 
			global.cam_y - global.cam_height*2,
			global.cam_x + global.cam_width*2,
			global.cam_y + global.cam_height*2 )){
			
			var xx = irandom_range(0, room_width);
			var yy = irandom_range(0, room_height);	
		
		}
		
		//spawns in asteroid
		instance_create_layer(xx, yy, "Instances", obj);
	}
	
}
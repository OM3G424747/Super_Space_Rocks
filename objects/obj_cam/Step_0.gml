/// @description follow player OBJ

if(instance_exists(target)){
	global.cam_x = target.x - (global.cam_width);
	global.cam_y = target.y - (global.cam_height);
	
	global.cam_x = clamp(global.cam_x, 0, room_width-(global.cam_width*2));
	global.cam_y = clamp(global.cam_y, 0, room_height-(global.cam_height*2));
}

camera_set_view_pos(view_camera[0], global.cam_x, global.cam_y);


layer_x(gb_par_0, global.cam_x*0.92);
layer_y(gb_par_0, global.cam_y*0.92);

layer_x(gb_par_1, global.cam_x*0.85);
layer_y(gb_par_1, global.cam_y*0.85);

layer_x(gb_par_2, global.cam_x*0.8);
layer_y(gb_par_2, global.cam_y*0.8);

layer_x(gb_gra, global.cam_x*0.92);
layer_y(gb_gra, global.cam_y*0.92);
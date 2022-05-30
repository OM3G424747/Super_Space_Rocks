/// @description Camera Setup

// camera
global.cam_x = 0;
global.cam_y = 0;

target = obj_ship;
// 16 by 9 ratio for cam
global.cam_width = 400;
global.cam_height = 225;

view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view_camera[0], global.cam_width*2, global.cam_height*2);

// display
display_scale = 3;

display_width = global.cam_width * display_scale;
display_height = global.cam_height * display_scale;

//window_set_size(display_width, display_height);
surface_resize(application_surface, display_width, display_height);


// get's user screen resolution
w = display_get_width() +20;
h = display_get_height();

// set's to fullscreen with boarders
window_set_size(w,h);

//sets boarder colour to grey
window_set_colour(c_grey);

// centers screen after 1 frame
alarm[0] = 1;

//GUI
display_set_gui_size(global.cam_width*2, global.cam_height*2);
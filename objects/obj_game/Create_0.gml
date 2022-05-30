score = 0;
lives = 3;
cube_shards = 0;

score_to_win = 40000;

draw_set_font(fnt_text);

// get's user screen resolution
w = display_get_width() +20;
h = display_get_height();

// set's to fullscreen with boarders
window_set_size(w,h);

//sets boarder colour to grey
window_set_colour(c_grey);

// used to multiply the spawn rate of cubes
time_multiplier = 5; 

// counts frames to increment multiplier 
counter = 0;
score = 0;
lives = 3;

draw_set_font(fnt_text);

// get's user screen resolution
w = display_get_width() +20;
h = display_get_height();

// set's to fullscreen with boarders
window_set_size(w,h);

//sets boarder colour to grey
window_set_colour(c_grey);

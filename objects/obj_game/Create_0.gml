// selects random seed 
randomize();

score = 0;
lives = 3;
cube_shards = 0;

score_to_win = 50000;

draw_set_font(fnt_text);


// used to multiply the spawn rate of cubes
time_multiplier = 5; 

// counts frames to increment multiplier 
counter = 0;
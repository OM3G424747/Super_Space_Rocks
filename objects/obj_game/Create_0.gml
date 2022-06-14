// selects random seed 
randomize();

score = 0;
lives = 3;
cube_shards = 0;

// counts number of enemy ships to avoid creating too many
ship_count = 0;

score_to_win = 50000;

draw_set_font(fnt_text);


// used to multiply the spawn rate of cubes
time_multiplier = 5; 

// counts frames to increment multiplier 
counter = 0;

// set's factions for ships

enum factions {
	none,
	good,
	bad

}
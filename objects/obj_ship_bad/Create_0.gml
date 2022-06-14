/// @description Creation attributes of bad ship
 
 // flashes the ship to indicate it's damaged
 is_damaged = false;
 
 dmg_flash_counter = 0;

// applied bad faction properties to ship
event_inherited();

direction = irandom_range(0,359);
image_angle = direction;

// sets if the unit is agro towards the player
is_agro = false;

// sets to true if the ship is closing distance on the player
is_closing_dist = false;

// sets target range
target_range = 250;

// sets dir where to aim the ship
aim_selection = 0;

// sets counter for delaying fire on player
counter = 0;

// sets variables for thruster animation
thrust_counter = 0;

prev_thruster = "NA";

// sets number of hits before destroyed by player
hp = 8;

image_xscale += 0.5;
image_yscale += 0.5;
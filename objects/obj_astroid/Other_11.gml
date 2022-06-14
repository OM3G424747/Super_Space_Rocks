/// @description hit by player

hp = 0;

// updates player's shards
with(obj_game){
	
	if (cube_shards < 100){
	
		// adds new shard to player's score
		cube_shards += 1;
				
		// prevents shards from going over 100
		if(cube_shards > 100){
			cube_shards = 100;
		}
	}	
}
	 
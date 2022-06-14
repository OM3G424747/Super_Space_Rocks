/// @description Reduce HP by 1 player

// hp reduced by bullet steps

// sets's flash animation for damage
is_damaged = true;

is_agro = true;

on_cam_audio(x, y, snd_shipDamage_bad);

// destroys ship if no hp is left
if(hp <= 0){
	instance_destroy();
	
	// updates player's shards
	with(obj_game){
		ship_count -= 1;
		if (cube_shards < 100){
	
			// adds new shard to player's score
			cube_shards += 15;
				
			// prevents shards from going over 100
			if(cube_shards > 100){
				cube_shards = 100;
			}
		}	
	}
}




	 
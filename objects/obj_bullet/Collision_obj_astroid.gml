
charge -= 1;

with(obj_game){
	
	if (cube_shards < 100){
	
		cube_shards += 1;
	}	
}

// if max charge is depleted, the bullet is destroyed
if (charge <= 0){
	
	instance_destroy();

}


// set's astroid health to 0 to destroy it 
with(other){
	
	hp = 0;
	
}

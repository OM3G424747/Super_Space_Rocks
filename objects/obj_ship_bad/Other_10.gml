/// @description Reduce HP by NON player

// reduces ship hp
hp -= 1;

// sets's flash animation for damage
is_damaged = true;

// destroys ship if no hp is left
if(hp <= 0){
	instance_destroy();
	
	with(obj_game){
		ship_count -= 1;
	}
}


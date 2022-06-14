/// @description Take damage event

hp -= 1;

if (hp <= 0 ){

	instance_destroy();

}



// lives reduced at room restart
with(obj_game){
	
	alarm[1] = room_speed*2;
}





// TODO - update to rather push ship and damage it


// sets's flash animation for damage
is_damaged = true;

with (other){
	hp = 0;

	other.direction -= direction; 
	speed -= other.speed;
	other.speed += speed*0.5;
	
		

}






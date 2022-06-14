// sets's flash animation for damage
is_damaged = true;

hp -= 1;

with(other){
	
	hp = 0;
	
	other.direction -= direction; 
	speed -= other.speed;
	other.speed += speed*0.5;

}







	

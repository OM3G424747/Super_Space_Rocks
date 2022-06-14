/// @description resets to game room
// You can write your code in this editor


if (lives >= 1){
	
	time_multiplier = 5;
	cube_shards = 0;

	room_goto(rm_game);


} else {
	
	room_goto(rm_gameover);

}
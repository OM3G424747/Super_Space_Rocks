/// @description effects for when enemy ship is destroyed
// You can write your code in this editor


on_cam_audio(x, y, snd_bad_shipBoom);


// uses player dust with red image blend
repeat(20){
	var bad_dust = instance_create_layer(x,y, "Instances", obj_ship_dust);
	
	bad_dust.sprite_index = spr_bullet_bad;
	
	bad_dust.image_xscale += 0.5;
	bad_dust.image_yscale += 0.5;
	
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@description creates a bullet
///@arg dir
///@arg bullet_speed
///@arg bullet_charge
///@arg bullet_faction

function create_bullet(dir, bullet_speed, bullet_charge, bullet_faction){
	
	var inst = instance_create_layer(x,y, "Instances", obj_bullet);
	
	inst.faction = bullet_faction;
	
	if (inst.faction == factions.bad){
	
		inst.sprite_index = spr_bullet_bad;
		
	}
	
	inst.direction = dir;
	inst.image_angle = dir;
	
	inst.charge = bullet_charge;
	inst.speed = bullet_speed;
	
	// spawns large bullet for more than 1 charge 
	if(bullet_charge == 8){
	
		audio_play_sound(snd_zap, 5, false);
		audio_play_sound(snd_zap, 8, false);
		audio_play_sound(snd_zap2, 8, false);
		audio_play_sound(snd_zap2, 8, false);
		
	
		// selects larger sprite with more rounded edges
		inst.image_index = spr_bullet_lrg
		// makes sprite slightly larger
		inst.image_xscale +=2;
		inst.image_yscale +=2;
	

	// spawns medium bullet for less than 1 second charge 
	} else if (bullet_charge == 4){
	
		audio_play_sound(snd_zap, 8, false);
		audio_play_sound(snd_zap, 8, false);
	
	    // selects larger sprite with more rounded edges
		inst.image_index = spr_bullet_lrg
		// makes sprite slightly larger
	
		inst.image_xscale +=1;
		inst.image_yscale +=1;
	
	
	// basic bullet with single chrage for 1 click 
	} else if (bullet_charge == 1){
	

		
		

	}
	
}
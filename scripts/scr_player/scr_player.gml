function scr_player(){
#region Movimentação 
	//Movimento jogador
	up = keyboard_check(ord("W")) or keyboard_check(vk_up)
	down = keyboard_check(ord("S")) or keyboard_check(vk_down)
	left = keyboard_check(ord("A")) or keyboard_check(vk_left)
	right = keyboard_check(ord("D")) or keyboard_check(vk_right)
	
	var _xx = right - left;
	var _yy = down - up;
	
	image_angle = point_direction(x, y, mouse_x, mouse_y)
#endregion	

#region Vida
	if global.life < 1 {
		game_restart();
	}
#endregion

#region colisão
	//Verificar se ta movendo
	if _xx != 0 or _yy != 0 {
		//Mudar as sprites
		//sprite_index = spr_player_walking;
		dir = point_direction(x, y, x + _xx, y + _yy);
		hspd = lengthdir_x(spd, dir);
		vspd = lengthdir_y(spd, dir);
	
	//Colisão X
	if(place_meeting(x + hspd, y, obj_wall)){
		while(!place_meeting(x + sign(hspd), y, obj_wall)){
			x = x + sign(hspd);
		}
		hspd = 0;	
	}
	
	//Colisão Y
	if(place_meeting(x, y + vspd, obj_wall)){
		while(!place_meeting(x, y + sign(vspd), obj_wall)){
			y = y + sign(vspd);
		}
		vspd = 0;	
	}
	
		x += hspd;
		y += vspd;
	}else{
		//sprite_index = spr_player_idle;	
	}
#endregion
	
#region dialogo
	//Diálogo
	if distance_to_object(obj_par_npc) <= 10{
		if keyboard_check_pressed(ord("F")){
			var _npc = instance_nearest(x, y, obj_par_npc);
			var _dialogo = instance_create_layer(x, y, "Dialogo", obj_dialogo);
			_dialogo.npc_nome = _npc.nome;
		}
	}
#endregion

#region arma

//lançar

if (mouse_check_button_released(mb_right) and weapon_sprite != spr_empty ) {
	var throwWeapon = instance_create_layer(x,y, "Gun", obj_weapon_throw);
	throwWeapon.direction = image_angle;
	throwWeapon.speed = random_range(7,10);
	throwWeapon.sprite_index = spr_pistol;
	throwWeapon.ammoTrhow = ammoPlayer;
	
	switch(weapon) {
		case "pistol": throwWeapon.sprite_index = spr_pistol; break;
		case "shotgun": throwWeapon.sprite_index = spr_shotgun; break;
	
	}
	weapon = "";
	weapon_sprite = spr_empty
	
	ammoPlayer = 0;
}
//tiro
if (mouse_check_button(mb_left) and ammoPlayer >0) {
	
	shoot_timer--;
	if(shoot_timer <= 0) {
		
		var shotX = 0;
		var shotY = 0;
		
	switch(weapon){
		
		case "pistol":
		
		shotX = x + lengthdir_x(12, image_angle-25);
		shotY = y + lengthdir_y(12, image_angle-25);
		
		var tiro = instance_create_layer(shotX,shotY, "Gun", obj_tiro);
		tiro.direction = image_angle + random_range( -obj_control.spread_pistol, obj_control.spread_pistol);
		tiro.speed = obj_control.shotSpeed_pistol;
		tiro.friction = obj_control.friction_pistol;
		tiro.damage = obj_control.damage_pistol;
			shoot_timer = obj_control.shot_timer_pistol;
			ammoPlayer -= 1;
		break;
		
		case "shotgun":
		
		shotX = x + lengthdir_x(16, image_angle-22);
		shotY = y + lengthdir_y(16, image_angle-22);
		
		var tiro = instance_create_layer(shotX,shotY, "Gun", obj_tiro);
		tiro.direction = image_angle + random_range( -obj_control.spread_shotgun, obj_control.spread_shotgun);
		tiro.speed = obj_control.shotSpeed_shotgun;
		tiro.friction = obj_control.friction_shotgun;
		tiro.damage = obj_control.damage_shotgun;
			shoot_timer = obj_control.shot_timer_shotgun;
			ammoPlayer--;
		break;
		}
	}
}
#endregion
}
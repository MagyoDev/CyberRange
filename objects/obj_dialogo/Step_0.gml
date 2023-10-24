if inicializar == false{
	scr_dialogo();
	inicializar = true;
}


if qntd_caracteres < string_length(texto_grid[# Infos.Texto, pagina]){
	if keyboard_check_pressed(ord("F")){
		qntd_caracteres = string_length(texto_grid[# Infos.Texto, pagina]);
		}
	}else{
		if pagina < ds_grid_height(texto_grid) -1 {
			if keyboard_check_pressed(ord("F")){
				alarm[0] = 1;
				qntd_caracteres = 0;
				pagina++;	
			}
		}else{
		if op_num != 0{
			op_draw = true;
		}else{
			if keyboard_check_pressed(ord("F")){
			instance_destroy();
			}
		}
	}
}
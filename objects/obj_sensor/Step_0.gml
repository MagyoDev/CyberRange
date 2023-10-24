var player = place_meeting(x, y, obj_player);

var passar = keyboard_check_released(ord("E"));

if (player && passar) {
	var tran = instance_create_layer(0, 0, layer, obj_trasicao);
	tran.destino = destino;
	tran.destino_x = destino_x;
	tran.destino_y = destino_y;
}
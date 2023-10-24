//Controles
up = -1;
down = -1;
left = -1;
right = -1;

//Movimento
hspd = -1;
vspd = -1;
spd = 2;
dir = -1;

//Scripts
estado_player = scr_player;

//Ocultando o ponteiro do mouse
window_set_cursor(cr_none)

//Vida
global.life = 3;

weapon_sprite = spr_empty;
weapon = "";

ammoPlayer = 0;

shoot_timer = 20;
draw_self()

draw_sprite(spr_mira, 0, mouse_x, mouse_y )

draw_sprite_ext(weapon_sprite, image_index, x,y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

//debug mode
if (obj_control.debug == true ) {
	var text_1 = "Ammo: " + string(ammoPlayer);
	var text_2 = "Weapon: " + string(weapon);
	draw_text_transformed(x,y-40, text_1, 1,1,0);
	draw_text_transformed(x,y-60, text_2, 1,1,0);
}

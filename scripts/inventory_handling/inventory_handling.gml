function draw_inve(x1, y1, x2, y2){
	draw_set_colour(c_black);
	draw_set_alpha(0.7);
	draw_rectangle(x1, y1, x2, y2 - 30, false);
	draw_set_alpha(1);
}

function handle_inve(intx, inty){
	draw_inve(
	camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - intx,
	camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - inty, 
	camera_get_view_x(view_camera[0]) + intx, 
	camera_get_view_y(view_camera[0]) + inty);
}

function open_inve(){
	if keyboard_check_pressed(ord("P")) == 1
	{
		inve_status = 0 - inve_status;
	}
}

function place_powers(alterX, alterY){
	for (var i = 0; i < array_length(global.inventory); i += 1;)
	{
		placeX = camera_get_view_x(view_camera[0])
		placeY = camera_get_view_y(view_camera[0])
		if i == 0
		{
			draw_sprite_ext(sHints, 0, placeX + alterX - 5.25 , placeY + alterY - 5.25, 3.3, 3.3, 0, c_white, 1);
			draw_sprite_ext(sHints, 1, placeX + alterX + 30, placeY + alterY + 120, 1.5, 1.5, 0, c_white, 1);
			draw_sprite_ext(sCollectables, global.inventory[i], placeX + alterX, placeY + alterY, 3, 3, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(sCollectables, global.inventory[i], placeX + alterX + 150 * i, placeY + alterY, 3, 3, 0, c_white, 1);
		}
	}
}
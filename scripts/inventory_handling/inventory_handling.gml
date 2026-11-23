function draw_inve(x1, y1, x2, y2){
	draw_set_colour(#d6a37e);
	draw_set_alpha(0.7);
	draw_rectangle(x1, y1, x2, y2 - 30, false);
	draw_set_alpha(1);
}

function handle_inve(int){
	draw_inve(
	camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - int,
	camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - int, 
	camera_get_view_x(view_camera[0]) + int, 
	camera_get_view_y(view_camera[0]) + int);
}

function open_inve(){
	if keyboard_check_pressed(ord("E")) == 1
	{
		inve_status = 0 - inve_status;
	}
}
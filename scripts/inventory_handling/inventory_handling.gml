function draw_inve(x1, y1, x2, y2){
	draw_set_colour(c_black);
	draw_set_alpha(0.7);
	draw_rectangle(x1, y1, x2, y2 - 30, false);
	draw_set_alpha(1);
}

function handle_inve(intx, inty){
	vx = camera_get_view_x(view_camera[0])
	vy = camera_get_view_y(view_camera[0])
	vw = camera_get_view_width(view_camera[0])
	vh = camera_get_view_height(view_camera[0])
	draw_inve(vx + vw - intx, vy + vh - inty, vx + intx, vy + inty);
	if help == 1 
	{
		draw_set_font(ArcadeClassic);
		draw_text(vx + intx + 50 , vy + inty + 100, "To  use  this  powerup  go  up  against  a  wall")
		draw_text(vx + intx + 50 , vy + inty + 200, "and  press  E  to  use")
		draw_text(vx + intx + 50 , vy + inty + 400, "Press  P  to  continue!")
	}
	else if help == 2
	{
		draw_set_font(ArcadeClassic);
		draw_text(vx + intx + 50 , vy + inty + 100, "Press  E  to  dash")
		draw_text(vx + intx + 50 , vy + inty + 400, "Press  P  to  continue")
	}
	else if help == 3
	{
		draw_set_font(ArcadeClassic);
		draw_text(vx + intx + 50 , vy + inty + 100, "Make  your  way  to  the  purple  bar!")
		draw_text(vx + intx + 50 , vy + inty + 200, "its  in  the  top   right   corner")
		draw_text(vx + intx + 50 , vy + inty + 300, "You  might  need  multiple  attempts  at")
		draw_text(vx + intx + 50 , vy + inty + 400, "each  level  press  r  if  you  get  stuck")
		draw_text(vx + intx + 50 , vy + inty + 550, "Press  P  to  start!")
	}
}

function open_inve(){
	if keyboard_check_pressed(ord("P")) == 1
	{
		inve_status = 0 - inve_status;
		pause += 1
		if pause > 1{pause = 0}
	}
}

function place_powers(alterX, alterY){
	for (var i = 0; i < array_length(global.inventory); i += 1;)
	{
		placeX = camera_get_view_x(view_camera[0])
		placeY = camera_get_view_y(view_camera[0])
		if i == 0
		{
			draw_sprite_ext(sHints, 0, placeX + alterX - 7 , placeY + alterY - 7, 4.4, 4.4, 0, c_white, 1);
			draw_sprite_ext(sHints, 1, placeX + alterX + 40, placeY + alterY + 160, 2, 2, 0, c_white, 1);
			draw_sprite_ext(sCollectables, global.inventory[i], placeX + alterX, placeY + alterY, 4, 4, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(sCollectables, global.inventory[i], placeX + alterX + 200 * i, placeY + alterY, 4, 4, 0, c_white, 1);
		}
	}
}
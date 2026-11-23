depth = 200;
draw_self();
draw_sprite_ext(sPlayer, floor(frame), x, y, image_point(), 6, 0, c_white, 1);
if inve_status == 1 
{
	depth = -1000;
	handle_inve(50)
}
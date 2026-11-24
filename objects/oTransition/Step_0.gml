x = camera_get_view_x(view_camera[0]);
y =	camera_get_view_y(view_camera[0]);
if keyboard_check_pressed(ord("R"))
{
	trans = 2
}
if trans == 0 exit

spe += 0.01;
if phase == 0
{
	scale += spe;
	if scale >= 50
	{
		scale = 0.7;
		spe = 0;
		phase = 1;
		if trans == 1
		{

			global.inventory_reset = variable_clone(global.inventory)


			room_goto_next();
		}
		else
		{	
			global.inventory = variable_clone(global.inventory_reset)
			room_restart();
		}
	}
}
else
	{
		scale -= spe;
		if scale <= 0
		{
			scale = 0;
			spe = 0;
			phase =0;
			trans = 0;
		}
	}

		

image_xscale = scale;
image_yscale = scale;
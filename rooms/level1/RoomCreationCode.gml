view_enabled = true;
view_visible[0] = true;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 1536;
view_hport[0] = 1024;
		
view_camera[0] = camera_create_view(0,0, view_wport[0], view_hport[0], 0);

vw = camera_get_view_width(view_camera[0]);
vh = camera_get_view_height(view_camera[0]);
	camera_set_view_pos(view_camera[0],
	    clamp(oPlayer.x - vw / 2, 0, max(0, room_width - vw)),
	    clamp(oPlayer.y - vh / 2, 0, max(0, room_height - vh)));
		
global.inventory = [];
global.inventory_reset = global.inventory;
global.discs = []
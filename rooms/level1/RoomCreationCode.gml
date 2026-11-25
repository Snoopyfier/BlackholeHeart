view_enabled = true;
view_visible[0] = true;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 3072;
view_hport[0] = 2048;
		
view_camera[0] = camera_create_view(0,0, view_wport[0], view_hport[0], 0);

_bw = browser_width;
_bh = browser_height;
_aspect = _bw / _bh;
_base_w = 640; // Your base game width
_base_h = 360; // Your base game height
_base_aspect = _base_w / _base_h;

if (_bw / _bh > _base_aspect) {
    // Scale by height
    window_set_size(_base_w * (_bh / _base_h), _bh);
} else {
    // Scale by width
    window_set_size(_bw, _base_h * (_bw / _base_w));
}

window_center();
surface_resize(application_surface, window_get_width(), window_get_height());


vw = camera_get_view_width(view_camera[0]);
vh = camera_get_view_height(view_camera[0]);
	camera_set_view_pos(view_camera[0],
	    clamp(oPlayer.x - vw / 2, 0, max(0, room_width - vw)),
	    clamp(oPlayer.y - vh / 2, 0, max(0, room_height - vh)));
		
global.inventory = [];
global.inventory_reset = global.inventory;
global.discs = []

oPlayer.inve_status = 1;
oPlayer.help = 3;
oPlayer.pause = 1
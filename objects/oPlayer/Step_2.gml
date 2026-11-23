//Camera centring
viewH = camera_get_view_height(view_camera[0]);
viewW = camera_get_view_width(view_camera[0]);

targetX = clamp(x - viewW / 2, 0, max(0, room_width - viewW))
targetY = clamp(y - viewH / 2, 0, max(0, room_height - viewH))

placeX = lerp(camera_get_view_x(view_camera[0]), targetX, camSpeed)
placeY = lerp(camera_get_view_y(view_camera[0]), targetY, camSpeed)

camera_set_view_pos(view_camera[0], round(placeX), round(placeY))
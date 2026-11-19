move();
image_point();
image_index = frame; //after all functions
if keyboard_check_pressed(ord("S")) == 1{grav_direction += 90; if grav_direction > 270 {grav_direction = 0}}
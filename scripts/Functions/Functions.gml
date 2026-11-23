// FUNCTIONS WITHIN THE MOVEMENT FUNCTIONS
	
	//COLLISION DETECTIONS
function colliding(_x, _y) {
	for (var i = 0; i < array_length(collidables); i += 1)
	{
		if place_meeting(_x, _y, collidables[i])
		{
			return 1;
		}
		else if i == array_length(collidables) - 1
		{
			return 0;
		}
	}
}

function collide_reset(rep){
	if colliding(x, y) == 0 {return 0;}
	for (var i = 1; i < rep; i += 1;){
		if colliding(x + i, y) == 0{x += i; return 0;}
		if colliding(x - i, y) == 0{x -= i; return 0;}
		if colliding(x, y + i) == 0{y += i; return 0;}
		if colliding(x, y - i) == 0{y -= i; return 1;}
	}

}
	
	//IMAGE ANGLING
/*TO BE FIXED
function angle_for_grav(){ 
	if grav_direction == 0{return 180;}
	if grav_direction == 90{return 90;}
	if grav_direction == 180{return 270;}
	if grav_direction == 270{return 0;}
}
*/

	//KEYBINDS AND KEYPRESSING
function call_key(key) {
	if key == "up" {return keybind[0]}
	if key == "left" {return keybind[1]}
	if key == "down" {return keybind[2]}
	if key == "right" {return keybind[3]}
	if key == "e" {return keybind[4]}
	if key == "q" {return keybind[5]}
}


function key_press(key){
	return keyboard_check(ord(call_key(key)))
}
	
	//MOVEMENT FUNCTIONS
function hspe(_speed){
	return (key_press("right") - key_press("left")) * _speed
}

function vspe(_speed){
	if air < 4
	{
		return  (0 - key_press("up")) * _speed;
	}
	return 0;
}

function calres(){
	if air > 4 {return air_resistance;}
	else {return resistance;}
}



// FUNCTIONS FOR MOVEMENT

function move(){
	
	//Preset speed
	if grav_direction == 270 {xspeed += hspe(smulti); xspeed *= calres(); yspeed += vspe(jump) + grav;} //Down
	if grav_direction == 90 {xspeed -= hspe(smulti); xspeed *= calres(); yspeed -= vspe(jump) + grav;} //Up
	if grav_direction == 0 {yspeed -= hspe(smulti); yspeed *= calres(); xspeed -= vspe(jump) - grav;} //Right
	if grav_direction == 180 {yspeed += hspe(smulti); yspeed *= calres(); xspeed += vspe(jump) - grav;} //Left
	
	//Powerup Check
	call_powerup(-1);
	
	//Collision check & Movement
	temp = abs(xspeed) + abs(yspeed);
	repeat temp
	{
		if colliding(x + xspeed / temp, y) == 0 {x += xspeed / temp;}
		else {xspeed = 0;}
		
		if colliding(x, y + yspeed / temp) == 0 {y += yspeed / temp;}
		else {yspeed = 0;}
	}
	
	//Reset jump indicator
	if grav_direction == 270 and colliding(x, y + 1) {air = 0} else {air += 1}
	if grav_direction == 90 and colliding(x, y - 1) {air = 0} else {air += 1}
	if grav_direction == 180 and colliding(x - 1, y) {air = 0} else {air += 1}
	if grav_direction == 0 and colliding(x + 1, y) {air = 0} else {air += 1}
}


// FUNCTIONS FOR DRAWING

function image_point(){
	if xspeed > 0 {prev_angle = 6;}
	else if xspeed < 0 {prev_angle = -6;}
	return prev_angle;
}

//ROOM FUNCTIONS
function move_room()
{
	if room ==  level1 and x > room_width{room_goto_next()}
}

//POWERUP FUNCTIONS
function call_powerup(item){
	if item == -1
	{
		if influence == 0
		{
			if colliding(x + image_point() / 6, y)
			{
				yspeed = set_yspeed;
				xspeed = set_xspeed;
			}
			else{influence = -1; array_delete(global.inventory, 0, 1);}
		}
		if influence == 1
		{
			yspeed = set_yspeed;
			xspeed = set_xspeed;
			if colliding(x + image_point() / 6, y) == 1{influence = -1}
		}
	}
	if item == 0 
	{
		if colliding(x + image_point() / 6, y)
		{
			set_xspeed = 0;
			set_yspeed = -30;
			influence = 0;
		}
	}
	if item == 1 
	{
		set_xspeed = 10 * image_point();
		set_yspeed = 0;
		influence = 1;
		array_delete(global.inventory, 0, 1);
	}
}

function use_powerup(){
	if keyboard_check_pressed(ord("E")) == 1 and array_length(global.inventory) > 0
	{
		call_powerup(global.inventory[0])
	}
}
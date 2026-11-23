function variables(){
	//ANIMATION RESET
	frame = 1;
	image_index = frame;
	prev_angle = 0;
	
	//CAMERA
	camSpeed = 0.1;
	
	
	//MOVEMENT RESET
	xspeed = 0;
	yspeed = 0;
	grav = 0.5;	// base gravity for reset
	grav_direction = 270 // 0=Right, 90=Up, 180=Left, 270=Down
	smulti = 2.5;
	jump = 20;
	air = 4;
	resistance = 0.8;
	air_resistance = 0.82;
	targetX = x;
	targetY = y;
	//COLLECTABLES RESET
	
	//KEYBINDS
	keybind = [
	//MOVEMENT KEYS
	"W", "A", "S", "D",
	//ABILITY KEYS
	"E"
	]
	
	//OTHER
	collidables = [oColl_]
	
	//INVENTORY
	global.inventory = [];
	inve_status = -1;

}
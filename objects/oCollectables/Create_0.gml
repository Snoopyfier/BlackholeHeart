arget_item = ["wallride", "dash"];
collected = 0;
image_speed = 0;
image_alpha = 1;
initX = x;
initY = y;
dir = 1;


function add_item(){
	if place_meeting(x, y, oPlayer) and collected == 0 and array_length(global.inventory) < 6
	{
		array_push(global.inventory, image_index)
		collected = 1;
	}
}


function correct_alpha(){
	if image_alpha > 0 and collected == 1
	{
		image_alpha -= 0.1;
	}
}

function movement(range){
	if dir == 1{target = initY - range;}
	else{target = initY;}
	y += (target - y) / 20
	if abs(target - y) < 5 {dir = 0 - dir}
	
}
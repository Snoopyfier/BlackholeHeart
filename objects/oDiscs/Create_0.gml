initX = x;
initY = y;
dir = 1;
disc = -1;
function collect(){
	if place_meeting(x, y, oPlayer) == 1 
	{
		disc = image_index;
		image_alpha = 0;
	}
}

function movement(range){
	if dir == 1{target = initY - range;}
	else{target = initY;}
	y += (target - y) / 20
	if abs(target - y) < 5 {dir = 0 - dir}
	
}
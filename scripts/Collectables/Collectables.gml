//FUNCTIONS

function add_item(){
	if place_meeting(x, y, oPlayer) and collected == 0
	{
		array_push(global.inventory, target_item[image_index])
		collected = 1;
	}
}

function correct_alpha(){
	if image_alpha > 0 and collected == 1
	{
		image_alpha -= 0.1;
	}
}
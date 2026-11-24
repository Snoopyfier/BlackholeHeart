if place_meeting(x,y,oPlayer) == 1 and oDiscs.disc != -1
{
	array_push(global.discs, oDiscs.disc)
	oDiscs.disc = -1;
}
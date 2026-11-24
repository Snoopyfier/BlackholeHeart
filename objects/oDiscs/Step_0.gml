if array_contains(global.discs, image_index) == false
{
	collect()
}
else
{
	image_alpha = 0
}

movement(40)
show_debug_message(global.discs)
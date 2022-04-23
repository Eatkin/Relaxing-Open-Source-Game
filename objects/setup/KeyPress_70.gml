/// @description

if (!isBrowser() and keyboard_check(vk_control))	{
	var isFullscreen=window_get_fullscreen();
	window_set_fullscreen(isFullscreen^1);
}
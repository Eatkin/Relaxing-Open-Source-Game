function achievementIsComplete(argument0) {
	var achievement=argument0;

	if (global.achievementBitmasks&achievement==achievement)
		return true;
	
	return false;


}

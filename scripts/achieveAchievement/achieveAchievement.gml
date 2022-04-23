function achieveAchievement(argument0) {
	var achievement=argument0;

	var queueNotification=false;

	//This means if the achievmeent isn't already unlocked it will pop up a notification
	//Well it will once I've defined the behaviour for displaying a notification at least
	if (global.achievementBitmasks&achievement!=achievement)
		queueNotification=true;

	global.achievementBitmasks|=achievement;

	//One thing - achievement buttons already exist, so need updating if we're on the menu
	if (instance_exists(par_achievementButton))
		with (par_achievementButton)
			completed=achievementIsComplete(power(2,myRef));
		
	if (queueNotification)	{
		//These are powers of 2 so let's make them not that
		//2^n=achievement =? log2(achievement)=n
		achievement=logn(2,achievement);
		var _text=global.achievementGrid[# Achievements.Name		, achievement];
		with (obj_notifications)	{
			ds_queue_enqueue(textQueue,_text);
			ds_queue_enqueue(typeQueue,Type.Achievement);
		}
	}

	saveGame();


}

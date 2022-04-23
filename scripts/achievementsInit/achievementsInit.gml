function achievementsInit() {
	global.achievementGrid=ds_grid_create(Achievements.Max,0);
	global.achievementBitmasks=0;

	addAchievement("60 WPM","Finish a text at a rate of 60 WPM",Stats.WPMMax);
	addAchievement("70 WPM","Finish a text at a rate of 70 WPM",Stats.WPMMax);
	addAchievement("80 WPM","Finish a text at a rate of 80 WPM",Stats.WPMMax);
	addAchievement("90 WPM","Finish a text at a rate of 90 WPM",Stats.WPMMax);
	addAchievement("100 WPM","Finish a text at a rate of 100 WPM",Stats.WPMMax);
	addAchievement("Cheater", "Finish a text at a rate of 500 WPM", Stats.WPMMax);

	addAchievement("100 Words", "Type out 100 words", Stats.TotalWordsTyped);
	addAchievement("1000 Words", "Type out 1000 words", Stats.TotalWordsTyped);
	addAchievement("10000 Words", "Type out 10000 words", Stats.TotalWordsTyped);

	addAchievement("100000 Characters", "Type out 100000 characters", Stats.TotalLettersTyped);

	addAchievement("100 Coins", "Earn 100 coins in total", Stats.TotalCoins);
	addAchievement("1000 Coins", "Earn 1000 coins in total", Stats.TotalCoins);

	addAchievement("First Game", "Type out your first passage", Stats.TotalGames);
	addAchievement("10 Games", "Type out 10 passages", Stats.TotalGames);
	addAchievement("20 Games", "Type out 20 passages", Stats.TotalGames);

	addAchievement("Shopper", "Buy something from the shop",	Stats.ShopItemsPurchased);


	/*
	Need to add in the bitmasks to check if achievements have been completed
	the menu will pull up a bunch of buttons
	Clicking will show description of achievement + progress
	That means this probably needs to be a grid
	*/


}

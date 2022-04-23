function statsUpdate(argument0, argument1, argument2, argument3, argument4, argument5) {
	var _wpm=argument0;
	var _accuracy=argument1;
	var _words=argument2;
	var _letters=argument3;
	var _mistakes=argument4;
	var _totalScore=argument5;

	//Manipulate totalScore as required
	_totalScore=floor(_totalScore*0.1);

	var map=global.statsMap;

	var _games=ds_map_find_value(map,Stats.TotalGames)+1;
	ds_map_set(map,Stats.TotalGames,_games);

	//Deal with WPM stats
	//Max
	var _wpmMax=ds_map_find_value(map,Stats.WPMMax);
	ds_map_set(map,Stats.WPMMax,max(_wpm,_wpmMax));

	//Average
	var _wpmAvg=ds_map_find_value(map,Stats.WPMAverage);
	var newAvg=(_wpmAvg*(_games-1)+_wpm)/_games;
	ds_map_set(map,Stats.WPMAverage,newAvg);

	//Same with accuracy
	//Max
	var _accuracyMax=ds_map_find_value(map,Stats.AccuracyMax);
	ds_map_set(map,Stats.AccuracyMax,max(_accuracyMax,_accuracy));

	//Average
	var _accAvg=ds_map_find_value(map,Stats.AccuracyAverage);
	var newAvg=(_accAvg*(_games-1)+_accuracy)/_games;
	ds_map_set(map,Stats.AccuracyAverage,newAvg);

	//Update total words typed
	var _totalWords=ds_map_find_value(map,Stats.TotalWordsTyped);
	ds_map_set(map,Stats.TotalWordsTyped,_totalWords+_words);

	//Letters typed
	var _totalLetters=ds_map_find_value(map,Stats.TotalLettersTyped);
	ds_map_set(map,Stats.TotalLettersTyped,_totalLetters+_letters);

	//Total mistakes
	var _totalMistakes=ds_map_find_value(map,Stats.TotalMistakesMade);
	ds_map_set(map,Stats.TotalMistakesMade,_totalMistakes+_mistakes);

	//Coins
	var _coins=ds_map_find_value(map,Stats.TotalCoins);
	ds_map_set(map,Stats.TotalCoins,_coins+_totalScore);

	//Average
	var _coinsAvg=ds_map_find_value(map,Stats.AverageCoins);
	var newAvg=(_coinsAvg*(_games-1)+_totalScore)/_games;
	ds_map_set(map,Stats.AverageCoins,newAvg);

	//Now finally we create a new obj for level end
	var levelEnd=instance_create_layer(0,0,"hud",obj_levelEnd);
	levelEnd.WPM=_wpm;
	levelEnd.accuracy=_accuracy;
	levelEnd.mistakes=_mistakes;
	levelEnd.coinsEarned=_totalScore;
	levelEnd.newWPMRecord=(_wpm>_wpmMax)	?	true	:	false;


	//Set this up to CORRECTLY achieve the coin achievements
	_coins+=_totalScore;

	//Also set up achievements (sorry)
	//WPM achievements
	if (_wpm>=60)
		achieveAchievement(AchievementBitmasks.SixtyWPM);
	if (_wpm>=70)
		achieveAchievement(AchievementBitmasks.SeventyWPM);
	if (_wpm>=80)
		achieveAchievement(AchievementBitmasks.EightyWPM);
	if (_wpm>=90)
		achieveAchievement(AchievementBitmasks.NinetyWPM);
	if (_wpm>=100)
		achieveAchievement(AchievementBitmasks.HundredWPM);
	if (_wpm>=500)
		achieveAchievement(AchievementBitmasks.FiveHundredWPM);
	
	//Total words achievements
	if (_totalWords>=100)
		achieveAchievement(AchievementBitmasks.HundredWords);
	if (_totalWords>=1000)
		achieveAchievement(AchievementBitmasks.ThousandWords);
	if (_totalWords>=10000)
		achieveAchievement(AchievementBitmasks.TenThousandWords);

	//Total characters
	if (_totalLetters>=100000)
		achieveAchievement(AchievementBitmasks.LotsOfChars);
	
	//Coins
	if (_coins>=100)
		achieveAchievement(AchievementBitmasks.HundredCoins);
	if (_coins>=1000)
		achieveAchievement(AchievementBitmasks.ThousandCoins);
	
	//First game
	achieveAchievement(AchievementBitmasks.FirstGame);

	//10th, 20th games
	if (_games>=10)
		achieveAchievement(AchievementBitmasks.TenthGame);
	if (_games>=20)
		achieveAchievement(AchievementBitmasks.TwentiethGame);


}

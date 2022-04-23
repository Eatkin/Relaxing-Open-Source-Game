function statsInit() {
	//Setup a bunch of stats

	global.statsMap=ds_map_create();
	for (var i=Stats.TotalGames; i<Stats.Max; i+=1)
		ds_map_set(global.statsMap,i,0);
	
	//Coins
	global.coins=0;		//Obviously lol


}

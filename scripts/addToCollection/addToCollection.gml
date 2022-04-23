function addToCollection() {
	var grid=argument[0];
	var name=argument[1];
	var fpath=argument[2];
	var length=argument[3];

	//Convert to a string
	switch (length)	{
		case Length.Short:
			length="Short";
			break;
		case Length.Medium:
			length="Medium";
			break;
		case Length.Long:
			length="Long";
			break;
		case Length.VeryLong:
			length="Very Long";
			break;
		case Length.VeryVeryLong:
			length="Very, Very Long";
			break;
		case Length.Extreme:
			length="Extreme";
			break;
	}

	//REsize grid, then Add to the end
	var gridHeight=ds_grid_height(grid);
	ds_grid_resize(grid,LiteratureContent.Max,gridHeight+1);
	ds_grid_set(grid,LiteratureContent.Name,gridHeight,name);
	ds_grid_set(grid,LiteratureContent.Text,gridHeight,fpath);
	ds_grid_set(grid,LiteratureContent.Length,gridHeight,length);

	var unlocked=true;
	if (argument_count>4)
		unlocked=argument[4];
	
	//Add to the unlcokables and completion maps
	ds_map_add(global.unlockables,fpath,unlocked);
	ds_map_add(global.completion,fpath,false);


}

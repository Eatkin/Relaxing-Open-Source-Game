function createCollection(argument0) {
	//Adds a collection at the latest position in the collection array
	var num=array_length_1d(global.collection);

	//We have to declare as an array, so the first entry starts empty - adjust accordingly
	//No grid reference should ever be -1 so this should be safe
	if (num==1 and global.collection[0]==-1)
		num=0;
	
	var name=argument0;

	global.collection[num]=ds_grid_create(LiteratureContent.Max,0);

	//Add it to the library
	var libHeight=ds_grid_height(global.library);
	ds_grid_resize(global.library,Library.Max,libHeight+1);
	ds_grid_set(global.library,Library.SeriesName,libHeight,name);
	ds_grid_set(global.library,Library.GridReference,libHeight,global.collection[num]);

	return global.collection[num];


}

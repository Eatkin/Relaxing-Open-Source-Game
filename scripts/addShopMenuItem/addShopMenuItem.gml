function addShopMenuItem(argument0, argument1) {
	var name=argument0;
	var ref=argument1;

	var grid=global.shopContainer;

	var gHeight=ds_grid_height(grid);
	var gWidth=ds_grid_width(grid);

	ds_grid_resize(grid,gWidth,gHeight+1);

	ds_grid_set(grid,ShopContainer.Name,gHeight,name);
	ds_grid_set(grid,ShopContainer.Reference,gHeight,ref);


}

function addAchievement(argument0, argument1, argument2) {
	var name=argument0;
	var desc=argument1;
	var stat=argument2;

	var grid=global.achievementGrid;
	var gridH=ds_grid_height(grid);
	var gridW=ds_grid_width(grid);

	ds_grid_resize(grid,gridW,gridH+1);

	grid[# Achievements.Name		,gridH]=name;
	grid[# Achievements.Description	,gridH]=desc;
	grid[# Achievements.StatRef		,gridH]=stat;


}

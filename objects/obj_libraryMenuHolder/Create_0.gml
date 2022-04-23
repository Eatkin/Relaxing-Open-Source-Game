/// @description
	
active=true;
xx=0;
time=0;

//Reorganise coordinates
x=room_width;
xstart=x;
y=0;

direction=1;

//Setup holds all the data
//First define all the pages for scrolling etc
targetPage=1;
page=1;
pages=1;
scrolling=false;
scrollTimer=0;


child=0;
var grid=global.library;
var buttonXOffset=75;
var gridHeight=ds_grid_height(grid);
pages=ceil(gridHeight/4);				//Re-define pages
var numButtons=1;

//First create the load custom button at the top, then continue onwards
child[0]=instance_create_layer(x+buttonXOffset,y+24,layer,obj_loadCustom);

for (var i=1; i<=gridHeight; i+=1)	{
	var imod=i%4;
	var idiv=i div 4;
	yy=y+room_height*(idiv);
	
	var button=instance_create_layer(x+buttonXOffset,yy+24+53*imod,layer,par_libraryButton);
	button.seriesName=grid[# Library.SeriesName, i-1];
	button.gridRef=grid[# Library.GridReference, i-1];
	child[i]=button;
	
	//Now do the page up and down buttons
	if (pages>0 and imod==0)	{
		var padding=8+sprite_get_width(spr_UIButton);
		if (idiv<pages)	{
			//create down button
			var downB=instance_create_layer(x+room_width-padding,room_height*idiv-padding,layer,obj_downButton);
			downB.owner=id;
			child[gridHeight+numButtons]=downB
			numButtons+=1;
		}
		if (idiv>0)	{
			//create up button
			var upB=instance_create_layer(x+room_width-padding,room_height*idiv+padding-sprite_get_width(spr_UIButton),layer,obj_upButton);
			upB.owner=id;
			child[gridHeight+numButtons]=upB;
			numButtons+=1;
		}
	}
}

var backButton=instance_create_layer(x+8,room_height-8-sprite_get_height(spr_UIButton),layer,obj_backButton);
backButton.owner=object_index;
child[gridHeight+numButtons]=backButton;


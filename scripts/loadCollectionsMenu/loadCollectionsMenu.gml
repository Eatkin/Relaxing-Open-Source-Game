function loadCollectionsMenu() {
	var grid=gridRef;				//Declare as local to pass to setup
	var gridHeight=ds_grid_height(grid);

	//Blank child
	child=0;

	//Now loop through the grid to find all information needed
	var buttonXOffset=75;
	var yy=y;

	//Reset page number just incase
	page=1;
	//Define how many pages we have

	pages=ceil(gridHeight/4);
	var numButtons=0;
	for (var i=0; i<gridHeight; i+=1)	{
		var imod=i%4;
		var idiv=i div 4;
		yy=y+room_height*(idiv);
	
		var button=instance_create_layer(x+buttonXOffset,yy+24+53*(imod),layer,par_collectionButton);
		button.textName=grid[# LiteratureContent.Name, i];
		button.myFile=grid[# LiteratureContent.Text, i];
	
		//Find locked and completion status
		button.completed=textIsComplete(button.myFile);
		button.locked=!(textIsUnlocked(button.myFile));
		button.tooltip="Length: "+grid[# LiteratureContent.Length, i];
		child[i]=button;
	
		if (pages>0 and imod==0)	{
			var padding=8+sprite_get_width(spr_UIButton);
			if (idiv<pages)	{
				//create down button
				var downB=instance_create_layer(x+room_width-padding,room_height*idiv-padding,layer,obj_downButton);
				downB.owner=id;
				child[gridHeight+numButtons]=downB;
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

	loaded=true;


}

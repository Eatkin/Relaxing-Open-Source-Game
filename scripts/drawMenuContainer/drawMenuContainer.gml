function drawMenuContainer(argument0, argument1) {
	//This draw a container with the specificed parameters

	var _hrep=argument0;
	var _vrep=argument1;

	//We can fill in sprites and offsets here
	var spr=spr_UI9slice;

	for (var i=0; i<_hrep; i+=1)
		for (var j=0; j<_vrep; j+=1)	{
			var tile=0;
			//Tile to the right
			if (i<hrepeats-1)
				tile=tile|2;
			//Tile to the left
			if (i>0)
				tile=tile|8;
			//Tile below
			if (j<vrepeats-1)
				tile=tile|4;
			//Tile above
			if (j>0)
				tile=tile|1;
			
			draw_sprite_part(spr,0,tile*16,16*global.UIOffset,16,16,x+i*16, y+j*16);
		}


}

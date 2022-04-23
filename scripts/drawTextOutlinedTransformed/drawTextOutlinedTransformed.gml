function drawTextOutlinedTransformed() {
	var xx=argument[0];
	var yy=argument[1];
	var str=argument[2];
	var xscale=argument[3];
	var yscale=argument[4];
	var angle=argument[5]
	var textColour=argument[6];
	var outlineColour=argument[7];

	draw_set_colour(outlineColour);

	var outlineSize=1;
	//Outline size is an optional 
	if (argument_count>8)
		outlineSize=argument[8];

	for (var i=-outlineSize; i<=outlineSize; i+=1)
		for (var j=-outlineSize; j<=outlineSize; j+=1)	{
			draw_text_transformed(xx+i,yy+j,str,xscale,yscale,angle);
		}
	
	draw_set_colour(textColour);
	draw_text_transformed(xx,yy,str,xscale,yscale,angle);


}

function drawTextOutlined() {
	var xx=argument[0];
	var yy=argument[1];
	var str=argument[2];
	var textColour=argument[3];
	var outlineColour=argument[4];

	draw_set_colour(outlineColour);

	var outlineSize=1;
	//Outline size is an optional 
	if (argument_count>5)
		outlineSize=argument[5];

	for (var i=-outlineSize; i<=outlineSize; i+=1)
		for (var j=-outlineSize; j<=outlineSize; j+=1)	{
			draw_text(xx+i,yy+j,str);
		}
	
	draw_set_colour(textColour);
	draw_text(xx,yy,str);


}

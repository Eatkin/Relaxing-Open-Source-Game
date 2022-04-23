function drawTextOutlinedExt() {
	var xx=argument[0];
	var yy=argument[1];
	var str=argument[2];
	var sep=string_height("A");
	var w=argument[3];
	var textColour=argument[4];
	var outlineColour=argument[5];

	draw_set_colour(outlineColour);

	var outlineSize=1;
	//Outline size is an optional 
	if (argument_count>6)
		outlineSize=argument[6];

	for (var i=-outlineSize; i<=outlineSize; i+=1)
		for (var j=-outlineSize; j<=outlineSize; j+=1)	{
			draw_text_ext(xx+i,yy+j,str,sep,w+2*outlineSize);
		}
	
	draw_set_colour(textColour);
	draw_text_ext(xx,yy,str,sep,w);


}

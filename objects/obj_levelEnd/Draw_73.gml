/// @description


draw_set_font(fnt_consolasSmall);

//Draw the rectangle
draw_set_alpha(alpha);
draw_set_colour(c_black);
draw_rectangle(0,0,room_width,room_height,false);
draw_set_alpha(1);

//Draw the 9 slice box
drawMenuContainer(hrepeats,vrepeats);

//Draw text
var padding=8;
var v_spacing=string_height("A")*1.2;

var txt;
txt[0]="WPM - "+string(round(WPMCounter));
txt[1]="Accuracy - "+string(ceil(accuracyCounter*100))+"%";
txt[2]="Mistakes - "+string(mistakesCounter);
txt[3]="Coins earned - "+string(round(coinCounter));

for (var i=0; i<array_length_1d(txt); i+=1)
	drawTextOutlined(x+padding,y+padding+i*v_spacing, txt[i],c_white,c_black);

if (coinsCounted and newWPMRecord)	{
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	drawTextOutlinedTransformed(x+hrepeats*16*0.5,y+vrepeats*16*0.65,"New WPM Record!",WPMRecordScale,WPMRecordScale,WPMRecordAngle,c_yellow,c_black);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
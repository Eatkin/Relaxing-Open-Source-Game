/// @description

drawMenuContainer(hrepeats,vrepeats);

draw_set_font(fnt_consolasXSmall);
//Draw the text!!!!!!!!!
/*ere's a fall list of stats I am good at typing
TotalGames,
	WPMMax,
	WPMAverage,
	AccuracyMax,
	AccuracyAverage,
	TotalWordsTyped,
	TotalLettersTyped,
	TotalMistakesMade,
	TotalCoins,
	AverageCoins,*/
	
var padding=8;
//var width=vrepeats*16;
//var maxTextWidth=width-padding*2;

var sep=string_height("A");

var text;
text[0]="Total games: "+string(getStat(Stats.TotalGames));
text[1]="Total words typed: "+string(getStat(Stats.TotalWordsTyped));
text[2]="Total letters typed: "+string(getStat(Stats.TotalLettersTyped));
text[3]="Highest WPM: "+string(round(getStat(Stats.WPMMax)));
text[4]="Average WPM: "+string(round(getStat(Stats.WPMAverage)));
text[5]="Average accuracy: "+string(getStat(Stats.AccuracyAverage)*100)+"%";
text[6]="Mistakes made: "+string(getStat(Stats.TotalMistakesMade));
text[7]="Total coins earned: "+string(getStat(Stats.TotalCoins));

var arrLength=array_length_1d(text);
var imodifier=0;						//I added this in incase any stats span multiple lines, but they don't so I won't use it
var yy=y+padding;
for (var i=0; i<arrLength; i+=1)
	for (var j=0; j<2; j+=1)
		drawTextOutlined(x+padding,yy+sep*(i+imodifier),text[i],c_white,c_black);
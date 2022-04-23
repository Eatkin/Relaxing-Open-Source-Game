function stringAddLineBreaks(argument0, argument1) {

	//Inserts line breaks into a string such that it will never exceed a certain specified length
	//It works by magic! (seriously I don't understand it lol)

	var _text=argument0;
	var maxlength=argument1;

	//If we are manually line breaking, add in the carriage return character
	if (global.manualLineBreak)	{
		_text=string_replace_all(_text,"\n",chr(182)+"\n");
		//Delete the final character
		_text=string_delete(_text,string_length(_text)-1,1);
	}


	//Due to a bug in the code, this will not check if the last word overflows a line. Here is the fix:
	_text=_text+" ";

	var spaceposition=0;
	if (string_width(_text)>maxlength)
		{
			var _string, newstring, i, j, stringposition;
			//Find the first word
			for (i=1;i<=string_length(_text);i+=1)
				{
					if string_char_at(_text,i)=" "
						{
							_string=string_copy(_text,1,i-1);
							stringposition=i;
							spaceposition=i;
							break;
						}
				}
			//Now we can find the next word, form newstring
			//Then check if new string exceeds the width
			//If it does we re-write the original string, replacing the space with a line break
			//If it doesn't we find the next word
			//I'll use a for loop to go through to the end of the string
			for (j=stringposition+1;j<=string_length(_text);j+=1)
				{
					if string_char_at(_text,j)=" "
						{
							newstring=string_copy(_text,stringposition+1,j-stringposition);
							//If the combination of the word + rest of the string exceeds max length
							//We insert a line break in place of the space
							if string_width(_string+newstring)>=maxlength
								{
									//Okay HERE is the problem
									//This inserts a line break only AFTER the max length is exceeded
									//We need to go backwards to find the previous space
									//Anyway think I've fixed it by saving the previous space position
									_text=string_delete(_text,spaceposition,1);
									_text=string_insert(" \n",_text,spaceposition);
									//We find the next word, starting from j+2 to avoid the line break
									for (i=spaceposition+2;i<string_length(_text);i+=1)
										{
											if string_char_at(_text,i)=" "
												{
													_string=string_copy(_text,spaceposition+1,i-spaceposition-1);
													stringposition=i+1;
													spaceposition=i;
													break;
												}
										}
									newstring="";
									j+=2;
								}
							else
								{
									spaceposition=j;
								}
						}
				}
		}
	
	//Now finally, remove the final space from the string
	var len=string_length(_text);
	_text=string_delete(_text,len,1);

	return _text;


}

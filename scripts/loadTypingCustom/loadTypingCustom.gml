function loadTypingCustom() {
	//Loads the text into typable format

	var fname=global.customTextLocation;

	var _text="";

	if (!file_exists(fname))
		_text="File missing.";
	else	{
		var file=file_text_open_read(fname);
	
		var includeSpaces=(global.customIsPoem)	?	false	:	true;

		var isBlank=false;
	
		var str=file_text_read_string(file);
	
		//While loop to read until it reaches the end of the file
		while (true)	{
			isBlank=false;
			_text+=str;
			if (str=="")
				isBlank=true;
			file_text_readln(file);
		
			if (file_text_eof(file))
				break;
			
			str=file_text_read_string(file);
	
			//If we add spaces to the end of the line, we check to make sure it's a valid place for a space then add it
			if (includeSpaces and str!="" and !isBlank)
				_text+=" ";
			else	{
				if (global.addSpaces)
					_text+=" \n";
				else
					_text+="\n";
			}
		}

		file_text_close(file);
	}

	//Get rid of any occurances of single spaces on a line
	//Due to how string replace all works, it won't check for overlapping characters such as occurances of "\n \n \n" so have to repeat it twice
	//Since there are no more than 2 line breaks simultaneously
	if (global.addSpaces)	{
		repeat(2)
			_text=string_replace_all(_text,"\n \n","\n\n");
		
		//BTW there is a bug where there's a space at the end if we add spaces so also remove that
		var _len=string_length(_text);
		_text=string_copy(_text,1,_len-2);
	}

	return _text;


}

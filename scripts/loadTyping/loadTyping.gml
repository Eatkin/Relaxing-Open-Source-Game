function loadTyping(argument0) {
	//Loads the text into typable format

	if (global.isCustomText)	{
		_text=loadTypingCustom();
		return _text;
	}

	var fname=argument0;

	var _text="";

	if (!file_exists(fname))
		_text="File missing.";
	else	{
		var file=file_text_open_read(fname);
	
		//Read first line - this tells us whether to insert spaces after each line
		var str=file_text_read_string(file);
		var includeSpaces=false;
		if (str="SPACES")
			includeSpaces=true;
		//Go to next line
		file_text_readln(file);
		str=file_text_read_string(file);

		var isBlank=false;
		//While loop to read until it reaches the ENDOFFILE marker
		while (str!="ENDOFFILE")	{
			isBlank=false;
			_text+=str;
			if (str=="")
				isBlank=true;
			file_text_readln(file);
			str=file_text_read_string(file);
	
			//If we add spaces to the end of the line, we check to make sure it's a valid place for a space then add it
			if (includeSpaces and str!="ENDOFFILE" and str!="" and !isBlank)
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

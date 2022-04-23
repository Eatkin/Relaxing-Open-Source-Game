/// @description

var file=get_open_filename_ext("Plain Text File|*.txt","",working_directory,"Choose custom plain text file");

if (file!="")	{
	global.customTextLocation=file;
	var len=string_length(file);
	var maxLen=15;
	if (len>15)
		global.customTextName="..."+string_copy(file,len-maxLen+1,maxLen);
	else
		global.customTextName=file;
}


//Prevents accidentally clicking buttons underneath the file explorer
obj_customTextLoader.menusActive=false;
alarm[0]=3;
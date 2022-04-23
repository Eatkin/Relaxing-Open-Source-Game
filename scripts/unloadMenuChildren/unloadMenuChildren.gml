function unloadMenuChildren() {
	if (loaded)	{
		for (var i=0; i<array_length_1d(child); i+=1)
			instance_destroy(child[i]);
	}

	child=0;
	loaded=false;


}

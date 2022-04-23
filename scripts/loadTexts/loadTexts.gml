function loadTexts() {
	//This is probably really weird and confusing but let's get on with it
	//Why the hell didn't I write down my definitions of long etc?
	global.library=ds_grid_create(Library.Max,0);
	global.collection[0]=-1;

	//Edward Lear
	var grid=createCollection("Lear's Limericks and Other Poems");
	var filepath=working_directory+"EdwardLear/";
	addToCollection(grid,"The Owl and the Pussycat",filepath+"OwlAndThePussycat.txt",Length.Medium);
	addToCollection(grid,"Book of Nonsense Limerick 35",filepath+"Limerick35.txt",Length.Short);
	addToCollection(grid,"Book of Nonsense Limerick 49",filepath+"Limerick49.txt",Length.Short);
	addToCollection(grid,"Book of Nonsense Limerick 108",filepath+"Limerick108.txt",Length.Short);
	addToCollection(grid,"More Nonsense Limerick 9",filepath+"Limerick9.txt",Length.Short);
	addToCollection(grid,"More Nonsense Limerick 18",filepath+"Limerick18.txt",Length.Short);
	addToCollection(grid,"More Nonsense Limerick 50",filepath+"Limerick50.txt",Length.Short);

	//Shakespeare
	var grid=createCollection("Shakespeare's Sonnets");
	var filepath=working_directory+"Shakespeare/";
	addToCollection(grid,"Sonnet I, From fairest creatures we desire increase",filepath+"ShakespeareSonnetI.txt",Length.Short);
	addToCollection(grid,"Sonnet XVIII, Shall I compare thee to a summer's day?",filepath+"ShakespeareSonnetXVIII.txt",Length.Short);
	addToCollection(grid,"Sonnet XXX, When to the sessions of sweet silent thought",filepath+"ShakespeareSonnetXXX.txt",Length.Short);
	addToCollection(grid,"Sonnet XXXIII, Full many a glorious morning have I seen",filepath+"ShakespeareSonnetXXXIII.txt",Length.Short);
	addToCollection(grid,"Sonnet LXXIII, That time of year thou mayst in me behold", filepath+"ShakespeareSonnetLXXIII.txt",Length.Short);
	addToCollection(grid,"Sonnet CIV, To me, fair friend, you never can be old", filepath+"ShakespeareSonnetCIV.txt",Length.Short);
	addToCollection(grid,"Sonnet CXVI, Let me not to the marriage of true minds", filepath+"ShakespeareSonnetCXVI.txt",Length.Short);
	addToCollection(grid,"Sonnet CXXIX, The expense of spirit in a waste of shame", filepath+"ShakespeareSonnetCXXIX.txt",Length.Short);
	addToCollection(grid,"Sonnet CXXX, My mistress' eyes are nothing like the sun", filepath+"ShakespeareSonnetCXXX.txt",Length.Short);

	//Edgar Allan Poe
	var grid=createCollection("Poe's Poetry");
	var filepath=working_directory+"Poe/";
	addToCollection(grid,"The Raven",filepath+"TheRaven.txt",Length.VeryLong);
	addToCollection(grid,"To Helen",filepath+"ToHelen.txt",Length.Short);
	addToCollection(grid,"Ulalume",filepath+"Ulalume.txt",Length.Long);
	addToCollection(grid,"A Dream Within a Dream",filepath+"ADreamWithinADream.txt",Length.Short);
	addToCollection(grid,"The Bells", filepath+"TheBells.txt",Length.Long);
	addToCollection(grid,"Sonnet: To Science", filepath+"SonnetToScience.txt",Length.Short);
	addToCollection(grid,"Eldorado", filepath+"Eldorado.txt",Length.Short);
	addToCollection(grid,"The Haunted Palace", filepath+"TheHauntedPalace.txt",Length.Long);
	addToCollection(grid,"The City In The Sea", filepath+"TheCityInTheSea.txt",Length.Long);
	addToCollection(grid,"Annabel Lee", filepath+"AnnabelLee.txt",Length.Long);

	//Alice in Wonderland
	var grid=createCollection("Alice's Adventures in Wonderland");
	var filepath=working_directory+"LewisCarroll/";
	addToCollection(grid,"Down The Rabbit Hole, Part 1",filepath+"AliceChapter1.txt",Length.VeryLong);
	addToCollection(grid,"Down The Rabbit Hole, Part 2",filepath+"AlicePart2.txt",Length.VeryLong);
	addToCollection(grid,"The Pool of Tears, Part 1", filepath+"AlicePart3.txt", Length.VeryLong);
	addToCollection(grid,"The Pool of Tears, Part 2", filepath+"AlicePart4.txt", Length.VeryLong);
	
	var grid=createCollection("James Joyce's Poetry");
	var filepath=working_directory+"Joyce/";
	addToCollection(grid,"A Flower Given to My Daughter",filepath+"Flower.txt",Length.Short);
	addToCollection(grid,"On the Beach at Fontana",filepath+"Beach.txt",Length.Short);
	addToCollection(grid,"All Day I Hear the Noise of Waters", filepath+"Water.txt",Length.Short);
	addToCollection(grid,"Winds of May", filepath+"Winds.txt",Length.Short);

	var grid=createCollection("Coding");
	var filepath=working_directory+"Coding/";
	addToCollection(grid,"Tommy's APPX Script",filepath+"APPX.txt",Length.Medium);
	addToCollection(grid,"Step Event",filepath+"Step.txt",Length.Medium);

	var grid=createCollection("Miscellaneous");
	var filepath=working_directory;
	addToCollection(grid,"Error text",filepath+"GameBroke.txt",Length.Short);
	addToCollection(grid,"Credits",filepath+"Credits.txt",Length.Short);
	addToCollection(grid,"Untypeable Characters Test",filepath+"UntypableCharsTest.txt",Length.Short);


}

function enums() {
	//Stastics
	enum Stats	{
		TotalGames,
		WPMMax,
		WPMAverage,
		AccuracyMax,
		AccuracyAverage,
		TotalWordsTyped,
		TotalLettersTyped,
		TotalMistakesMade,
		TotalCoins,
		AverageCoins,
		PassagesCompleted,
		ShopItemsPurchased,
		Max
	}

	enum Achievements	{
		Name,
		Description,
		StatRef,
		Max
	}

	//The order of these is IMPORTANT
	//It should be the same as the order the achievements are listed
	enum AchievementBitmasks	{
		SixtyWPM=1,
		SeventyWPM=2,
		EightyWPM=4,
		NinetyWPM=8,
		HundredWPM=16,
		FiveHundredWPM=32,
		HundredWords=64,
		ThousandWords=128,
		TenThousandWords=256,
		LotsOfChars=512,
		HundredCoins=1024,
		ThousandCoins=2048,
		FirstGame=4096,
		TenthGame=8192,
		TwentiethGame=16384,
		Shopper=32768
	}

	//Texts
	enum Library	{
		SeriesName,
		GridReference,
		Max
	}

	enum LiteratureContent	{
		Name,
		Text,
		Length,
		Max
	}

	enum Length	{
		Short,
		Medium,
		Long,
		VeryLong,
		VeryVeryLong,
		Extreme,
		Max
	}

	//Menus
	enum Menu	{
		Main,
		Stats,
		Shop,
		ShopCategory,
		Options,
		TextsLibrary,
		TextsCollection,
		None,
		Achievements,
		AchBox,
		Max
	}

	//Backgrounds
	enum BackgroundStyle	{
		Tiled,
		Stretched,
		BlockColour,
		Max
	}

	//Shop
	//Can't help but feel I could've done this better but also fuck you
	enum Shop	{
		Name,
		Cost,
		Purchased,
		Active,
		Max
	}

	enum UIShop	{
		Offset,
		Max
	}

	enum BGShop	{
		Type,
		Ref,
		Max
	}

	enum FontShop	{
		Ref,
		Max
	}

	enum ShopMiscBitmasks	{
		ProgressBar=1,
		DisOmikron=2,
		ExtremeScreenShake=4
	}

	enum ShopContainer	{
		Name,
		Reference,
		Max
	}

	enum ShopCategory	{
		UI,
		Background,
		Font,
		Misc,
		Max
	}

	enum Type	{
		Music,
		Achievement
	}


}

/// @decription do an action based on whatever the button is



var grid=global.UIShop;
if (type==ShopCategory.Background)	
	grid=global.BGShop;
else if (type==ShopCategory.Font)
	grid=global.FontShop;
else if (type==ShopCategory.Misc)
	grid=global.miscShop;

var hasUnlocked=false;

if (unlocked)	{
	if (type==ShopCategory.Misc)
		active^=1;
	else
		active=true;
}
else if (global.coins>=cost)	{
	achieveAchievement(AchievementBitmasks.Shopper);
	global.coins-=cost;
	unlocked=true;
	grid[# Shop.Purchased, ref]=true;
	hasUnlocked=true;
	playSound(purchase);
}
else
	playSound(snd_fuck);

switch (type)	{
	case ShopCategory.UI:			
		//If it's been activated, set the relevant offset and undo the currently selected one
		if (active)	{
			var me=id;
			with (object_index)	{
				if (id!=me)	{
					active=false;
					grid[# Shop.Active,	ref]=false;
				}
			}
			grid[# Shop.Active,		ref				]=true;
			global.UIOffset=ref;
		}
		break;
		
	case ShopCategory.Background:
		//If it's been activated, do background stuff
		if (active)	{
			var me=id;
			with (object_index)	{
				if (id!=me)	{
					active=false;
					grid[# Shop.Active,	ref]=false;
				}
			}
			grid[# Shop.Active,		ref				]=true;
			var style=grid[# Shop.Max+BGShop.Type, ref];
			var bgRef=grid[# Shop.Max+BGShop.Ref, ref];
			with (obj_background)
				loadBackground(style,bgRef);
			
			global.BGOffset=ref;
		}
		break;
		
	case ShopCategory.Font:
		if (active)	{
			var me=id;
			with (object_index)	{
				if (id!=me)	{
					active=false;
					grid[# Shop.Active,	ref]=false;
				}
			}
			
			grid[# Shop.Active, ref]=true;
			global.font=grid[# Shop.Max+FontShop.Ref, ref];
			
			global.fontOffset=ref;
		}
		break;
		
	case ShopCategory.Misc:
		//Flip the relevant bit and set the grid ref to active
		if (!hasUnlocked and unlocked)	{
			global.miscShopBitmasks^=power(2,ref);
			grid[# Shop.Active, ref]=active;
		}
		if (!unlocked)	{
			global.miscShopBitmasks&=~power(2,ref);
			grid[# Shop.Active, ref]=false;
		}
		break;
}

saveGame();
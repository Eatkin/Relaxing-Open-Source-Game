# A Relaxing Typing Game

*Type out public domain poetry and stories whilst listening to chill music*

## About The Game

"A Relaxing Typing Game" is a chill typing game for people who like typing for the sake of typing.

Drawing from public domain stories and poetry such as Edgar Allan Poe, Edward Lear and William Shakespeare, this game allows you to type out classic literature and keep track of your WPM, accuracy and mistakes.

### Credits
- Backgrounds - Ansimuz
- Graphics - kenney
- One pixel font - Gooseninja
- Music - DOS-88, Mark Mauer
- APPX Script - Tommy van Son

Some of the backgrounds are licenced under [CC 3.0](https://creativecommons.org/licenses/by/3.0/)

Music is licenced under [CC 4.0](https://creativecommons.org/licenses/by/4.0/)

### Screenshots
![Typing "The Raven" by Edgar Allan Poe](https://img.itch.zone/aW1hZ2UvODc2ODk0LzQ5OTc0NjgucG5n/original/VI0RER.png)

![Typing out a Limerick](https://img.itch.zone/aW1hZ2UvODc2ODk0LzQ5OTc0NjkucG5n/347x500/DcUrjC.png)

![Typing one of Shakespeare's Sonnets](https://img.itch.zone/aW1hZ2UvODc2ODk0LzQ5OTc0NzAucG5n/347x500/5lXbMD.png)


### Releases

A Relaxing Typing Game is playable in browser and downloadable for Windows and Linux on [itch.io](https://eatkin.itch.io/a-relaxing-typing-game).

## Source code

A Relaxing Typing Game is created using Gamemaker Studio 2 (now Gamemaker) and built with version version 2.3.7.603.

Successive Gamemaker versions can slightly change how games are built so newer versions may introduce bugs.

### About the code

Texts are parsed from .txt files included in the game's directory. Each .txt file includes either "SPACES" or "NOSPACES" as the first line.

This tells the game how to load it correctly. "SPACES" indicates that a single line break should be replaced with a space (for example, [Alice's Adventures in Wonderland](https://github.com/Eatkin/Relaxing-Open-Source-Game/blob/main/datafiles/LewisCarroll/AliceChapter1.txt)), whereas "NOSPACES" indicates line breaks should be treated as line breaks, as is the case with any poetry (such as [Sonnet XVIII](https://github.com/Eatkin/Relaxing-Open-Source-Game/blob/main/datafiles/Shakespeare/ShakespeareSonnetXVIII.txt)).

The final line of each .txt file is indicated by "ENDOFFILE".

#### A Note on String Formatting

This game uses my [old script](https://github.com/Eatkin/Relaxing-Open-Source-Game/blob/main/scripts/stringAddLineBreaks/stringAddLineBreaks.gml) for auto-adding line breaks to strings to fit a certain width. It's not very good and actually doesn't work perfectly.

I've since written a [much better version](https://github.com/Eatkin/stringAddLineBreaks/blob/main/scripts/scr_addLineBreaks/scr_addLineBreaks.gml).

#### Adding additional texts

The main script for loading texts into the game is called [loadTexts()](https://github.com/Eatkin/Relaxing-Open-Source-Game/blob/main/scripts/loadTexts/loadTexts.gml).

First, add your texts to a folder in the [datafiles path](https://github.com/Eatkin/Relaxing-Open-Source-Game/tree/main/datafiles), then in the loadTexts script create a collection as follows:

```
var grid=createCollection("YOUR COLLECTION NAME");
var filepath=working_directory+"/YOUR FOLDER NAME";
```

Then begin adding your texts to the collection using the following:
```
addToCollection(grid, "TEXT NAME", filepath+"FILENAME", LENGTH);
```

LENGTH should be replaced by an enum, this value simply tells the game what to display when the user hovers over the text. Pick from the following enums:

```
Length.Short
Length.Medium
Length.Long
Length.VeryLong
Length.VeryVeryLong
Length.Extreme
```

Or [add your own](https://github.com/Eatkin/Relaxing-Open-Source-Game/blob/main/scripts/enums/enums.gml) and define what text you want to display in [addToCollection()](https://github.com/Eatkin/Relaxing-Open-Source-Game/blob/main/scripts/addToCollection/addToCollection.gml).

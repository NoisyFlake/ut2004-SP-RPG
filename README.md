# UT2004 Singleplayer with RPG mutator

Allows the use of the UT2004RPG (MCG Version) mutator in the singleplayer campaign.
In theory, any kind of mutator can be allowed in Singleplayer with this. Simply edit [this line](https://github.com/NoisyFlake/ut2004-SP-RPG/blob/master/Classes/UT2K4LadderInfo_NSP.uc#L42) accordingly, and the mutators will be loaded into any SP match.

## Installation
Copy the Files to the UT2004 directory, then open your UT2004.ini, find
```
GUIController=GUI2K4.UT2K4GUIController
```
and replace it with
```
;GUIController=GUI2K4.UT2K4GUIController
GUIController=NewSinglePlayer.UT2K4GUIController_NSP
```

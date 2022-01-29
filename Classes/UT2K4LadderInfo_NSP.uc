//-----------------------------------------------------------
//
//-----------------------------------------------------------
class UT2K4LadderInfo_NSP extends UT2K4LadderInfo;

static function string MakeURLFor(GameProfile G)
{
	if ((UT2K4GameProfile_NSP(G) != none) && (UT2K4GameProfile_NSP(G).bIsChallenge))
		return MakeURLFoMatchInfo(UT2K4GameProfile_NSP(G).ChallengeInfo, G);
	return MakeURLFoMatchInfo(GetCurrentMatchInfo(G), G);
}

static function string MakeURLFoMatchInfo(MatchInfo M, GameProfile G)
{
	local string URL;

	if ( M == none ) {
		Warn("MatchInfo == none");
		return "";
	}

	G.EnemyTeam = M.EnemyTeamName;
	G.Difficulty = G.BaseDifficulty + M.DifficultyModifier;

	URL = M.LevelName$"?Name="$G.PlayerName$"?Character="$G.PlayerCharacter$"?SaveGame="$G.PackageName$M.URLString;
	if ( M.GoalScore != 0 )
		URL $= "?GoalScore="$M.GoalScore;
	if ( M.NumBots > 0 )
		URL $= "?NumBots="$M.NumBots;
	if ( M.GameType != "" )
		URL $= "?Game="$M.GameType;
	URL $= "?Team=1?NoSaveDefPlayer?ResetDefPlayer";
	// with ?NoSaveDefPlayer the DefaultPlayer properties won't be saved to the user.ini
	// with ?ResetDefPlayer the DefaultPlayer properties will be restored from the saved settings
	if (UT2K4MatchInfo(M) != none)
	{
		if (UT2K4MatchInfo(M).TimeLimit > 0)
		{
			URL $= "?TimeLimit="$string(UT2K4MatchInfo(M).TimeLimit);
		}
	}
	URL $="?Mutator=mcgRPG1_9_9_1.MutMCGRPG";
	log("Yopla.");
	return URL;
}

defaultproperties
{
}

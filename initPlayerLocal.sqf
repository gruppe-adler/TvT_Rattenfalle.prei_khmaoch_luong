
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;



// reset any attempt to raise or lower rating
player addEventhandler ["HandleRating", {
		0
	}];


0 = execVM "player\animations\addWavingInteraction.sqf";

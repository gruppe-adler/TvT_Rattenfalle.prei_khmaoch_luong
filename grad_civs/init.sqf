GRAD_CIV_DEBUG = false;

if (isServer) then {

	GRAD_civ_clothes = [];
	GRAD_civ_headgear = [];

	// maximum persons on map
	GRAD_CIV_MAX_COUNT = 30;

	GRAD_CIV_MIN_SPAWN_DISTANCE = 1000;
	GRAD_CIV_MAX_SPAWN_DISTANCE = 4500;

	// do not edit below //
	GRAD_CIV_ONFOOT_COUNT = 0;
	GRAD_CIV_ONFOOT_GROUPS = [];

	call GRAD_civs_fnc_clothDefinitions;
	call GRAD_civs_fnc_serverLoop;

};

if (hasInterface) then {

	call GRAD_civs_fnc_playerLoop;

	if (GRAD_CIV_DEBUG) then {
		call GRAD_civs_fnc_showWhatTheyThink;
	};

};
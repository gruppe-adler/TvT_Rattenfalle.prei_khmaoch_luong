if (!isMultiplayer) then {
	call compile preprocessfile "node_modules\shk_pos\functions\shk_pos_init.sqf";
};

[5] call GRAD_replay_fnc_init; // number is precision of replay, 2 means every 2 seconds one snapshot

_isDebug = "debugMode" call BIS_fnc_getParamValue;


if (_isDebug == 0) then {
	DEBUG = false;
} else {
	DEBUG = true;
};

RHSDecalsOff = true;

["BLU_F", "US_Rattrap"] call GRAD_Loadout_fnc_FactionSetLoadout;
["OPF_F", "Rebels_Rattrap"] call GRAD_Loadout_fnc_FactionSetLoadout;

// PVP settings
// disableRemoteSensors true; // save bandwidth, but probably shitty for AI AA
setViewDistance 1200; // sync max view distance
// disable auto spotting and similar shit
enableSentences false;
enableRadio false;
showChat false;

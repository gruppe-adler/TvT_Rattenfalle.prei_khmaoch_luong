call compile preprocessfile "node_modules\shk_pos\functions\shk_pos_init.sqf";

_isDebug = "debugMode" call BIS_fnc_getParamValue;


if (_isDebug == 0) then {
	DEBUG = false;
} else {
	DEBUG = true;
};

RHSDecalsOff = true;

["BLU_F", "US_Rattrap"] call GRAD_Loadout_fnc_FactionSetLoadout;
["OPF_F", "Rebels_Rattrap"] call GRAD_Loadout_fnc_FactionSetLoadout;
["IND_F", "UsDownedPilot"] call GRAD_Loadout_fnc_FactionSetLoadout;

// PVP settings
disableRemoteSensors true; // save bandwidth
setViewDistance 1200; // sync max view distance
// disable auto spotting and similar shit
enableSentences false;
enableRadio false;
showChat false;

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

// HIDE ALL MARKERS
{_x setMarkerAlphaLocal 0;} forEach allMapMarkers;

// SHOW THESE MARKERS
"mrk_antiair" setMarkerAlphaLocal 1;
"mrk_endpoint_opfor" setMarkerAlphaLocal 1;
"mrk_endpoint_blufor" setMarkerAlphaLocal 1;
"mrk_endpoint_opfor_2" setMarkerAlphaLocal 1;
"mrk_endpoint_blufor_2" setMarkerAlphaLocal 1;
"mrk_base_rebels" setMarkerAlphaLocal 1;
"mrk_base_rebels_text" setMarkerAlphaLocal 1;
"mrk_base_US" setMarkerAlphaLocal 1;
"mrk_base_US_text" setMarkerAlphaLocal 1;
"mrk_noFlyZone" setMarkerAlphaLocal 1;

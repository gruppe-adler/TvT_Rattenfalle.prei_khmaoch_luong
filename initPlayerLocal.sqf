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



// FADE TO BLACK
cutText ["", "BLACK FADED",1000];
enableEnvironment false;
0 fadesound 0;

// DYN GROUPS
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

// DISABLE TEAMKILL PENALTIES
player addEventhandler ["HandleRating", {
		0
}];

// ADD ACTION TO WAVE ARMS
call GRAD_mission_helpers_fnc_waveAddAction;


// START INTRO WHEN CRASH SITE IS PUBLISHED
[{
		CRASH_SITE_VEHICLE_POS select 0 != 0
},{
	1 fadesound 1;
	cutRsc ["RscStatic", "PLAIN" , 3];

	[
			CRASH_SITE_VEHICLE_POS,
			15,
			30,
			45,
			30,
			0,
			0.1,
			false
		] call grad_fx_fnc_rotatingCam;
},
10] call CBA_fnc_waitUntilAndExecute;

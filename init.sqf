_isDebug = "debugMode" call BIS_fnc_getParamValue;


if (_isDebug == 0) then {
	DEBUG = false;
} else {
	DEBUG = true;
};

RHSDecalsOff = true;

//
// customizable variables
//
if (hasInterface) then {
	cutText ["", "BLACK FADED",1000];
	enableEnvironment false;
	0 fadesound 0;
};

["BLU_F", "US_Rattrap"] call GRAD_Loadout_fnc_FactionSetLoadout;
["OPF_F", "Rebels_Rattrap"] call GRAD_Loadout_fnc_FactionSetLoadout;
["IND_F", "UsDownedPilot"] call GRAD_Loadout_fnc_FactionSetLoadout;

disableRemoteSensors true;
setViewDistance 1200;
enableSentences false;
enableRadio false;
// 0 fadeRadio 0;
showChat false;


{_x setMarkerAlphaLocal 0;} forEach allMapMarkers;

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


call compile preprocessfile "node_modules\shk_pos\functions\shk_pos_init.sqf";


if (isServer) then {

	possibleCrashPositions =  [
		"mrk_crash_site_01",
		"mrk_crash_site_02",
		"mrk_crash_site_03",
		"mrk_crash_site_04",
		"mrk_crash_site_05",
		"mrk_crash_site_06",
		"mrk_crash_site_07"
	];


	PILOTS_DEAD = false;
	publicVariable "PILOTS_DEAD";

	PILOTS_RESCUED = false;
	publicVariable "PILOTS_RESCUED";

	PILOTS_CAPTURED = false;
	publicVariable "PILOTS_CAPTURED";


	LAST_PILOTS_POSITION = ["irgendwo",[0,0],0]; // name of nearest location, position of pilot, distance to location (becomes radius of marker)
	publicVariable "LAST_PILOTS_POSITION";

	CURRENT_PILOTS_POSITION = ["irgendwo",[0,0],0]; // name of nearest location, position of pilot, distance to location (becomes radius of marker)
	publicVariable "CURRENT_PILOTS_POSITION";

	CRASH_SITE_SELECTED = false;
	publicVariable "CRASH_SITE_SELECTED";

	CRASH_SITE = [0,0];
	publicVariable "CRASH_SITE";

	CRASH_SITE_VEHICLE_POS = [0,0];
	publicVariable "CRASH_SITE_VEHICLE_POS";

	BLUFOR_WINS = false;
	publicVariable "BLUFOR_WINS";
	OPFOR_WINS = false;
	publicVariable "OPFOR_WINS";

	SIGHTING_DELAY = 60;
	
	CHANCE_TO_REVEAL_BLUFOR = 0.2; // value from 0 - 1 giving the general chance of civilians to reveal something when questioned
	publicVariable "CHANCE_TO_REVEAL_BLUFOR";

	CHANCE_TO_REVEAL_OPFOR = 0.2; // value from 0 - 1 giving the general chance of civilians to reveal something when questioned
	publicVariable "CHANCE_TO_REVEAL_OPFOR";

	
	[] execVM "server\serverTeleportListener.sqf";
	[] execVM "server\selectSpawnPosition.sqf";
	


	if (isMultiplayer) then {
		{
			_x addMPEventHandler ["MPKilled", {
					//Only on the server
					if (isServer) then {
		     			diag_log format ["%1 killed by %2, ace says %3",
			     			name (_this select 0),
			     			name (_this select 1),
			     			(_this select 0) getVariable ["ACE_medical_lastDamageSource",(_this select 0)]
			     		];
					};
				}];
		} forEach playableUnits;
	};


	CRASH_PILOTS = [];
	{
		if (_x getVariable ["GRAD_pilotTracking_isPilot",false]) then {
			// add unit to crash pilots
			CRASH_PILOTS = CRASH_PILOTS + [_x];
			publicVariable "CRASH_PILOTS";
		};
	}
	forEach allUnits;

};



if (hasInterface) then {

	callIntro = {
		waitUntil {CRASH_SITE_VEHICLE_POS select 0 != 0};
		0 = [
				CRASH_SITE_VEHICLE_POS,
				15,
				30,
				45,
				30,
				0,
				0.1,
				false
			] call grad_fx_fnc_rotatingCam;
			// ["_target",["_timeout",10],["_radius",50],["_angle",180],["_altitude",15],["_dir",0],["_commitTime",0.1],["_showCinemaBorder",false]];
	};

	[] spawn callIntro;

	sleep 1;

	if (playerSide == independent) then {
		[] execVM "player\pilotTeleportListener.sqf";
	};

	1 fadesound 1;

    cutRsc ["RscStatic", "PLAIN" , 3];
};

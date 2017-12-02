_isDebug = "debugMode" call BIS_fnc_getParamValue;


if (_isDebug == 0) then {
	DEBUG = false;
} else {
	DEBUG = true;
};

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
setViewDistance 1500;
enableSentences false;
enableRadio false;
// 0 fadeRadio 0;
showChat false;

jipTime = 60000;

{_x setMarkerAlphaLocal 0;} forEach allMapMarkers;

"mrk_antiair" setMarkerAlphaLocal 1;
"mrk_antiair_1" setMarkerAlphaLocal 1;
"mrk_antiair2" setMarkerAlphaLocal 1;
"mrk_antiair3" setMarkerAlphaLocal 1;


call compile preprocessfile "Engima\Traffic\Custom_GruppeAdler\createVehicle.sqf";
call compile preprocessfile "helpers\setLoadoutRandomization.sqf";


/*
[] execVM "Engima\Traffic\Init.sqf";
[] execVM "Engima\Civilians\Init.sqf";
[] execVM "grad_civs\init.sqf";
*/

/*
[] execVM "grad_sandstorm\init.sqf";
[] execVM "grad_rotorwash\init.sqf";
*/

If(isNil "spawn_help_fnc_compiled")then{call compile preprocessFileLineNumbers "helpers\findPos.sqf"};
call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
call compile preprocessfile "helpers\spf_createRelPos.sqf";
[]execVM "helpers\findSpawnPos.sqf";
[]execVM "helpers\addActionMP.sqf";

[] spawn {
	#define MAKEFIRE_TREERADIUS 40                                                //distance player-->trees in order to be able to start fire (this is not exact)
	#define MAKEFIRE_CANBUILD (player getVariable ["GRAD_pilotTracking_isPilot",false])		//condition to be able to build fires
	#define MAKEFIRE_BUILDTIME 10                                                 //time it takes to make the fire
	#define MAKEFIRE_UPGRADETIME 10                                               //time it takes to upgrade fire
	#define MAKEFIRE_ADDLVSTIME 10                                                //time it takes to add leaves to the fire
	#define MAKEFIRE_PLAYERDIST 2                                                 //distance to player that the fire object will be spawned
	#define MAKEFIRE_CLASS_SMALL "FirePlace_burning_F"                            //small fire classname
	#define MAKEFIRE_CLASS_BIG "Campfire_burning_F"                               //big fire classname
	#define MAKEFIRE_ACTOFFSET [0,0,0.2]                                          //interaction point offset from model center
	#define MAKEFIRE_ACTDIST 2.5                                                  //distance from which interaction point can be accessed
	#define MAKEFIRE_BURNTIMESMALL 60                                             //time that a small fire will burn
	#define MAKEFIRE_BURNTIMEBIG 90                                               //time that a big fire will burn
	#define MAKEFIRE_BURNTIMELVS 20                                               //time that adding leaves will add to total burntime

	C9J_fnc_createSmokeColumn = compile preprocessFileLineNumbers "helpers\fn_createSmokeColumn.sqf";
	#include "node_modules\GRAD_makeFire\initMakeFire.sqf";
};

[] spawn {
  #define LEAVENOTES_CANWRITENOTES (player getVariable ["GRAD_pilotTracking_isPilot",false])      //condition to be able to write notes
  #define LEAVENOTES_UNLIMITED true                                             //can write unlimited amount of notes
  #define LEAVENOTES_AMOUNT 2                                                   //amount of notes per player (irrelevant if LEAVENOTES_UNLIMITED)
  #define LEAVENOTES_PLAYERDIST 1                                               //distance to player that notes will be dropped
  #define LEAVENOTES_CLASS "Land_Notepad_F"                                     //note object class name
  #define LEAVENOTES_ACTOFFSET [0,0,0.1]                                        //interaction point offset to notepad object
  #define LEAVENOTES_ACTDIST 2                                                  //interaction distance
  #define LEAVENOTES_SLEEPTIME 0.1                                              //sleeptime between interaction and creation of dialog (ACE-interact-menu would stay open sometimes)

  #include "node_modules\GRAD_leaveNotes\initLeaveNotes.sqf";
};

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

	REBEL_SPAWN = [0,0];
	publicVariable "REBEL_SPAWN";

	US_SPAWN = [0,0];
	publicVariable "US_SPAWN";

	BLUFOR_WINS = false;
	publicVariable "BLUFOR_WINS";
	OPFOR_WINS = false;
	publicVariable "OPFOR_WINS";


	SETUP_DONE = false;
	publicVariable "SETUP_DONE";

	SIGHTING_DELAY = 60;
	
	CHANCE_TO_REVEAL_BLUFOR = 0.2; // value from 0 - 1 giving the general chance of civilians to reveal something when questioned
	publicVariable "CHANCE_TO_REVEAL_BLUFOR";

	CHANCE_TO_REVEAL_OPFOR = 0.2; // value from 0 - 1 giving the general chance of civilians to reveal something when questioned
	publicVariable "CHANCE_TO_REVEAL_OPFOR";


	[] execVM "server\serverTeleportListener.sqf";
	[] execVM "server\selectSpawnPosition.sqf";
	[] execVM "grad_pilotTracking\initPilotTracking.sqf";

	[] spawn {
		waitUntil {(REBEL_SPAWN select 0 != 0) && (US_SPAWN select 0 != 0)}; // wait until everything is neatly set up

		SETUP_DONE = true;
		publicVariable "SETUP_DONE";
	};


	// loadout for AI units
	/*
	if (!isMultiplayer) then {
	 	[] spawn {
			sleep 10; // dont equip player multiple times
 			{if (!isPlayer _x) then {0 = [_x] execVM "loadouts\_client.sqf"};} forEach allUnits;
 		};
	} else {
			{if (!isPlayer _x) then {sleep 0.5; 0 = [_x] execVM "loadouts\_client.sqf"};} forEach allUnits;
	};*/

	if (isMultiplayer) then {
		{
			_loadout = _x getVariable ["GRAD_loadout","none"];
			if (_loadout != "none") then {
				_stringLoadout = "GRAD_getUnitLoadout_" + _loadout;
				_x setUnitLoadout [(missionNamespace getVariable [_stringLoadout, []]),true];
			};

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



	} else {
		{
			_loadout = _x getVariable ["GRAD_loadout","none"];
			if (_loadout != "none") then {
				_stringLoadout = "GRAD_getUnitLoadout_" + _loadout;
				_x setUnitLoadout [(missionNamespace getVariable [_stringLoadout, []]),true];
			};
		} forEach switchableUnits;
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

	// JIP handling
	checkJIP = {
		if ((CRASH_SITE select 0 != 0) && didJIP && time > jipTime) then {
			player setDamage 1;
		} else {
			// [] spawn callIntro;
			_loadout = player getVariable ["GRAD_loadout","none"];
			if (_loadout != "none") then {
				_stringLoadout = "GRAD_getUnitLoadout_" + _loadout;
				diag_log format ["calling loadout %1",_stringLoadout];
				player setUnitLoadout [(missionNamespace getVariable [_stringLoadout, []]),true];
			};
		};
	};


	callIntro = {
		waitUntil {CRASH_SITE_VEHICLE_POS select 0 != 0};
		if (!isMultiplayer) then {
			waitUntil { !isNil "ENGIMA_TRAFFIC_functionsInitialized" };
		};
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

	sleep 1;

	// WEST is US
	if (playerSide == west) then {
		[] execVM "player\USTeleportListener.sqf";
		[] spawn checkJIP;
		// [] execVM "player\createPilotVehicleTracker.sqf";
	};

	// EAST is rebels
	if (playerSide == east) then {
		[] execVM "player\rebelsTeleportListener.sqf";
		[] spawn checkJIP;
		[] execVM "player\createPilotVehicleTracker.sqf";
	};

	if (playerSide == independent) then {

		player setVariable ["player GRAD_pilotTracking_isPilot", true];
		
		[] execVM "grad_pilotTracking\initPilotTracking.sqf";
		[] execVM "player\pilotTeleportListener.sqf";
		[] execVM "player\addSignalPistolEH.sqf";
		[] spawn checkJIP;
		
	};

	1 fadesound 1;

    cutRsc ["RscStatic", "PLAIN" , 3];
};

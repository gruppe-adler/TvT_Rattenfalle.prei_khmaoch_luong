call compile preprocessfile "node_modules\shk_pos\functions\shk_pos_init.sqf";

if ((typeOf player == Survivor_F) && (player getVariable ["GRAD_pilotTracking_isPilot", false])) then {
	    player setRank "PRIVATE";
};

// HIDE ALL MARKERS
{_x setMarkerAlphaLocal 0;} forEach allMapMarkers;

// SHOW THESE MARKERS
"mrk_antiair" setMarkerAlphaLocal 1;
"mrk_endpoint_opfor" setMarkerAlphaLocal 1;
"mrk_endpoint_blufor" setMarkerAlphaLocal 1;
"mrk_endpoint_opfor_2" setMarkerAlphaLocal 1;
"mrk_endpoint_blufor_2" setMarkerAlphaLocal 1;
"mrk_endpoint_opfor_3" setMarkerAlphaLocal 1;
"mrk_endpoint_blufor_3" setMarkerAlphaLocal 1;
"mrk_base_rebels" setMarkerAlphaLocal 1;
"mrk_base_rebels_text" setMarkerAlphaLocal 1;
"mrk_base_US" setMarkerAlphaLocal 1;
"mrk_base_US_text" setMarkerAlphaLocal 1;
"mrk_noFlyZone" setMarkerAlphaLocal 1;

"mrk_bridge_north" setMarkerAlphaLocal 1;
"mrk_bridge_north_2" setMarkerAlphaLocal 1;
"mrk_bridge_south" setMarkerAlphaLocal 1;
"mrk_bridge_south_2" setMarkerAlphaLocal 1;



// FADE TO BLACK
cutText ["", "BLACK",1000];
enableEnvironment false;

// DYN GROUPS
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

// DISABLE TEAMKILL PENALTIES
// is now a cba setting interaction
/*
player addEventhandler ["HandleRating", {
		0
}];
*/

// ADD ACTION TO WAVE ARMS
call GRAD_mission_helpers_fnc_waveAddAction;

// quicker testing in SP
if (isMultiplayer) then {

	// START INTRO WHEN CRASH SITE IS PUBLISHED
	[{
			CRASH_SITE_VEHICLE_POS select 0 != 0
	},{
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
	[]] call CBA_fnc_waitUntilAndExecute;
};


if (!isNull (getAssignedCuratorLogic player) && {isClass (configFile >> "CfgPatches" >> "achilles_modules_f_achilles")}) then
{
  // Note that the line below has to be uncommented if your mission is a Zeus Game Master mission.
  waitUntil {missionnamespace getvariable ["BIS_moduleMPTypeGameMaster_init", false] and {not isNil "ares_category_list"}};
  ["Gruppe Adler", "Force follow Waypoints",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  	// Log the parameters
  	systemChat str _position;
  	systemChat str _objectUnderCursor;

    private _waypoints = waypoints _objectUnderCursor;
    private _positions = [];
    {
      _positions pushBack (waypointPosition _x);
    } forEach _waypoints;

    {
        deleteWaypoint _x;
    } forEach _waypoints;

    _objectUnderCursor setDriveOnPath _positions;

  }] call Ares_fnc_RegisterCustomModule;
};

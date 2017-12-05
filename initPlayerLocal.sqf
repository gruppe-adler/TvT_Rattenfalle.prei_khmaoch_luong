 /*
 ["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

if (isMultiplayer) then {
	joinTime = serverTime;
} else {
	joinTime = time;
};

GRAD_GPS_TRACKER_OPEN = false;

_openGPSTracker = ["ACE_SelfActions", "Open GPS Tracker", "",
 {call grad_pilotTracking_fnc_openGPS; GRAD_GPS_TRACKER_OPEN = true;},
  {!(player getVariable ["GRAD_pilotTracking_isPilot",false]) && !GRAD_GPS_TRACKER_OPEN}] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions"], _openGPSTracker] call ace_interact_menu_fnc_addActionToClass;


_closeGPSTracker = ["ACE_SelfActions", "Close GPS Tracker", "",
 {call grad_gpsTracker_fnc_closeTitle; GRAD_GPS_TRACKER_OPEN = false;},
  {!(player getVariable ["GRAD_pilotTracking_isPilot",false]) && GRAD_GPS_TRACKER_OPEN}] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions"], _closeGPSTracker] call ace_interact_menu_fnc_addActionToClass;



// reset any attempt to raise or lower rating
player addEventhandler ["HandleRating", {
		0
	}];


0 = execVM "player\animations\addWavingInteraction.sqf";
0 = execVM "player\addObjectiveListener.sqf";
[] execVM "rattrap_objectives\init.sqf";
*/
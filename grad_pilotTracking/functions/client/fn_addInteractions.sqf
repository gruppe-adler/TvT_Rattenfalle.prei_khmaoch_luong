_readTrace = ["ACE_MainActions", "Spur einschätzen", "", {
	[_player, _target] call GRAD_pilotTracking_fnc_readTrace;
},
{true}] call ace_interact_menu_fnc_createAction;

["BloodTrail_01_New_F", 0, ["ACE_MainActions"], _readTrace] call ace_interact_menu_fnc_addActionToClass;
["BloodSpray_01_New_F", 0, ["ACE_MainActions"], _readTrace] call ace_interact_menu_fnc_addActionToClass;
["BloodSplatter_01_Small_New_F", 0, ["ACE_MainActions"], _readTrace] call ace_interact_menu_fnc_addActionToClass;
["BloodSplatter_01_Medium_New_F", 0, ["ACE_MainActions"], _readTrace] call ace_interact_menu_fnc_addActionToClass;
["BloodPool_01_Medium_New_F", 0, ["ACE_MainActions"], _readTrace] call ace_interact_menu_fnc_addActionToClass;
["BloodPool_01_Large_New_F", 0, ["ACE_MainActions"], _readTrace] call ace_interact_menu_fnc_addActionToClass;

["BloodTrail_01_Old_F", 0, ["ACE_MainActions"], _readTrace] call ace_interact_menu_fnc_addActionToClass;
["BloodSpray_01_Old_F", 0, ["ACE_MainActions"], _readTrace] call ace_interact_menu_fnc_addActionToClass;
["BloodSplatter_01_Small_Old_F", 0, ["ACE_MainActions"], _readTrace] call ace_interact_menu_fnc_addActionToClass;
["BloodSplatter_01_Medium_Old_F", 0, ["ACE_MainActions"], _readTrace] call ace_interact_menu_fnc_addActionToClass;
["BloodPool_01_Medium_Old_F", 0, ["ACE_MainActions"], _readTrace] call ace_interact_menu_fnc_addActionToClass;
["BloodPool_01_Large_Old_F", 0, ["ACE_MainActions"], _readTrace] call ace_interact_menu_fnc_addActionToClass;


["Sign_Sphere10cm_F", 0, ["ACE_MainActions"], _readTrace] call ace_interact_menu_fnc_addActionToClass;

// todo
_breakBones = ["breakBones", "Break Bones", "", {
	[_player, _target] remoteExec ["GRAD_pilotTracking_fnc_breakBones", _target];
},
{
	!(_target getVariable ["GRAD_pilotTracking_bonesBroken", false]) &&
	(_target getVariable ["GRAD_pilotTracking_isPilot", false])
}] call ace_interact_menu_fnc_createAction;

[typeOf player, 0, ["ACE_MainActions"], _breakBones, true] call ace_interact_menu_fnc_addActionToClass;


GRAD_GPS_TRACKER_OPEN = false;

_openGPSTracker = ["ACE_SelfActions", "Open GPS Tracker", "",
{[] call grad_pilotTracking_fnc_openGPS; GRAD_GPS_TRACKER_OPEN = true;},
{player getVariable ["GRAD_pilotTracking_isScout", false] && !GRAD_GPS_TRACKER_OPEN}] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions"], _openGPSTracker] call ace_interact_menu_fnc_addActionToClass;


_closeGPSTracker = ["ACE_SelfActions", "Close GPS Tracker", "",
{call grad_gpsTracker_fnc_closeTitle; GRAD_GPS_TRACKER_OPEN = false;},
 {player getVariable ["GRAD_pilotTracking_isScout", false] && GRAD_GPS_TRACKER_OPEN}] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions"], _closeGPSTracker] call ace_interact_menu_fnc_addActionToClass;


_pushBoat = ["PushBoatAction", "Push Boat", "",
{ [_target, _player] call ace_interaction_fnc_push; },
{true}] call ace_interact_menu_fnc_createAction;

["I_C_Boat_Transport_02_F", 0, ["ACE_MainActions"], _pushBoat] call ace_interact_menu_fnc_addActionToClass;

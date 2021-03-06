// BLOOD TRAIL

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


//todo add icons

// BONE BREAKING
_breakBones = ["ACE_MainActions", "Break Bones", "grad_pilotTracking\data\ico_breakBones.paa", {
	[_target] remoteExec ["GRAD_pilotTracking_fnc_breakBones", _target];
	_player playMoveNow "Acts_Executioner_Backhand";
	_player addEventHandler ["AnimDone", {
		[(_this select 0), ""] remoteExec ["switchmove", [0, -2] select isDedicated];
		(_this select 0) removeAllEventHandlers "AnimDone";
	}];
},
{
	!(_target getVariable ["GRAD_pilotTracking_bonesBroken", false]) &&
	(_target getVariable ["GRAD_pilotTracking_isPilot", false]) &&
	alive _target
}] call ace_interact_menu_fnc_createAction;

_estimateBleedout = ["ACE_MainActions", "Estimate Bleedout", "grad_pilotTracking\data\ico_bleedout.paa", {
		[_target] call GRAD_pilotTracking_fnc_estimateBleedout;
},
{
	(_target getVariable ["GRAD_pilotTracking_isPilot", false]) &&
	alive _target
}] call ace_interact_menu_fnc_createAction;

_stabilizePilot = ["ACE_MainActions", "Stabilize Pilot", "grad_pilotTracking\data\ico_stabilize.paa", {
		[_player, _target] call GRAD_pilotTracking_fnc_medicStartHealing;
},
{
	(_target getVariable ["GRAD_pilotTracking_isPilot", false]) &&
	(_target getVariable ["GRAD_pilotTracking_isBleeding", false]) &&
	((typeOf _player isEqualTo "B_medic_F") || (typeOf _player isEqualTo "O_medic_F")) &&
	alive _target
}] call ace_interact_menu_fnc_createAction;

["Man", 0, ["ACE_MainActions"], _breakBones, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 0, ["ACE_MainActions"], _estimateBleedout, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 0, ["ACE_MainActions"], _stabilizePilot, true] call ace_interact_menu_fnc_addActionToClass;

// By Gregor Cresnar
// Bandage by pictohaven from the Noun Project
// Heart by romzicon from the Noun Project
// GPS by Hea Poh Lin from the Noun Project
// blood by SlideGenius from the Noun Project
// push by Luis Prado from the Noun Project

// GPS STUFF
GRAD_GPS_TRACKER_OPEN = false;

_openGPSTracker = ["ACE_SelfActions", "Open GPS Tracker", "grad_pilotTracking\data\ico_openTracker.paa",
{[] call grad_pilotTracking_fnc_openGPS; GRAD_GPS_TRACKER_OPEN = true;},
{player getVariable ["GRAD_pilotTracking_isScout", false] && !GRAD_GPS_TRACKER_OPEN}] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions"], _openGPSTracker] call ace_interact_menu_fnc_addActionToClass;


_closeGPSTracker = ["ACE_SelfActions", "Close GPS Tracker", "grad_pilotTracking\data\ico_closeTracker.paa",
{call grad_gpsTracker_fnc_closeTitle; GRAD_GPS_TRACKER_OPEN = false;},
 {player getVariable ["GRAD_pilotTracking_isScout", false] && GRAD_GPS_TRACKER_OPEN}] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions"], _closeGPSTracker] call ace_interact_menu_fnc_addActionToClass;


_pushBoat = ["PushBoatAction", "Push Boat", "grad_pilotTracking\data\ico_push.paa",
{ [_target, _player] call ace_interaction_fnc_push; },
{true}] call ace_interact_menu_fnc_createAction;

["I_C_Boat_Transport_02_F", 0, ["ACE_MainActions"], _pushBoat] call ace_interact_menu_fnc_addActionToClass;


// FORCE CLOSE WOUND FOR PILOT
GRAD_WOUND_FORCE_CLOSE = false;
// todo finalize force close wounds
_forceCloseWound = ["ACE_SelfActions", "Temporary force close wound", "",
{[] call grad_pilotTracking_fnc_forceCloseWound; GRAD_WOUND_FORCE_CLOSE = true; publicVariable "GRAD_WOUND_FORCE_CLOSE";},
{
player getVariable ["GRAD_pilotTracking_isPilot", false] &&
!GRAD_WOUND_FORCE_CLOSE &&
player getVariable ["GRAD_pilotTracking_isBleeding", false]
}] call ace_interact_menu_fnc_createAction;

_endForceCloseWound = ["ACE_SelfActions", "End force close wound", "",
{GRAD_WOUND_FORCE_CLOSE = false;},
{player getVariable ["GRAD_pilotTracking_isPilot", false] &&
GRAD_WOUND_FORCE_CLOSE &&
player getVariable ["GRAD_pilotTracking_isBleeding", false]}] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions"], _forceCloseWound] call ace_interact_menu_fnc_addActionToClass;
[typeOf player, 1, ["ACE_SelfActions"], _endForceCloseWound] call ace_interact_menu_fnc_addActionToClass;

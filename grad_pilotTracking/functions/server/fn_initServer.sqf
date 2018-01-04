private _pilot = objNull;

GRAD_RATTRAP_GPS_STATUS = 0;
publicVariable "GRAD_RATTRAP_GPS_STATUS";
GRAD_pilotTracking_missionTime = ["PilotLifeSpan", 3600] call BIS_fnc_getParamValue; // seconds
GRAD_pilotTracking_penaltyBrokenLegDelay = GRAD_pilotTracking_missionTime/4*3; // seconds
publicVariable "GRAD_pilotTracking_missionTime";
publicVariable "GRAD_pilotTracking_penaltyBrokenLegDelay";


{  
    if (_x getVariable ["GRAD_pilotTracking_isPilot", false]) exitWith {
        _pilot = _x;
        missionNamespace setVariable ["GRAD_pilotTracking_pilotTrackingObj",_x,true];
    };
} forEach allUnits;

[_pilot, true] call grad_gpsTracker_fnc_setTarget;

[] remoteExec ["GRAD_pilotTracking_fnc_initClient", [0,-2] select isDedicated];

if (isMultiplayer) then {
	[_pilot] remoteExec ["GRAD_pilotTracking_fnc_initPilot", _pilot];
} else {
	[_pilot] call GRAD_pilotTracking_fnc_initPilot;
};

[_pilot] call GRAD_pilotTracking_fnc_dropBlood;
[_pilot] call GRAD_pilotTracking_fnc_serverLoopPilotAlive;

GRAD_pilotTracking_trackingRange = 2000;
publicVariable "GRAD_pilotTracking_trackingRange";

call GRAD_pilotTracking_fnc_addBodyBagHandling;
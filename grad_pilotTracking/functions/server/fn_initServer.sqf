private _pilot = objNull;

GRAD_pilotTracking_missionTime = 600; // seconds
GRAD_pilotTracking_penaltyBrokenLegDelay = GRAD_pilotTracking_missionTime/4*3; // seconds
publicVariable "GRAD_pilotTracking_missionTime";
publicVariable "GRAD_pilotTracking_penaltyBrokenLegDelay";


{  
    if (_x getVariable ["GRAD_pilotTracking_isPilot", false]) exitWith {
        _pilot = _x;
        missionNamespace setVariable ["GRAD_pilotTracking_pilotTrackingObj",_x,true];
    };
} forEach allUnits;

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
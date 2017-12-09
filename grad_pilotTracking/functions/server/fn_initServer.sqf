private _pilot = objNull;

{  
    if (_x getVariable ["GRAD_pilotTracking_isPilot", false]) exitWith {
        _pilot = _x;
        missionNamespace setVariable ["GRAD_pilotTracking_pilotTrackingObj",_x];
    };
} forEach allUnits;

[] remoteExec ["GRAD_pilotTracking_fnc_initClient", [0,-2] select isDedicated];
[_pilot] remoteExec ["GRAD_pilotTracking_fnc_initPilot", _pilot];

[_pilot] call GRAD_pilotTracking_fnc_dropBlood;
[_pilot] call GRAD_pilotTracking_fnc_serverLoopPilotAlive;

GRAD_pilotTracking_trackingRange = 2000;
publicVariable "GRAD_pilotTracking_trackingRange";

call GRAD_pilotTracking_fnc_addBodyBagHandling;
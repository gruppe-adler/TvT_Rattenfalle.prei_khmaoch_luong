params ["_pilot"];

[] call GRAD_pilotTracking_fnc_addInteractions;
[_pilot] call grad_pilotTracking_fnc_playerLoop;
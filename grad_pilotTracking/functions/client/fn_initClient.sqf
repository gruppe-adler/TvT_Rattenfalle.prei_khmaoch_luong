params ["_pilot"];

[] call GRAD_pilotTracking_fnc_addInteractions;
[_pilot] call grad_pilotTracking_fnc_playerLoop;

[allPlayers, [_pilot]] call ace_spectator_fnc_updateUnits;
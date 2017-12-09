params ["_pilot"];

GRAD_pilotTracking_missionTime = 600; // seconds
GRAD_pilotTracking_penaltyBrokenLegDelay = 299; // seconds

// initial delay
// sleep 5;

[_pilot] call grad_pilotTracking_fnc_clientLoop;
_pilot setVariable ["GRAD_pilotTracking_isBleeding", true];
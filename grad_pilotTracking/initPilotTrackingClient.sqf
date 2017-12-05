[] call GRAD_pilotTracking_fnc_addInteractions;

if (!(player getVariable ["GRAD_pilotTracking_isPilot", false])) exitWith {};

GRAD_pilotTracking_missionTime = 600; // seconds
GRAD_pilotTracking_penaltyBrokenLegDelay = 299; // seconds

// initial delay
// sleep 5;

[player] call grad_pilotTracking_fnc_clientLoop;
player setVariable ["GRAD_pilotTracking_isBleeding", true];
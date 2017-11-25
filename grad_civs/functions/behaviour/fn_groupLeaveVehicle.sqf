/*
params ["_vehicle"];

_driver = driver _vehicle;
_vehicleCrew = crew _vehicle;

if (GRAD_CIV_DEBUG) then {
    _driver setVariable ["GRAD_civs_currentlyThinking", "aaaah i need to stop the car", true];
};

doStop _driver;

waitUntil {speed _vehicle < 1};

{ unassignVehicle _x } forEach _vehicleCrew;

{ doGetOut _x } forEach _vehicleCrew;

waitUntil {isTouchingGround _civ};
sleep 1;
*/
params ["_pilot"];

GRAD_pilotTracking_missionTime = 600; // seconds
GRAD_pilotTracking_penaltyBrokenLegDelay = 299; // seconds

// initial delay
// sleep 5;

[_pilot] call grad_pilotTracking_fnc_clientLoop;
_pilot setVariable ["GRAD_pilotTracking_isBleeding", true, true];

_pilot addEventHandler ["GetInMan", {
	params ["_unit", "_position", "_vehicle", "_turret"];

	["The pilot got in a vehicle, check your GPS Tracker."] remoteExec ["hint", 0];

	if (_vehicle getVariable ["GRAD_rattrap_isMedicalVehicle",false] &&
		(_unit getVariable ["GRAD_pilotTracking_isBleeding",false])) then {
        	[_unit] call GRAD_pilotTracking_fnc_pilotStartHealing;
	};
}];

_pilot addEventHandler ["GetOutMan", {
	params ["_unit", "_position", "_vehicle", "_turret"];

	["The pilot exited a vehicle."] remoteExec ["hint", 0];

	if (_unit getVariable ["GRAD_rattrap_pilotHealingStarted", false]) then {
		_unit setVariable ["GRAD_rattrap_pilotHealingStarted", false, true];
	};
}];
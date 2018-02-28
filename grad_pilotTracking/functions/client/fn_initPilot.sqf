params ["_pilot"];

// initial delay
// sleep 5;

_pilot setVariable ["GRAD_pilotTracking_isBleeding", true, true];

[_pilot] call grad_pilotTracking_fnc_pilotLoop;

[{
	player getVariable ["GRAD_loadout_applicationCount",0] > 0
}, {

	if (!(player getVariable ["GRAD_pilotTracking_isPilot", false])) exitWith {};

	[{
		player addItem "hgun_Pistol_Signal_F";
	}, 3] call CBA_fnc_waitAndExecute;

	// radio nerfing
	["waitForInit", "OnRadiosReceived", {
	    [call TFAR_fnc_activeSwRadio, "33.3"] call TFAR_fnc_setSwFrequency;
		player setVariable ["tf_receivingDistanceMultiplicator", 0.01];
		player setVariable ["tf_sendingDistanceMultiplicator", 0.01];
	    ["waitForInit","OnRadiosReceived", player] call TFAR_fnc_removeEventHandler;
	}, player] call TFAR_fnc_addEventHandler;

}] call CBA_fnc_waitUntilAndExecute;


// exchange flares of pilot for yellow ones because reasons
_pilot addEventHandler ["Fired",
{
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

	if (_weapon isEqualTo "hgun_Pistol_Signal_F") then {

		private _velocity = velocity _projectile;
		private _position = getPos _projectile;
		deleteVehicle _projectile;

		private _flare = "F_40mm_Yellow" createVehicle _position;
		_flare setVelocity _velocity;
	};
}];


// eventhandler to catch healing
_pilot addEventHandler ["GetInMan", {
	params ["_unit", "_position", "_vehicle", "_turret"];

	["The pilot got in a vehicle, check your GPS Tracker."] remoteExec ["hint", 0];

	[] remoteExec ["GRAD_pilotTracking_fnc_reOpenGPS", allPlayers];

	if (_vehicle getVariable ["GRAD_rattrap_isMedicalVehicle",false] &&
		(_unit getVariable ["GRAD_pilotTracking_isBleeding",false])) then {
        	[_unit] call GRAD_pilotTracking_fnc_pilotStartHealing;
	};
}];

_pilot addEventHandler ["GetOutMan", {
	params ["_unit", "_position", "_vehicle", "_turret"];

	["The pilot exited a vehicle."] remoteExec ["hint", 0];

	[] remoteExec ["GRAD_pilotTracking_fnc_reOpenGPS", allPlayers];

	if (_unit getVariable ["GRAD_rattrap_pilotHealingStarted", false]) then {
		_unit setVariable ["GRAD_rattrap_pilotHealingStarted", false, true];
	};
}];

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

	// kick out if pilot enters restricted vehicles and is not stabilized
	if (_vehicle getVariable ["GRAD_rattrap_isRestrictedVehicle",false] &&
			_unit getVariable ["GRAD_pilotTracking_isBleeding", false]) then {
  		moveOut _unit;
			["You need to get treated by a medic first."] remoteExec ["hintsilent", _unit];
	} else {
			[] remoteExec ["GRAD_pilotTracking_fnc_reOpenGPS", allPlayers];
			["The pilot got in a vehicle, check your GPS Tracker."] remoteExec ["hintsilent", (allPlayers - _unit)];
	};
}];

_pilot addEventHandler ["GetOutMan", {
	params ["_unit", "_position", "_vehicle", "_turret"];

	["The pilot exited a vehicle."] remoteExec ["hintsilent", 0];

	[] remoteExec ["GRAD_pilotTracking_fnc_reOpenGPS", allPlayers];
}];


// general fatigue nerf for pilot
if (isPlayer _pilot) then {
	["GRAD_pilotTracking_generalFatigueNerf", {
            2
	}] call ace_advanced_fatigue_fnc_addDutyFactor;
};

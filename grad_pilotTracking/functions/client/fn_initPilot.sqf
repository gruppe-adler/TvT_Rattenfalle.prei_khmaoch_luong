params ["_pilot"];

// initial delay
// sleep 5;

[_pilot] call grad_pilotTracking_fnc_clientLoop;
_pilot setVariable ["GRAD_pilotTracking_isBleeding", true, true];


_loadoutHandler = ["GRAD_loadout_loadoutApplied", {
	
	if (!(player getVariable ["GRAD_pilotTracking_isPilot", false])) exitWith {};

	["GRAD_loadout_loadoutApplied",0] call CBA_fnc_removeEventHandler;

	[{
		player addItem "hgun_Pistol_Signal_F";
	}, 5] call CBA_fnc_waitAndExecute;
	
	// radio nerfing
	["waitForInit", "OnRadiosReceived", {
	    [call TFAR_fnc_activeSwRadio, "50.0"] call TFAR_fnc_setSwFrequency;
		player setVariable ["tf_receivingDistanceMultiplicator", 0.1];
		player setVariable ["tf_sendingDistanceMultiplicator", 0.1];
	    ["waitForInit","OnRadiosReceived"] call TFAR_fnc_removeEventHandler;
	}, player] call TFAR_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;





// eventhandler to catch healing
_pilot addEventHandler ["GetInMan", {
	params ["_unit", "_position", "_vehicle", "_turret"];

	missionNamespace setVariable ["GRAD_pilotTracking_pilotTrackingObj_vehicle", _unit, true];
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
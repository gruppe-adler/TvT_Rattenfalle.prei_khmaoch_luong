params ["_medic", "_pilot"];

private _duration = ["PilotHealingTime", 300] call BIS_fnc_getParamValue;

[_duration, [_medic, _pilot],
	{
		params ["_medic", "_pilot"];
		hint format ["healing success"];
	},
	{
		params ["_medic", "_pilot"];
		if (_pilot getVariable ["GRAD_pilotTracking_isBleeding",false]) then {
				hint format ["healing aborted"];
		} else {
				hint format ["healing success"];
		};

	},
		"Healing in progress",
	{
		params ["_medic", "_pilot"];
		(player getVariable ["GRAD_rattrap_pilotHealingInProgress", false])
	},
	[
		"isNotInside",
		"notOnMap",
		"isNotDead",
		"isNotInZeus"
	]
] call ace_common_fnc_progressBar;

// todo do animations

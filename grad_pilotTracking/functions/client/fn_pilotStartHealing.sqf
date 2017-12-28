params ["_unit"];

_unit setVariable ["GRAD_rattrap_pilotHealingStarted", true, true];


[20, [], 
	{

			hint format ["healing success %1", _this];
		player setVariable ["GRAD_pilotTracking_isBleeding",false, true];
		player setVariable ["GRAD_rattrap_pilotHealingStarted", false, true];
	}, 
	{

		hint format ["aborted healing %1", _this];
		player setVariable ["GRAD_pilotTracking_isBleeding",true, true];
		player setVariable ["GRAD_rattrap_pilotHealingStarted", false, true];
	}, 
		"Healing in progress",
	{
		(player getVariable ["GRAD_rattrap_pilotHealingStarted", false])
	},
	[
		"isNotInside",
		"notOnMap",
		"isNotDead",
		"isNotInZeus"
	]
] call ace_common_fnc_progressBar;	

/*
{
		!((_this select 0) getVariable ["GRAD_rattrap_pilotHealingStarted", false])
	}

	*/
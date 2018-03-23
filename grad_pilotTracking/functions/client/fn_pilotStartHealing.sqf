params ["_medic", "_pilot"];

missionNameSpace setVariable ["GRAD_rattrap_gettingHealedAnimations", ["GET HEALED ANIM"]];

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
_pilot playMoveNow "GET HEALED ANIM START"; // todo insert right animation

// todo do animations
_pilot addEventhandler ["AnimDone", {
		params ["_unit", "_anim"];

		if (!(_unit getVariable ["GRAD_rattrap_pilotHealingInProgress", false])) then {
				_unit removeEventhandler ["AnimDone", _thisEventHandler];
				_unit playMoveNow "ABORT HEALING ANIM"; // todo insert right animation
		} else {
				private _animationsPossible = missionNameSpace getVariable ["GRAD_rattrap_gettingHealedAnimations", ["GET HEALED  ANIM"]];
				_unit playMoveNow (selectRandom _animationsPossible);
		};
}];

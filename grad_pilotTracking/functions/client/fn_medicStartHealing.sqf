params ["_medic", "_pilot"];

missionNameSpace setVariable ["GRAD_rattrap_healingAnimations", ["HEALING ANIM"]];

_medic setVariable ["GRAD_rattrap_pilotHealingInProgress", true, true];
_pilot setVariable ["GRAD_rattrap_pilotHealingInProgress", true, true];

[_medic, _pilot] remoteExec ["GRAD_rattrap_fnc_pilotStartHealing", _pilot];

private _duration = ["PilotHealingTime", 300] call BIS_fnc_getParamValue;

[_duration, [_medic, _pilot],
	{
    params ["_medic", "_pilot"];
		hint format ["healing success"];
		_pilot setVariable ["GRAD_pilotTracking_isBleeding",false, true];
		_pilot setVariable ["GRAD_rattrap_pilotHealingInProgress", false, true];
		_medic setVariable ["GRAD_rattrap_pilotHealingInProgress", false, true];
	},
	{
    params ["_medic", "_pilot"];
		hint format ["healing aborted"];
		_pilot setVariable ["GRAD_pilotTracking_isBleeding",true, true];
		_pilot setVariable ["GRAD_rattrap_pilotHealingInProgress", false, true];
		_medic setVariable ["GRAD_rattrap_pilotHealingInProgress", false, true];
	},
		"Healing in progress",
	{
    params ["_medic", "_pilot"];
		_pilot getVariable ["GRAD_rattrap_pilotHealingInProgress", false])
	},
	[
		"isNotInside",
		"notOnMap",
		"isNotDead",
		"isNotInZeus"
	]
] call ace_common_fnc_progressBar;

_medic playMoveNow "HEALING ANIM START"; // todo insert right animation

// todo do animations
_medic addEventhandler ["AnimDone", {
		params ["_unit", "_anim"];

		if (!(_unit getVariable ["GRAD_rattrap_pilotHealingInProgress", false])) then {
				_unit removeEventhandler ["AnimDone", _thisEventHandler];
				_unit playMoveNow "ABORT HEALING ANIM"; // todo insert right animation
		} else {
				private _animationsPossible = missionNameSpace getVariable ["GRAD_rattrap_healingAnimations", ["HEALING ANIM"]];
				_unit playMoveNow (selectRandom _animationsPossible);
		};
}];

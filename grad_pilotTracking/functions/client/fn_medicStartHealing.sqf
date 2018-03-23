params ["_medic", "_pilot"];

private _healingAnimations = [
	"Acts_TreatingWounded01",
	"Acts_TreatingWounded02",
	"Acts_TreatingWounded03",
	"Acts_TreatingWounded04",
	"Acts_TreatingWounded05",
	"Acts_TreatingWounded06"
];

missionNameSpace setVariable ["GRAD_rattrap_healingAnimations", _healingAnimations];

_medic setVariable ["GRAD_rattrap_pilotHealingInProgress", true, true];
_pilot setVariable ["GRAD_rattrap_pilotHealingInProgress", true, true];

[_medic, _pilot] remoteExec ["GRAD_pilotTracking_fnc_pilotStartHealing", _pilot];

private _duration = ["PilotHealingTime", 300] call BIS_fnc_getParamValue;

[_duration, [_medic, _pilot],
	{
		_this params ["_parameter"];
    	_parameter params ["_medic", "_pilot"];

		hint format ["healing success"];
		_pilot setVariable ["GRAD_pilotTracking_isBleeding",false, true];
		_pilot setVariable ["GRAD_rattrap_pilotHealingInProgress", false, true];
		_medic setVariable ["GRAD_rattrap_pilotHealingInProgress", false, true];
	},
	{
    	_this params ["_parameter"];
    	_parameter params ["_medic", "_pilot"];

		hint format ["healing aborted"];
		_pilot setVariable ["GRAD_pilotTracking_isBleeding",true, true];
		_pilot setVariable ["GRAD_rattrap_pilotHealingInProgress", false, true];
		_medic setVariable ["GRAD_rattrap_pilotHealingInProgress", false, true];
	},
		"Healing in progress",
	{
    	player getVariable ["GRAD_rattrap_pilotHealingInProgress", false]
	},
	[
		"isNotInside",
		"notOnMap",
		"isNotDead",
		"isNotInZeus"
	]
] call ace_common_fnc_progressBar;

_medic playMoveNow "Acts_TreatingWounded_in";

// todo do animations
_medic addEventhandler ["AnimDone", {
		params ["_unit", "_anim"];

		if (!alive _unit) exitWith { _unit removeEventhandler ["AnimDone", _thisEventHandler]; };

		if (!(_unit getVariable ["GRAD_rattrap_pilotHealingInProgress", false])) then {
				_unit removeEventhandler ["AnimDone", _thisEventHandler];
				_unit playMoveNow "Acts_TreatingWounded_Out"; // todo insert right animation
		} else {
				private _animationsPossible = missionNameSpace getVariable ["GRAD_rattrap_healingAnimations", ["Acts_TreatingWounded01"]];
				_unit playMoveNow (selectRandom _animationsPossible);
		};
}];

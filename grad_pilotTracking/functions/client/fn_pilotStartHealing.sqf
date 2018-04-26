params ["_medic", "_pilot"];

private _gettingHealedAnimations = [
	"UnconsciousReviveLegs_A",
	"UnconsciousReviveBody_A",
	"UnconsciousReviveDefault_A",
	"UnconsciousReviveHead_C",
	"Acts_CivilInjuredLegs_1"
];

missionNameSpace setVariable ["GRAD_rattrap_gettingHealedAnimations", _gettingHealedAnimations];

private _duration = ["PilotHealingTime", 300] call BIS_fnc_getParamValue;

[_duration, [_medic, _pilot],
	{
		_this params ["_parameter"];
    	_parameter params ["_medic", "_pilot"];

		hint format ["healing success"];
	},
	{
		_this params ["_parameter"];
    	_parameter params ["_medic", "_pilot"];

		if (_pilot getVariable ["GRAD_pilotTracking_isBleeding",false]) then {
				hint format ["healing aborted"];
        _pilot setVariable ["GRAD_rattrap_pilotHealingInProgress", false, true];
        _medic setVariable ["GRAD_rattrap_pilotHealingInProgress", false, true];
		} else {
				hint format ["healing success"];
		};

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

// todo do animations
_pilot playMoveNow "AinjPpneMstpSnonWnonDnon_rolltoback"; // todo insert right animation

// todo do animations
_pilot addEventhandler ["AnimDone", {
		params ["_unit", "_anim"];

		if (!alive _unit) exitWith { _unit removeEventhandler ["AnimDone", _thisEventHandler]; };

		if (!(_unit getVariable ["GRAD_rattrap_pilotHealingInProgress", false])) then {
				_unit removeEventhandler ["AnimDone", _thisEventHandler];
				_unit playMoveNow "AinjPpneMstpSnonWnonDnon_rolltofront"; // todo insert right animation
				_unit playMove "Stand";
		} else {
				private _gettingHealedAnimations = missionNameSpace getVariable ["GRAD_rattrap_gettingHealedAnimations", ["UnconsciousReviveLegs_A"]];
				_unit playMoveNow (selectRandom _gettingHealedAnimations);
		};
}];

params ["_unit", "_state"];

private _isNearTarget = [_unit, GRAD_EXECUTIONERCAM_TARGETS_OPFOR] call grad_executionerCam_fnc_isNearTargets;

if (
	_state && 
	!objNull _isNearTarget &&
	!(_unit getVariable ["GRAD_executionerCam_isTriggered", false])
) then {	
	_unit setVariable ["GRAD_executionerCam_isTriggered", true];
	[_unit] remoteExec ["GRAD_executionerCam_fnc_forceAnimation", _unit];
	[_unit, _isNearTarget] remoteExec ["GRAD_executionerCam_fnc_forceCameraFeed", _unit];
};

if (!_state) then {
	_unit removeAllEventHandlers ["AnimDone", {}];
};
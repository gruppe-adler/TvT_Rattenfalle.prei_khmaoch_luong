_turnOn = ["CameraOn", "Turn Cam On", "", {
	[_player, _target] remoteExec ["GRAD_pilotCam_fnc_camTurnOnServer", [0,2] select isDedicated];
	_target setVariable ["GRAD_pilotCam_camIsOn", true, true];
},
{!(_target getVariable ["GRAD_pilotCam_camIsOn", false])}] call ace_interact_menu_fnc_createAction;

["Camera1", 0, ["ACE_MainActions"], _turnOn, true] call ace_interact_menu_fnc_addActionToClass;


_turnOff = ["CameraOff", "Turn Cam Off", "", {
	_target setVariable ["GRAD_pilotCam_camIsOn", false, true];
},
{(_target getVariable ["GRAD_pilotCam_camIsOn", false])}] call ace_interact_menu_fnc_createAction;

["Camera1", 0, ["ACE_MainActions"], _turnOff, true] call ace_interact_menu_fnc_addActionToClass;


player addEventHandler ["GetInMan", {

	_cameraRunningParams = missionNamespace getVariable ["GRAD_pilotCam_cameraRunningParams", []];

	if (count _cameraRunningParams > 0) then {
		_cameraRunningParams params ["_camObj", "_relPos", "_targetObject", "_area", "_progressBar", "_pipcamObject", "_pipcamVehicle"];
		missionNamespace setVariable ["GRAD_pilotCam_cameraRunningParams", []];

		[{
				params ["_camObj", "_relPos", "_targetObject", "_area"];	

				[_camObj, _relPos, _targetObject, _area] call GRAD_pilotCam_fnc_camTurnOnPlayer;

		}, [_camObj, _relPos, _targetObject, _area], 2] call CBA_fnc_waitAndExecute;
	};		
}];

player addEventHandler ["GetOutMan", {

	_cameraRunningParams = missionNamespace getVariable ["GRAD_pilotCam_cameraRunningParams", []];

	if (count _cameraRunningParams > 0) then {
		_cameraRunningParams params ["_camObj", "_relPos", "_targetObject", "_area", "_progressBar", "_pipcamObject", "_pipcamVehicle"];
		missionNamespace setVariable ["GRAD_pilotCam_cameraRunningParams", []];

		[{
				params ["_camObj", "_relPos", "_targetObject", "_area"];	

				[_camObj, _relPos, _targetObject, _area] call GRAD_pilotCam_fnc_camTurnOnPlayer;

		}, [_camObj, _relPos, _targetObject, _area], 2] call CBA_fnc_waitAndExecute;
	};		
}];
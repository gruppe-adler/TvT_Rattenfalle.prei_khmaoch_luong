params ["_camObj", "_relPos", "_area"];

private _pipcamObject = [_relPos, _area] call GRAD_pilotCam_fnc_pipStart;
private _pipDisplay = uinamespace getVariable "rscPilotCamPip";
private _progressBar = _pipDisplay displayCtrl 2301;
private _camAreaProgressArray = [];

// store those things global, needed to restart cam to workaround bugs
missionNamespace setVariable ["GRAD_pilotCam_cameraRunningParams", [_camObj, _relPos, _area, _pipcamObject]];

if (player getVariable ["GRAD_pilotTracking_isPilot", false]) then {
    _camAreaProgressArray = [_area] call GRAD_pilotCam_fnc_showCamAreaBar;
};

// loop progress and abort if necessary
[{
	params ["_args", "_handle"];
	_args params ["_camObj", "_pipcamObject", "_progressBar", "_camAreaProgressArray"];

	if (!(_camObj getVariable ["GRAD_pilotCam_camIsOn", false])) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			[(_camAreaProgressArray select 0)] call CBA_fnc_removePerFrameHandler;
			ctrldelete (_camAreaProgressArray select 1);
			[_pipcamObject, _progressBar] call GRAD_pilotCam_fnc_camTurnOffPlayer;
	};

	if (count (missionNamespace getVariable ["GRAD_pilotCam_cameraRunningParams", []]) < 1) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		[(_camAreaProgressArray select 0)] call CBA_fnc_removePerFrameHandler;
		ctrldelete (_camAreaProgressArray select 1);
		[_pipcamObject, _progressBar] call GRAD_pilotCam_fnc_camTurnOffPlayer;
	};

	_progressBar progressSetPosition (linearConversion [0, GRAD_pilotCam_RECORDING_DURATION, GRAD_pilotCam_RECORDING_DONE, 0, 1, true]);

}, 1, [_camObj, _pipcamObject, _progressBar, _camAreaProgressArray]] call CBA_fnc_addPerFrameHandler;
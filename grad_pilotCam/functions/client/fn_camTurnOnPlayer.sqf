params ["_camObj", "_relPos", "_area"];

private _pipcamObject = ["renderPIPtarget0", _relPos, _area] call GRAD_pilotCam_fnc_pipStart;

// private _progressBar = call GRAD_pilotCam_fnc_createProgressBarPlayer;
private _pipDisplay = uinamespace getVariable "rscPilotCamPip";
private _progressBar = _pipDisplay displayCtrl 2301;

// camera recording UI in PiP
// get size of pip display
/*
private _contentConfig = configfile >> "RscTitles" >> "RscPIP" >> "controlsBackground" >> "PIP";
private _contentX = getnumber (_contentConfig >> "x");
private _contentY = getnumber (_contentConfig >> "y");
private _contentW = getnumber (_contentConfig >> "w");
private _contentH = getnumber (_contentConfig >> "h");

"cameraOverlay" cutRsc ["RscTitleDisplayEmpty", "PLAIN"];
private _display = uiNamespace getVariable ["RscTitleDisplayEmpty",displayNull];
private _background = _display ctrlCreate ["RscPicture",-1];
_background ctrlSetText "GRAD_pilotCam\data\campic6.paa";
_background ctrlSetPosition [_contentX,_contentY,_contentW, _contentH];
_background ctrlCommit 0;
*/


// store those things global, needed to restart cam to workaround bugs
missionNamespace setVariable ["GRAD_pilotCam_cameraRunningParams", [_camObj, _relPos, _area, _pipcamObject]];

// loop progress and abort if necessary
[{
	params ["_args", "_handle"];
	_args params ["_camObj", "_pipcamObject", "_progressBar"];

	if (!(_camObj getVariable ["GRAD_pilotCam_camIsOn", false])) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			[_pipcamObject, _progressBar] call GRAD_pilotCam_fnc_camTurnOffPlayer;
	};

	if (count (missionNamespace getVariable ["GRAD_pilotCam_cameraRunningParams", []]) < 1) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		[_pipcamObject, _progressBar] call GRAD_pilotCam_fnc_camTurnOffPlayer;
	};

	_progressBar progressSetPosition (linearConversion [0, GRAD_pilotCam_RECORDING_DURATION, GRAD_pilotCam_RECORDING_DONE, 0, 1, true]);

}, 1, [_camObj, _pipcamObject, _progressBar]] call CBA_fnc_addPerFrameHandler;

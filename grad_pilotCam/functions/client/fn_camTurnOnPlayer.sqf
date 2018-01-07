params ["_camObj", "_relPosASL", "_targetObject", "_area"];


private _pipcamVehicle = "Sign_Pointer_Yellow_F" createVehicleLocal [0,0,0]; //Sign_Pointer_Yellow_F
_pipcamVehicle setObjectTextureGlobal [0,"#(argb,8,8,3)color(0,0,0,0)"];
_pipcamVehicle setPosASL _relPosASL;

sleep 0.1;
_pipcamVehicle attachTo [_targetObject];
sleep 0.5;
private _camPos = ([0,0,0]);


private _pipcamObject = ["renderPIPtarget0",[[_pipcamVehicle,_camPos],_targetObject],_pipcamVehicle] call BIS_fnc_PIP;
"renderPIPtarget0" setPiPEffect [3,1,1,0.4,0,[0,0,0,0],[1,1,1,0],[1,1,1,1]];

// zoom pip object to same levels as original cam
_pipcamObject camSetTarget _targetObject;
_pipcamObject camSetFocus [5, 1];
_pipcamObject camSetFov 0.5;
_pipcamObject camCommit 0;


private _progressBar = call GRAD_pilotCam_fnc_createProgressBarPlayer;

// camera recording UI in PiP
// get size of pip display
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



// store those things global, needed to restart cam to workaround bugs
missionNamespace setVariable ["GRAD_pilotCam_cameraRunningParams", [_camObj, _relPosASL, _targetObject, _area, _progressBar, _pipcamObject, _pipcamVehicle]];

// loop progress and abort if necessary
[{
	params ["_args", "_handle"];
	_args params ["_camObj", "_pipcamObject", "_pipcamVehicle", "_progressBar", "_targetObject"];

	if (!(_camObj getVariable ["GRAD_pilotCam_camIsOn", false])) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			[_pipcamObject, _pipcamVehicle, _progressBar] call GRAD_pilotCam_fnc_camTurnOffPlayer;
	};

	if (count (missionNamespace getVariable ["GRAD_pilotCam_cameraRunningParams", []]) < 1) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		[_pipcamObject, _pipcamVehicle, _progressBar] call GRAD_pilotCam_fnc_camTurnOffPlayer;
	};
	
	_progressBar progressSetPosition (linearConversion [0, GRAD_pilotCam_RECORDING_DURATION, GRAD_pilotCam_RECORDING_DONE, 0, 1, true]);

}, 1, [_camObj, _pipcamObject, _pipcamVehicle, _progressBar, _targetObject]] call CBA_fnc_addPerFrameHandler;

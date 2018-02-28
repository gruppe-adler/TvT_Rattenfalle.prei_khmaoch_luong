// ["renderPIPtarget0",[[_pipcamVehicle,_camPos],_targetObject],_pipcamVehicle]
params ["_camPos", "_area"];

private ["_cam", "_r2t"];

disableSerialization;
"rscPilotCam" cutRsc ["rscPilotCamPip","PLAIN",0,true];

private _targetPos = getPos _area;
_targetPos set [2, ((_targetPos select 2) + 1.1)];

private _pipDisplay = uinamespace getVariable "rscPilotCamPip";
private _pipPIPCtrl = _pipDisplay displayCtrl 2300;

if (isNull _pipPIPCtrl) exitWith {
  diag_log format ["error: no pip ctrl %1 found", _pipPIPCtrl];
};

_cam = "camera" camCreate _camPos;
_r2t = "renderTargetPiP"; // just an identifier, no magic
_cam cameraEffect ["INTERNAL", "BACK", _r2t]; // FRONT

_cam camSetTarget _targetPos;
// zoom pip object to same levels as original cam
_cam camSetFocus [5, 1];
_cam camSetFov 0.5;
_cam camPreload 0;
_cam camCommit 0;
_r2t setPiPEffect [3,1,1,0.4,0,[0,0,0,0],[1,1,1,0],[1,1,1,1]];

_pipPIPCtrl ctrlsettext format ["#(argb,256,256,1)r2t(%1,1.0)",_r2t];

_cam
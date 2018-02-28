// ["renderPIPtarget0",[[_pipcamVehicle,_camPos],_targetObject],_pipcamVehicle]
params ["_rendertarget", "_camPos", "_area"];

private ["_cam"];

disableSerialization;
"rscPilotCam" cutRsc ["rscPilotCamPip","PLAIN",0,true];

private _targetPos = getPos _area;
_targetPos set [2, ((_targetPos select 2) + 1.1)];

private _pipDisplay = uinamespace getVariable "rscPilotCamPip";
private _pipPIPCtrl = _pipDisplay displayCtrl 2300;

if (isNull _pipPIPCtrl) exitWith {
  diag_log format ["error: no pip ctrl %1 found", _pipPIPCtrl];
};

private _cam = "camera" camCreate _camPos;
_cam cameraEffect ["INTERNAL", "BACK", _rendertarget]; // FRONT

_cam camSetTarget _targetPos;
// zoom pip object to same levels as original cam
_cam camSetFocus [5, 1];
_cam camSetFov 0.5;
_cam camPreload 0;
_cam camCommit 0;
_rendertarget setPiPEffect [3,1,1,0.4,0,[0,0,0,0],[1,1,1,0],[1,1,1,1]];

_pipPIPCtrl ctrlsettext format ["#(argb,256,256,1)r2t(%1,1.0)",_rendertarget];

_cam
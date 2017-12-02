params ["_unit", "_camObj"];

_cam = "camera" camCreate (position _camObj);
_cam camSetTarget _unit;
_cam cameraEffect ["internal", "back"];
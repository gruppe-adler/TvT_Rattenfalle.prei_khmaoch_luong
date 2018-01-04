params [["_cam", objNull], ["_effectsArray", []], "_progressBar"];

ctrlDelete _progressBar;
_effectsArray params ["_ppcolor", "_ppgrain", "_display", "_background"];

if (!isNil "_ppcolor") then {
	ppEffectDestroy [_ppcolor, _ppgrain];
};
if (!isNull _cam) then {
	_cam cameraEffect ["terminate", "back"];
};

"camOverlayStatic" cutRsc ["RscStatic", "PLAIN" , 1];
"cameraOverlay" cutRsc ["Default", "PLAIN"];

switch (missionNamespace getVariable ["GRAD_pilotCam_reasonForShutOff", "none"]) do {
	case "shutter": { hint "Camera switched off by someone."; };
	case "end": { hint "Video recorded successfully."; };
	case "left": { hint "Pilot not in Camera View. Aborting filming."; };
	default {hint "Camera failed due to unknown reason.";};
};
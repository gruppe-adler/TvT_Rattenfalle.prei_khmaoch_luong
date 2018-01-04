params ["_pipCam", "_pipcamVehicle", "_progressBar"];

ctrlDelete _progressBar;
_pipCam cameraEffect ["terminate","back"];
camDestroy _pipCam;
["renderPIPtarget0"] call BIS_fnc_PIP;
detach _pipcamVehicle;
deleteVehicle _pipcamVehicle;

"cameraOverlay" cutRsc ["Default", "PLAIN"];

switch (missionNamespace getVariable ["GRAD_pilotCam_reasonForShutOff", "none"]) do {
	case "shutter": { hint "Camera switched off by someone."; };
	case "end": { hint "Video recorded successfully."; };
	case "left": { hint "Pilot not in Camera View. Aborting filming."; };
	default {hint "Camera failed due to unknown reason.";};
};
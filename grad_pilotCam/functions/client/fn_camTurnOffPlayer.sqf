params ["_pipCam", "_progressBar"];

ctrlDelete _progressBar;
_pipCam cameraEffect ["terminate","back"];
camDestroy _pipCam;
call GRAD_pilotCam_fnc_pipEnd;
"cameraOverlay" cutRsc ["Default", "PLAIN"];

switch (missionNamespace getVariable ["GRAD_pilotCam_reasonForShutOff", "none"]) do {
	case "shutter": { hint "Camera switched off by someone."; };
	case "end": { hint "Video recorded successfully."; };
	case "pilotleft": { hint "Pilot not in Camera View. Aborting filming."; };
	default {hint "Camera failed due to unknown reason.";};
};

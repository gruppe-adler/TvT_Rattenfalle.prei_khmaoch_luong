call GRAD_pilotCam_fnc_addInteractionToCams;

GRAD_pilotCam_RECORDING_DURATION = ["PilotRecordingTime", 300] call BIS_fnc_getParamValue; // seconds;
publicVariable "GRAD_pilotCam_RECORDING_DURATION";
GRAD_pilotCam_RECORDING_DONE = 0;
publicVariable "GRAD_pilotCam_RECORDING_DONE";

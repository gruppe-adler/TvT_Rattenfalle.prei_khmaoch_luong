call GRAD_pilotCam_fnc_addInteractionToCams;

GRAD_pilotCam_RECORDING_DURATION_BLUFOR = ["PilotRecordingTime", 300] call BIS_fnc_getParamValue; // seconds;
publicVariable "GRAD_pilotCam_RECORDING_DURATION_BLUFOR";

GRAD_pilotCam_RECORDING_DURATION_OPFOR = GRAD_pilotCam_RECORDING_DURATION_BLUFOR;
publicVariable "GRAD_pilotCam_RECORDING_DURATION_OPFOR";

GRAD_pilotCam_RECORDING_DONE = 0;
publicVariable "GRAD_pilotCam_RECORDING_DONE";

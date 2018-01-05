params ["_camObj", "_reason"];

// disable server loop
private _handle = missionNamespace getVariable ["GRAD_pilotCam_serverFrameHandler", _handle];
private _targetObject = missionNamespace getVariable ["GRAD_pilotCam_targetObject", _targetObject];

deleteVehicle _targetObject;
[_handle] call CBA_fnc_removePerFrameHandler;


// inform clients about reason for switchoff
missionNamespace setVariable ["GRAD_pilotCam_reasonForShutOff", _reason, true];

// resets recording time
GRAD_pilotCam_RECORDING_DONE = 0;

// sets cam to off
_camObj setVariable ["GRAD_pilotCam_camIsOn", false, true];
missionNamespace setVariable ["GRAD_pilotCam_camRunning", false];
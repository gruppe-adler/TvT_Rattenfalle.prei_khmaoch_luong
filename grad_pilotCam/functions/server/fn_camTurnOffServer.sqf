params ["_camObj", "_reason", ["_winner", civilian]];

// disable server loop
private _handle = missionNamespace getVariable ["GRAD_pilotCam_serverFrameHandler", -1];
private _targetObject = missionNamespace getVariable ["GRAD_pilotCam_targetObject", objNull];

if (!isNull _targetObject) then {
	// give clients room to switch off cams beforehand
	[{deleteVehicle _this;}, _targetObject, 3] call CBA_fnc_waitAndExecute;
};

if (_handle > -1) then {
	[_handle] call CBA_fnc_removePerFrameHandler;
};


// inform clients about reason for switchoff
missionNamespace setVariable ["GRAD_pilotCam_reasonForShutOff", _reason, true];

if (_reason == "end") then {
	[_winner] call rattrap_objectives_fnc_endGame;	
};

// resets recording time
GRAD_pilotCam_RECORDING_DONE = 0;

// sets cam to off
_camObj setVariable ["GRAD_pilotCam_camIsOn", false, true];
missionNamespace setVariable ["GRAD_pilotCam_camRunning", false];
if (!(player getVariable ["GRAD_pilotTracking_isPilot", false])) exitWith {};

// positions of camera
GRAD_EXECUTIONERCAM_TARGETS_BLUFOR = [[[0,0,0],objektname]];
GRAD_EXECUTIONERCAM_TARGETS_OPFOR = [[[0,0,0], objektname]];

["ace_interact_tapShoulder", GRAD_executionerCam_fnc_onTapShoulder] call CBA_fnc_addEventHandler;
["ace_captiveStatusChanged", GRAD_executionerCam_fnc_onSurrender] call CBA_fnc_addEventHandler;
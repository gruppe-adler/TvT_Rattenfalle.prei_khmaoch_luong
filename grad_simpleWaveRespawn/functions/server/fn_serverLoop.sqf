GRAD_SIMPLEWAVERESPAWN_DURATION = 300;
publicVariable "GRAD_SIMPLEWAVERESPAWN_DURATION";

GRAD_SIMPLEWAVERESPAWN_STARTTIME = CBA_missionTime + 1; // prevent dividing through zero
publicVariable "GRAD_SIMPLEWAVERESPAWN_STARTTIME";

[{
    params ["_args", "_handle"];
    _args params ["_startTime"];

    [5] remoteExec ["setPlayerRespawnTime", [0,-2] select isDedicated, false];

},GRAD_SIMPLEWAVERESPAWN_DURATION,[_startTime]] call CBA_fnc_addPerFrameHandler;
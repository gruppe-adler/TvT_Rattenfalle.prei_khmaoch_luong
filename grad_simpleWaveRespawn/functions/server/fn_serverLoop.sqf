GRAD_SIMPLEWAVERESPAWN_DURATION = 15;
publicVariable "GRAD_SIMPLEWAVERESPAWN_DURATION";

[{
    params ["_args", "_handle"];

    GRAD_SIMPLEWAVERESPAWN_STARTTIME = CBA_missionTime + 1; // prevent dividing through zero
	publicVariable "GRAD_SIMPLEWAVERESPAWN_STARTTIME";


	private _allDeadPlayersExceptPilot = [];
	{
		if (!(_x getVariable ["GRAD_pilotTracking_isPilot", false]) && (side _x isEqualTo civilian)) then {
			_allDeadPlayersExceptPilot append [_x];
		};
	} forEach allPlayers;
	
	if (count _allDeadPlayersExceptPilot > 0) then {
    	[] remoteExec ["GRAD_simpleWaveRespawn_fnc_forceRespawn", _allDeadPlayersExceptPilot, false];
    	diag_log format ["_allDeadPlayersExceptPilot %1", _allDeadPlayersExceptPilot];
    };

},GRAD_SIMPLEWAVERESPAWN_DURATION,[]] call CBA_fnc_addPerFrameHandler;
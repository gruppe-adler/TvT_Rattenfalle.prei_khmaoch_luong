GRAD_SIMPLEWAVERESPAWN_DURATION = 15;
publicVariable "GRAD_SIMPLEWAVERESPAWN_DURATION";

[{
    params ["_args", "_handle"];

    GRAD_SIMPLEWAVERESPAWN_ENDTIME = CBA_missionTime + GRAD_SIMPLEWAVERESPAWN_DURATION; // prevent dividing through zero
	publicVariable "GRAD_SIMPLEWAVERESPAWN_ENDTIME";


	private _allDeadPlayersExceptPilot = [];
	{
		if (_x getVariable ["GRAD_pilotTracking_isWaitingForRespawn", false]) then {
			_allDeadPlayersExceptPilot append [_x];
		};
	} forEach allPlayers;
	
	if (count _allDeadPlayersExceptPilot > 0) then {
    	[] remoteExec ["GRAD_simpleWaveRespawn_fnc_forceRespawn", _allDeadPlayersExceptPilot, false];
    	diag_log format ["_allDeadPlayersExceptPilot %1", _allDeadPlayersExceptPilot];
    };

},GRAD_SIMPLEWAVERESPAWN_DURATION,[]] call CBA_fnc_addPerFrameHandler;
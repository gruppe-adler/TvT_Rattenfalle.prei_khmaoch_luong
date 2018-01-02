GRAD_SIMPLEWAVERESPAWN_DURATION = 300;
publicVariable "GRAD_SIMPLEWAVERESPAWN_DURATION";

[{
    params ["_args", "_handle"];

    GRAD_SIMPLEWAVERESPAWN_STARTTIME = CBA_missionTime + 1; // prevent dividing through zero
	publicVariable "GRAD_SIMPLEWAVERESPAWN_STARTTIME";

	_allPlayersExceptPilot = allPlayers;
	if (_x getVariable ["GRAD_pilotTracking_isPilot", false]) then {
		_allPlayersExceptPilot = _allPlayersExceptPilot - [_x];
	};
	
    [5] remoteExec ["setPlayerRespawnTime", _allPlayersExceptPilot, false];

},GRAD_SIMPLEWAVERESPAWN_DURATION,[]] call CBA_fnc_addPerFrameHandler;
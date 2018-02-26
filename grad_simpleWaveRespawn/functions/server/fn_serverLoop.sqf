GRAD_SIMPLEWAVERESPAWN_DURATION = ["RespawnLoopTime", 420] call BIS_fnc_getParamValue;
publicVariable "GRAD_SIMPLEWAVERESPAWN_DURATION";

GRAD_SIMPLEWAVERESPAWN_COUNT_MAX = ["RespawnCountMax", 3] call BIS_fnc_getParamValue;
publicVariable "GRAD_SIMPLEWAVERESPAWN_COUNT_MAX";

GRAD_SIMPLEWAVERESPAWN_PILOT_PENALTY = ["RespawnPenaltyPilot", 60*20] call BIS_fnc_getParamValue;
publicVariable "GRAD_SIMPLEWAVERESPAWN_PILOT_PENALTY";

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

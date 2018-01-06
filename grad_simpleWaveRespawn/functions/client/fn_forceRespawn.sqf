if (!hasInterface) exitWith {};

player setVariable ["GRAD_simpleWaveRespawn_respawning", true];
setPlayerRespawnTime 0;

[false] call ace_spectator_fnc_setSpectator;
[player, false] call TFAR_fnc_forceSpectator;

[{
	alive player
}, {
	setPlayerRespawnTime 999999;
	player setVariable ["GRAD_simpleWaveRespawn_respawning", false];
	player setVariable ["GRAD_pilotTracking_isWaitingForRespawn", false, true];
}, []] call CBA_fnc_waitUntilAndExecute;
if (!hasInterface) exitWith {};
if (player getVariable ["GRAD_simpleWaveRespawn_respawnCount", 0] > GRAD_SIMPLEWAVERESPAWN_COUNT_MAX) exitWith {
		diag_log format ["cant respawn, max respawns reached"];
};

player setVariable ["GRAD_simpleWaveRespawn_respawning", true];
setPlayerRespawnTime 0;

[false] call ace_spectator_fnc_setSpectator;
[player, false] call TFAR_fnc_forceSpectator;
// 60 call TFAR_fnc_setVoiceVolume; // reset voice volume

[{
	alive player
}, {
	setPlayerRespawnTime 999999;
	private _count = player getVariable ["GRAD_simpleWaveRespawn_respawnCount", 0];
	player setVariable ["GRAD_simpleWaveRespawn_respawnCount", (_count + 1)];
	player setVariable ["GRAD_simpleWaveRespawn_respawning", false];
	player setVariable ["GRAD_pilotTracking_isWaitingForRespawn", false, true];

	if (player getVariable ["GRAD_pilotTracking_wasPilot", false]) then {
		player setPos getMarkerPos "mrk_spawn_blufor_1";

		diag_log format ["player respawning is pilot"];
	};

}, []] call CBA_fnc_waitUntilAndExecute;

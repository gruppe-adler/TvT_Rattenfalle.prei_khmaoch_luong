if (!hasInterface) exitWith {};

player setVariable ["GRAD_simpleWaveRespawn_respawning", true];
setPlayerRespawnTime 1;
forceRespawn player;
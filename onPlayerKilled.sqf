"grad_gpsTracker_layer" cutFadeout 0.5;

_handle = execVM "player\createDeathCam.sqf";
waitUntil {scriptdone _handle};
cutText ["", "BLACK IN", 1];
 
// todo: add free cams for dead pilots
[allUnits,true] call ace_spectator_fnc_updateUnits;
[[west,east,independent,civilian], []] call ace_spectator_fnc_updateSpectatableSides;
[true] call ace_spectator_fnc_setSpectator;
[player, true] call TFAR_fnc_forceSpectator;

[] call grad_simpleWaveRespawn_fnc_showRemainingTime;
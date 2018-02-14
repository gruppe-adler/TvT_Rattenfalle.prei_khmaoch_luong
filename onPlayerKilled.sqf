params ["_player", "_killer"];

// dont start shit if not necessary
if (_player getVariable ["GRAD_simpleWaveRespawn_respawning", false]) exitWith {};

"grad_gpsTracker_layer" cutFadeout 0.5;

// remove radio to prevent taking an enemys radio
private _items = items _player;
{
	_isHandheld = _x isKindOf ["ItemRadio", configFile >> "CfgWeapons"];
	_isLongrange = _x isKindOf "TFAR_Bag_Base";

	if (_isHandheld || _isLongrange) then {
		_player unlinkItem typeOf _x;
	};
} forEach _items;

_handle = execVM "player\createDeathCam.sqf";
waitUntil {scriptdone _handle};
cutText ["", "BLACK IN", 1];

private _enemySides = [west,east,independent,civilian] - [playerSide];
[[playerSide], _enemySides] call ace_spectator_fnc_updateSides;

// give pilot free cam
if (player getVariable ["GRAD_pilotTracking_isPilot",false]) then {
	[[0,1,2],[]] call ace_spectator_fnc_updateCameraModes;
} else {
	[[1,2], [0]] call ace_spectator_fnc_updateCameraModes;
};

[[-2,-1], [0,1,2,3,4,5,6,7]] call ace_spectator_fnc_updateVisionModes;
[1, objNull] call ace_spectator_fnc_setCameraAttributes;

[true] call ace_spectator_fnc_setSpectator;
[player, true] call TFAR_fnc_forceSpectator;

// everyone respawns now
player setVariable ["GRAD_pilotTracking_isWaitingForRespawn", true, true];

if (!(player getVariable ["GRAD_pilotTracking_isPilot",false])) then {
	call grad_simpleWaveRespawn_fnc_showRemainingTime;
} else {
	player setVariable ["GRAD_simpleWaveRespawn_respawnCount", 999999];

	_shooter = player getVariable ["ACE_medical_lastDamageSource",player];
	if (side _shooter isEqualTo west) then {
			[{
					player setVariable ["GRAD_simpleWaveRespawn_respawnCount", 0];
			}, (GRAD_SIMPLEWAVERESPAWN_PILOT_PENALTY + (5 * 60))] call CBA_fnc_waitAndExecute;
	} else {
			[{
					player setVariable ["GRAD_simpleWaveRespawn_respawnCount", 0];
			}, GRAD_SIMPLEWAVERESPAWN_PILOT_PENALTY] call CBA_fnc_waitAndExecute;
	};
};

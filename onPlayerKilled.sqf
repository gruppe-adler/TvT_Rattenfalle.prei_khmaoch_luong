#include "\z\ace\addons\main\script_component.hpp"

params ["_player", "_killer"];

// dont start shit if not necessary
if (_player getVariable ["GRAD_simpleWaveRespawn_respawning", false]) exitWith {};

"grad_gpsTracker_layer" cutFadeout 0.5;

// remove radio to prevent taking an enemys radio
// todo: does this work actually?
private _items = items _player;
{
	_isHandheld = _x isKindOf ["ItemRadio", configFile >> "CfgWeapons"];
	_isLongrange = _x isKindOf "TFAR_Bag_Base";

	if (_isHandheld || _isLongrange) then {
		_player unlinkItem typeOf _x;
	};
} forEach _items;

// DEATH CAM
GRAD_DEATHCAM_RUNNING = true;
[] spawn GRAD_deathcam_fnc_start;
waitUntil {!GRAD_DEATHCAM_RUNNING};

// SPECTATOR SETTINGS
private _enemySides = [west,east,independent,civilian] - [playerSide];
[[playerSide], _enemySides] call ace_spectator_fnc_updateSides;

// give pilot free cam
/*
if (player getVariable ["GRAD_pilotTracking_isPilot",false]) then {
	[[0,1,2],[]] call ace_spectator_fnc_updateCameraModes;
} else {
	[[1,2], [0]] call ace_spectator_fnc_updateCameraModes;
};
*/

[[1,2], [0]] call ace_spectator_fnc_updateCameraModes; // no free cam
[[-2,-1], [0,1,2,3,4,5,6,7]] call ace_spectator_fnc_updateVisionModes; // no thermal
[1, objNull] call ace_spectator_fnc_setCameraAttributes;

// disable respawn if max respawns reached
if (player getVariable ["GRAD_simpleWaveRespawn_respawnCount", 0] > GRAD_SIMPLEWAVERESPAWN_COUNT_MAX) exitWith {
		player setVariable ["GRAD_pilotTracking_isWaitingForRespawn", false, true];
		[[0,1,2],[]] call ace_spectator_fnc_updateCameraModes; // allow free cam
		[player, true] call TFAR_fnc_forceSpectator; // set to real spec channel
		60 call TFAR_fnc_setVoiceVolume; // just to be sure voice is allowed
		[[west,east,independent,civilian], []] call ace_spectator_fnc_updateSides; // allow all sides

		private _hintMsg = "You ended your last life and have free spectator now.";
		[_hintMsg] call EFUNC(common,displayTextStructured);
};

// lives left hint
private _hintMsg = format ["Adding to respawn queue. You have %1 lives left.", player getVariable ["GRAD_simpleWaveRespawn_respawnCount", 0]];
[_hintMsg] call EFUNC(common,displayTextStructured);

// ENGAGE SPECTATOR
[true] call ace_spectator_fnc_setSpectator;


// set voice level to zero, so specs cant talk to each other if not in free cam, default is 60
// 0 call TFAR_fnc_setVoiceVolume;

if (!(player getVariable ["GRAD_pilotTracking_isPilot",false])) then {
	call grad_simpleWaveRespawn_fnc_showRemainingTime;
	player setVariable ["GRAD_pilotTracking_isWaitingForRespawn", true, true];
} else {
	// SET PENALTY DELAY FOR PILOT
	player setVariable ["GRAD_simpleWaveRespawn_respawnCount", 999999];

	_shooter = player getVariable ["ACE_medical_lastDamageSource",player];
	if (side _shooter isEqualTo west) then {
			// EXTRA PENALTY IF TEAMKILL
			[{
					player setVariable ["GRAD_simpleWaveRespawn_respawnCount", 0];
			}, (GRAD_SIMPLEWAVERESPAWN_PILOT_PENALTY + (15 * 60))] call CBA_fnc_waitAndExecute;
	} else {
			[{
					player setVariable ["GRAD_simpleWaveRespawn_respawnCount", 0];
			}, (GRAD_SIMPLEWAVERESPAWN_PILOT_PENALTY + (5 * 60))] call CBA_fnc_waitAndExecute;
	};
};

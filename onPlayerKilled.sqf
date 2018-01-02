"grad_gpsTracker_layer" cutFadeout 0.5;


// remove radio to prevent taking an enemys radio
_items = items player;
{
	_isHandheld = _x isKindOf ["ItemRadio", configFile >> "CfgWeapons"];
	_isLongrange = _x isKindOf "TFAR_Bag_Base";

	if (_isHandheld || _isLongrange) then {
		player unlinkItem typeOf _x;
	};
} forEach _items;



_handle = execVM "player\createDeathCam.sqf";
waitUntil {scriptdone _handle};
cutText ["", "BLACK IN", 1];
 
// todo: add free cams for dead pilots
private _enemySides = [west,east,independent,civilian] - [playerSide];
[[playerSide], _enemySides] call ace_spectator_fnc_updateSides;
if (player getVariable ["GRAD_pilotTracking_isPilot",false]) then {
	[[0,1,2],[]] call ace_spectator_fnc_updateCameraModes;
} else {
	[[1,2], [0]] call ace_spectator_fnc_updateCameraModes;
};

[[-2,-1], [0,1,2,3,4,5,6,7]] call ace_spectator_fnc_updateVisionModes;
[1, objNull] call ace_spectator_fnc_setCameraAttributes;
[true] call ace_spectator_fnc_setSpectator;
[player, true] call TFAR_fnc_forceSpectator;

[] call grad_simpleWaveRespawn_fnc_showRemainingTime;
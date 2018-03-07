// SERVER CODE
if ( ! ( isServer ) ) exitWith {};

params ["_vehObj", ["_respawnWhenNotDead", true], ["_loopInterval", 5]];

// STORE THE VEHICLES DIRECTION, POSITION AND TYPE
private _vehDir = 		 getDir _vehObj;
private _vehPos = 		 getPos _vehObj;
private _vehType = 		 typeOf _vehObj;
private _displayName = 	 getText(configFile >> "CfgVehicles" >> _vehType >> "displayName");

// 5
[{
	params ["_args", "_handle"];
	_args params ["_vehObj", "_vehType", "_vehDir", "_vehPos", "_displayName"];

	if (isNull _vehObj) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
	};


	// diag_log format ["checking %1 for respawn", _displayName];


	if ( _respawnWhenNotDead && { ( alive _vehObj ) } && { ( canMove _vehObj ) && { { ( alive _x ) } count ( crew _vehObj ) == 0 }} ) exitWith {

			diag_log format ["vehicle %1 abandoned", _vehObj];
			[_vehType, _vehDir, _vehPos, _handle] call GRAD_simpleVehicleRespawn_fnc_check;
	};


	if ( !( alive _vehObj ) || { !( canMove _vehObj ) } ) exitWith {

			diag_log format ["vehicle %1 dead", _vehObj];
			[_vehType, _vehDir, _vehPos, _handle] call GRAD_simpleVehicleRespawn_fnc_check;
	};

}, _loopInterval, [_vehObj, _vehType, _vehDir, _vehPos, _displayName]] call CBA_fnc_addPerFrameHandler;

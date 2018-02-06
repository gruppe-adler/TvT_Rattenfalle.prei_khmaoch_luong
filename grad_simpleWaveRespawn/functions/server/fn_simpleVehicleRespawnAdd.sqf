// SERVER CODE
if ( ! ( isServer ) ) exitWith {};

params ["_vehObj", ["_respawnWhenNotDead", true]];

// STORE THE VEHICLES DIRECTION, POSITION AND TYPE
_vehDir = 		 getDir _vehObj;
_vehPos = 		 getPos _vehObj;
_vehType = 		 typeOf _vehObj;

[{
	params ["_args", "_handle"];
	_args params ["_vehObj", "_vehType", "_vehDir", "_vehPos"];

	if (isNull _vehObj) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
	};


	if ( _respawnWhenNotDead && { ( alive _vehObj ) } && { ( canMove _vehObj ) && { { ( alive _x ) } count ( crew _vehObj ) == 0 }} ) exitWith {

			diag_log format ["vehicle %1 abandoned", _vehObj];
			[_vehType, _vehDir, _vehPos, _handle] call GRAD_simpleWaveRespawn_fnc_simpleVehicleRespawnCheck;
	};


	if ( !( alive _veh ) || { !( canMove _veh ) } ) exitWith {

			diag_log format ["vehicle %1 dead", _vehObj];
			[_vehType, _vehDir, _vehPos, _handle] call GRAD_simpleWaveRespawn_fnc_simpleVehicleRespawnCheck;
	};

}, 5, [_vehObj, _vehType, _vehDir, _vehPos]] call CBA_fnc_addPerFrameHandler;

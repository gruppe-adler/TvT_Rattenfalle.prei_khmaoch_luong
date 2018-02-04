// SERVER CODE
if ( ! ( isServer ) ) exitWith {};

// PASSED ARGUMENTS ( OBJECT, ABANDONED DELAY, DESTROYED DELAY )
params ["_vehObj"];

// STORE THE VEHICLES NAME, DIRECTION, POSITION AND TYPE
_vehName =       vehicleVarName _vehObj;
_vehDir = 		 getDir _vehObj; 
_vehPos = 		 getPos _vehObj; 
_vehType = 		 typeOf _vehObj; 

[{
	params ["_args", "_handle"];
	_args params ["_vehObj", "_vehType", "_vehDir", "_vehPos"];
	
	if (isNull _vehObj) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
	};


	if ( ( alive _vehObj ) && { ( canMove _vehObj ) && { { ( alive _x ) } count ( crew _vehObj ) == 0 } } ) exitWith {

		diag_log format ["vehicle %1 abandoned", _vehObj];
			if ( _veh distance _vehPos > 10 ) then {

				private _positionEmpty = nearestObjects [_vehPos, ["LandVehicle", "Air"], sizeOf _vehType]; // (_vehPos findEmptyPosition [0,0,_vehType]);

				diag_log format ["vehicle %1 _positionEmpty", _positionEmpty];
				private _isRoom = count _positionEmpty isEqualTo 0;
					// if position is empty
					if (_isRoom) then {
							[_handle] call CBA_fnc_removePerFrameHandler;
							[_vehType, _vehDir, _vehPos] call GRAD_simpleWaveRespawn_fnc_spawnVehicle;
					};
			};
	};


	if ( !( alive _veh ) || { !( canMove _veh ) } ) exitWith {

		diag_log format ["vehicle %1 dead", _vehObj];
		
			if ( _veh distance _vehPos > 10 ) then {
					// if position is empty
					private _positionEmpty = nearestObjects [_vehPos, ["LandVehicle", "Air"], sizeOf _vehType]; // (_vehPos findEmptyPosition [0,0,_vehType]);

					diag_log format ["vehicle %1 _positionEmpty", _positionEmpty];
					private _isRoom = count _positionEmpty isEqualTo 0;
					// if position is empty
					if (_isRoom) then {
							[_handle] call CBA_fnc_removePerFrameHandler;
							[_vehType, _vehDir, _vehPos] call GRAD_simpleWaveRespawn_fnc_spawnVehicle;
					};
			};
	};
	
}, 5, [_vehObj, _vehType, _vehDir, _vehPos]] call CBA_fnc_addPerFrameHandler;
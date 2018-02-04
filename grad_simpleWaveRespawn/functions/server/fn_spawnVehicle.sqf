params ["_vehtype", "_vehPos", "_vehDir"];

_veh = createVehicle [ _vehtype, [0,0,0], [], 0, "NONE" ];
_veh setVariable ["RHS_Decal_Enabled", false, true];
_veh setPos [ ( _vehPos select 0 ), ( _vehPos select 1 ), 0 ];
_veh setDir _vehDir;
[_veh] call GRAD_simpleWaveRespawn_fnc_setupVehicleAfterRespawn;
/*
    SERVER ONLY
*/

params ["_position"];

// find a random position in circle
private _crashSitePos = [_position, [20,70], random 360] call SHK_pos;

// find a spawn pos on given position
_veh1 = createVehicle ["RHS_AH1Z_GS", [_crashSitePos select 0, _crashSitePos select 1, .75], [], 0, "CAN_COLLIDE"];
[_veh1,	nil,["exhaust_hide", 1,	"at_rack_hide", 0]] call BIS_fnc_initVehicle;
_veh1 setVehicleAmmo 0;

_fire = "test_EmptyObjectForFireBig" createVehicle position _veh1;
_fire attachTo [_veh1, [0,0,0]];

[position _fire, _fire] remoteExec ["grad_fx_fnc_createLightPoint", 0, true];


_veh1 setObjectTextureGlobal [0, "\rhsafrf\addons\rhs_a2port_air\mi35\data\camo\mi24p_001_camo2_co.paa"];
_veh1 setObjectTextureGlobal [1, "\rhsafrf\addons\rhs_a2port_air\mi35\data\camo\mi24p_002_camo2_co.paa"];
_veh1 setObjectTextureGlobal [2, "rhsafrf\addons\rhs_a2port_air\Mi17\data\camo\mi8_det_g_camo1_co.paa"];

_veh1 allowDamage false;
_veh1 setDamage 0.95;
_veh1 setFuel 0.01;
clearItemCargoGlobal _veh1;
clearWeaponCargoGlobal _veh1;
clearMagazineCargoGlobal _veh1;
clearWeaponCargoGlobal _veh1;
sleep 0.1;
_veh2 = createVehicle ["CraterLong", [getPosATL _veh1 select 0, getPosATL _veh1 select 1, -0.3], [], 0, "CAN_COLLIDE"];
_smoke = [_veh1, "SMOKE_BIG"] call GRAD_fx_fnc_fireAndSmoke;
_smoke2 = [_veh1, "SMOKE_BIG"] call GRAD_fx_fnc_fireAndSmoke;

[_position] remoteExec ["GRAD_mission_helpers_fnc_createMarkerForSides", [0,-2] select isDedicated, true];

_crashSitePos

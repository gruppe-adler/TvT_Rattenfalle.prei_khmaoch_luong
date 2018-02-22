#include "\z\ace\addons\main\script_component.hpp"
#include "..\missionMacros.h"


createCrashSite=  {
	// find a random position in circle
	CRASH_SITE_VEHICLE_POS = [CRASH_SITE,[20,70], random 360] call SHK_pos;
	publicVariable "CRASH_SITE_VEHICLE_POS";

	// find a spawn pos on given position
	_veh1 = createVehicle ["RHS_AH1Z_GS", [CRASH_SITE_VEHICLE_POS select 0, CRASH_SITE_VEHICLE_POS select 1, .75], [], 0, "CAN_COLLIDE"];
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
	_smoke = [_veh1, "SMOKE_BIG"] execVM "helpers\fireAndSmoke.sqf";
	_smoke2 = [_veh1, "SMOKE_BIG"] execVM "helpers\fireAndSmoke.sqf";

	null = [{[CRASH_SITE] execVM "helpers\createMarkerForSides.sqf";},
	"BIS_fnc_spawn", true, true] spawn BIS_fnc_MP;

};



createRebelsSpawn = {

	REBEL_SPAWN = getMarkerPos "mrk_spawn_opfor_1";
	publicVariable "REBEL_SPAWN";

	[] spawn {
			{
			if ((!isPlayer _x) && side _x == east) then {
				[REBEL_SPAWN, 50, _x] execVM "player\teleportPlayer.sqf";
			};
		} forEach (playableUnits + switchableUnits);
	};
};

createUSSpawn = {

	US_SPAWN = getMarkerPos "mrk_spawn_blufor_1";
	publicVariable "US_SPAWN";

	[] spawn {
		{
			if ((!isPlayer _x) && side _x == west) then {
				[US_SPAWN, 50, _x] execVM "player\teleportPlayer.sqf";
			};
		} forEach (playableUnits + switchableUnits);
	};

};



_CRASH_SITE_listener = {
	_pos = _this select 1;


	publicVariable "CRASH_SITE";
	[] spawn createCrashSite;
	// ["."] call EFUNC(common,displayTextStructured);

	[] spawn createUSSpawn;
	// [".."] call EFUNC(common,displayTextStructured);

	[] spawn createRebelsSpawn;
	// ["..."] call EFUNC(common,displayTextStructured);


	[] spawn {
		{
			if ((!isPlayer _x) && side _x == independent) then {
				[CRASH_SITE, 50, _x] execVM "player\teleportPlayer.sqf";
			};
		} forEach (playableUnits + switchableUnits);
	};
	/*
	_crashSitePos = _this select 0; // Helicopter crashSite Position
	_maxDistance = _this select 1; // if Pilot is < maxDistance from any location, he will be spotted
	_publicVariable = _this select 2; // publicVariable for this Pilot
	*/
};

"CRASH_SITE" addPublicVariableEventHandler _CRASH_SITE_listener;



// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_CRASH_SITE_listener spawn {
		waitUntil {CRASH_SITE select 0 != 0};
		[0, CRASH_SITE] call _this;
	};
};

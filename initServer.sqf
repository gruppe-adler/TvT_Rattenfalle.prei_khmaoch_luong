call compile preprocessfile "node_modules\shk_pos\functions\shk_pos_init.sqf";

// CRASH POSIS
[
	[
	"mrk_crash_site_01",
	"mrk_crash_site_02",
	"mrk_crash_site_03",
	"mrk_crash_site_04",
	"mrk_crash_site_05",
	"mrk_crash_site_06",
	"mrk_crash_site_07"
	]
] call GRAD_mission_helpers_fnc_selectCrashSite;

call grad_pilotTracking_fnc_initServer;
call grad_simpleWaveRespawn_fnc_serverLoop;

[3, "mrk_noFlyZone", 2500, [
		antiAir_01, 
		antiAir_02,
		antiAir_03,
		antiAir_04,
		antiAir_05,
		antiAir_06,
		antiAir_07,
		antiAir_08
], "Air"] call grad_antiAirArea_fnc_create;

// DYN GROUPS
["Initialize"] call BIS_fnc_dynamicGroups;

// catch if pilot disconnects, server should make ai out of unit [true]
// delete dead player units if disconnecting on join
// TODO cant stack this EH?
addMissionEventHandler ["HandleDisconnect",{
    params [["_unit",objNull]];

		if (_unit getVariable ["grad_pilotTracking_isPilot", false]) exitWith {
			true
		};

    if (_unit getVariable ["GRAD_loadout_applicationCount",0] < 1) then {
        deleteVehicle _unit;
    };
    false
}];


// SET FOG AND REDUCE OVER 90 mins
0 setFog [1, 0.1, 5];
forceWeatherChange;

[{
	(90*60) setFog [0.1, 0.1, 5];
}, [], 2] call CBA_fnc_waitAndExecute;


// DMG SOURCE FOR KILLED MSG
if (isMultiplayer) then {
	{
		_x addMPEventHandler ["MPKilled", {
				//Only on the server
				if (isServer) then {
						diag_log format ["%1 killed by %2, ace says %3",
							name (_this select 0),
							name (_this select 1),
							(_this select 0) getVariable ["ACE_medical_lastDamageSource",(_this select 0)]
						];
				};
			}];
	} forEach playableUnits;
};

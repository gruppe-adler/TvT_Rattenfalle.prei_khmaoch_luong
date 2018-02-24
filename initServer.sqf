

// CRASH POSIS
[
	"mrk_crash_site_01",
	"mrk_crash_site_02",
	"mrk_crash_site_03",
	"mrk_crash_site_04",
	"mrk_crash_site_05",
	"mrk_crash_site_06",
	"mrk_crash_site_07"
] call GRAD_mission_helpers_fnc_selectCrashSite;

call grad_pilotTracking_fnc_initServer;
call grad_simpleWaveRespawn_fnc_serverLoop;

// DYN GROUPS
["Initialize"] call BIS_fnc_dynamicGroups;

// catch if pilot disconnects, server should make ai out of unit [true]
// TODO cant stack this EH?
addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

	if (_unit getVariable ["grad_pilotTracking_isPilot", false]) then {
		true
	};
}];


// WEATHER
0 setFog [1, 0.1, 5];
forceWeatherChange;

[{
	(60*60) setFog [0.1, 0.1, 5];
}, 2] call CBA_fnc_waitAndExecute;


CRASH_SITE = [0,0];
publicVariable "CRASH_SITE";

CRASH_SITE_VEHICLE_POS = [0,0];
publicVariable "CRASH_SITE_VEHICLE_POS";

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

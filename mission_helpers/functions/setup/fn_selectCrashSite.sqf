/*
    SERVER ONLY
*/

// SELECT AND PUBLISH CRASH SITE

params ["_possibleCrashPositions"];

private _crashSite = getMarkerPos (selectRandom _possibleCrashPositions);
CRASH_SITE_VEHICLE_POS = [_crashSite] call GRAD_mission_helpers_fnc_createCrashSite;
publicVariable "CRASH_SITE_VEHICLE_POS";
debugLog("server published crash site");


private _spawnOpfor = getMarkerPos "mrk_spawn_opfor_1";
private _spawnBlufor = getMarkerPos "mrk_spawn_blufor_1";

// teleport players and AI
{
  if (_x getVariable ["GRAD_pilotTracking_isPilot", false]) then {
      [_crashSite, 50, _x] remoteExec ["GRAD_mission_helpers_fnc_teleportPlayer", _x, true];
  };

  /*
  if (side _x == east) then {
      [_spawnOpfor, 50, _x] remoteExec ["GRAD_mission_helpers_fnc_teleportPlayer", _x, true];
  };

  if (side _x == west) then {
      [_spawnBlufor, 50, _x] remoteExec ["GRAD_mission_helpers_fnc_teleportPlayer", _x, true];
  };
  */

} forEach (playableUnits + switchableUnits);
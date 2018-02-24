/*
    SERVER ONLY
*/

// SELECT AND PUBLISH CRASH SITE
CRASH_SITE = getMarkerPos (selectRandom possibleCrashPositions);
CRASH_SITE_VEHICLE_POS = [CRASH_SITE] call GRAD_mission_helpers_fnc_createCrashSite;
publicVariable "CRASH_SITE_VEHICLE_POS";
debugLog("server published crash site");

// teleport players and AI
{
  if (side _x == independent) then {
      [CRASH_SITE, 50, _x] remoteExec ["GRAD_mission_helpers_fnc_teleportPlayer", _x, true];
  };

  if (side _x == east) then {
      [SPAWN_OPFOR, 50, _x] remoteExec ["GRAD_mission_helpers_fnc_teleportPlayer", _x, true];
  };

  if (side _x == west) then {
      [SPAWN_BLUFOR, 50, _x] remoteExec ["GRAD_mission_helpers_fnc_teleportPlayer", _x, true];
  };

} forEach (playableUnits + switchableUnits);

/*
	called by server loop
*/

params ["_unit"];

private ["_cooldown", "_connectedCooldown", "_skyBlocked", "_gpsStatusCtrl", "_gpsStatusCode"];

_gpsStatusCode = 0;
_skyBlocked = false;
_onFoot = (isNull objectParent _unit);

// diag_log format ["onfoot %1", _onFoot];

// gps needs 10 secs to recalibrate after lost connection
_cooldown = _unit getVariable ["GRAD_pilotTracking_gpsCooldown", 10];
_connectedCooldown = _unit getVariable ["GRAD_pilotTracking_gpsConnectedCooldown", 0];

// check for gps obstacles and outside of car
if ((count lineIntersectsSurfaces [
        getPosWorld _unit,
        getPosWorld _unit vectorAdd [0, 0, 50],
        _unit, objNull, true, 1, "VIEW", "NONE"
    ] > 0) && (_onFoot) && (_connectedCooldown isEqualTo 0)) then {

	_skyBlocked = true;
	_gpsStatusCode = 0;

	/* hintSilent "GPS lost connection.";*/

	// setting to zero causes error in reception script
	["GRAD_pilotTracking_trackingRange", 0.1] call CBA_fnc_publicVariable;
	_unit setVariable ["GRAD_pilotTracking_gpsCooldown", ceil(5 + random 5)];

  if (random 10 > 9.5) then {
      _unit setVariable ["GRAD_pilotTracking_gpsConnectedCooldown", 10];
  };

} else {

  // if connection is established, let it last at least 10s
  if (_connectedCooldown > 0) then {
      _connectedCooldown = _connectedCooldown - 1;
  };

	if ((_connectedCooldown isEqualTo 0) && _cooldown > 0 && (_onFoot)) then {

		// you are not totally safe under objects, small chance to be visible anyway
		if (random 100 > 10) then {
			_cooldown = _cooldown - 1;
		} else {
			_cooldown = 1;
		};

		_skyBlocked = true;
		_unit setVariable ["GRAD_pilotTracking_gpsCooldown", _cooldown];
		_gpsStatusCode = 1;

		// hintSilent "GPS is recalibrating...";
	} else {
		_skyBlocked = false;
		_gpsStatusCode = 2;

    _unit setVariable ["GRAD_pilotTracking_gpsConnectedCooldown", 10];

		if (_onFoot) then {
			["GRAD_pilotTracking_trackingRange", 500] call CBA_fnc_publicVariable;
		} else {
			["GRAD_pilotTracking_trackingRange", 10000] call CBA_fnc_publicVariable;
		};
	};
};

["GRAD_RATTRAP_GPS_STATUS", _gpsStatusCode] call CBA_fnc_publicVariable;

_gpsStatusCode

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

// check for gps obstacles and outside of car
if ((count lineIntersectsSurfaces [
        getPosWorld _unit,
        getPosWorld _unit vectorAdd [0, 0, 50],
        _unit, objNull, true, 1, "VIEW", "NONE"
    ] > 0) && (_onFoot) && random 10 > 9.5) then {

	_skyBlocked = true;
	_gpsStatusCode = 0;

	/* hintSilent "GPS lost connection.";*/

	// setting to zero causes error in reception script
	["GRAD_pilotTracking_trackingRange", 0.1] call CBA_fnc_publicVariable;
	_unit setVariable ["GRAD_pilotTracking_gpsCooldown", ceil(5 + random 5)];

} else {

 	if (_cooldown > 0 && (_onFoot)) then {
 		_cooldown = _cooldown - 1; 

 		_unit setVariable ["GRAD_pilotTracking_gpsCooldown", _cooldown];
		_skyBlocked = true;
		_gpsStatusCode = 1;

		// hintSilent "GPS is recalibrating...";
	} else {
		_skyBlocked = false;
		_gpsStatusCode = 2;


		if (_onFoot) then {
			["GRAD_pilotTracking_trackingRange", 500] call CBA_fnc_publicVariable;
		} else {
			["GRAD_pilotTracking_trackingRange", 10000] call CBA_fnc_publicVariable;
		};
	};
};

["GRAD_RATTRAP_GPS_STATUS", _gpsStatusCode] call CBA_fnc_publicVariable;

_gpsStatusCode

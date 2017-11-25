params ["_unit", "_gpsStatus"];

private ["_cooldown", "_skyBlocked"];

_skyBlocked = false;
_onFoot = (vehicle _unit == _unit);

// diag_log format ["onfoot %1", _onFoot];

// gps needs 10 secs to recalibrate after lost connection
_cooldown = _unit getVariable ["GRAD_pilotTracking_gpsCooldown", 10];

// check for gps obstacles and outside of car
if ((count lineIntersectsSurfaces [
        getPosWorld _unit, 
        getPosWorld _unit vectorAdd [0, 0, 50], 
        _unit, objNull, true, 1, "VIEW", "NONE"
    ] > 0) && (_onFoot)) then {

	_skyBlocked = true;
	
	disableSerialization;
	_gpsStatus ctrlSetText ("grad_pilotTracking\data\gpsicon_0.paa");
	_gpsStatus ctrlCommit 0;
		
	/* hintSilent "GPS lost connection.";*/

	// setting to zero causes error in reception script
	["GRAD_pilotTracking_trackingRange", 0.1] call CBA_fnc_publicVariable;

	_unit setVariable ["GRAD_pilotTracking_gpsCooldown", ceil(5 + random 5)];
	
} else {
	if (_cooldown > 0 && (_onFoot)) then {

		// you are not totally safe under objects, small chance to be visible anyway
		if (random 100 > 10) then {
			_cooldown = _cooldown - 1;
		} else {
			_cooldown = 1;
		};
		_skyBlocked = true;
		_unit setVariable ["GRAD_pilotTracking_gpsCooldown", _cooldown];

		_gpsStatus ctrlSetText ("grad_pilotTracking\data\gpsicon_1.paa");
		_gpsStatus ctrlCommit 0;
		
		// hintSilent "GPS is recalibrating...";
	} else {
		_skyBlocked = false;

		if (_onFoot) then {
			_gpsStatus ctrlSetText ("grad_pilotTracking\data\gpsicon_2.paa");
			_gpsStatus ctrlCommit 0;
			
			/*hintSilent "GPS sending position.";
			diag_log format ["GPS sending position."];*/
			["GRAD_pilotTracking_trackingRange", 2000] call CBA_fnc_publicVariable;
		} else {
			_gpsStatus ctrlSetText ("grad_pilotTracking\data\gpsicon_2.paa");
			_gpsStatus ctrlCommit 0;
			
			/*hintSilent "GPS sending position from car.";
			diag_log format ["GPS sending position from car."];*/
			["GRAD_pilotTracking_trackingRange", 10000] call CBA_fnc_publicVariable;
		};
	};
};

(!_skyBlocked)
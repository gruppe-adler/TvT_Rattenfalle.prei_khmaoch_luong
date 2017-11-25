params ["_unit", "_gpsStatus"];

private ["_marker", "_clientLoop"];

_marker = call GRAD_pilotTracking_fnc_createPilotMarker;


_unit addMPEventHandler ["MPHit", {
    _unit = _this select 0;
    _source = _this select 3;    
    _damageDone = _unit getVariable ["grad_pilotTracking_pilotIsHit", 0];
    // not self inflicted damage
    if (!(_source isEqualTo _unit)) then {
        switch (_damageDone) do {
            case 0: { 
                        _unit setHitPointDamage  ["hitLegs", 0.5];
                        _unit setVariable ["grad_pilotTracking_pilotIsHit", 1];
                    };
            case 1: { 
                        _unit setHitPointDamage  ["hitHands", 0.5];
                        _unit setVariable ["grad_pilotTracking_pilotIsHit", 2];
                    };
            case 2: { 
                        _unit setHitPointDamage  ["hitBody", 0.5];
                        _unit setVariable ["grad_pilotTracking_pilotIsHit", 3];
                    };
            case 3: { 
                        _unit setHitPointDamage  ["hitHead", 1];
                    };
            default {};
            
        };
    };
}];

GRAD_pilotTracking_progress = 0;

disableSerialization;
"GRAD_rattrap_bloodLevelBar" cutRsc ["GRAD_rattrap_bloodLevelBar", "PLAIN"];
_bar = uiNamespace getVariable ['GRAD_rattrap_bloodLevelBar',controlNull] displayCtrl 2399;

"gui_pilot_gps_0" cutRsc ["gui_pilot_gps_0", "PLAIN"];
_gpsStatus = uiNamespace getVariable ['gui_pilot_gps_0',controlNull] displayCtrl 2396;

_clientLoop = [{
    params ["_args", "_handle"];
    _args params ["_bar", "_marker", "_unit", "_gpsStatus"];


    // DEAD
    if (!alive _unit) then {
        _marker setMarkerPos (getPos _unit);
        [_handle] call CBA_fnc_removePerFrameHandler;
        _unit setVariable ["grad_pilotTracking_markerObj", _marker, true];
    };

    // BROKEN LEG
    if (GRAD_pilotTracking_progress isEqualTo GRAD_pilotTracking_penaltyBrokenLegDelay) then {
    	_unit setHit ["legs", 0.5];
		_unit sideChat format ["broken leg"];
    };

    // MISSION END
    if (GRAD_pilotTracking_progress > GRAD_pilotTracking_missionTime) then {
    	[_handle] call CBA_fnc_removePerFrameHandler;

    	_unit sideChat format ["mission over"];
    	_unit setHit ["head", 1];
    };


    if ([_unit, _gpsStatus] call GRAD_pilotTracking_fnc_gpsCanReceive) then {
        if (vehicle _unit getVariable ["GRAD_pilotTracking_isVehicleMedical", false]) then {
            _marker setMarkerPos (getPos _unit);
        };
    };

    // BLOOD TRAIL
    
	GRAD_pilotTracking_progress = GRAD_pilotTracking_progress + 1;
	if (random 1 > 0.95) then {
		[selectRandom [
			"blooddrop_1", 
			"blooddrop_2",
			"blooddrop_3",
			"blooddrop_4"
		], getPos _unit] call ace_medical_blood_fnc_createBlood;
	};
    

	

    /*
    _unit sideChat format ["GRAD_pilotTracking_progress is %1", GRAD_pilotTracking_progress];
    _unit sideChat format ["missionTime is %1", GRAD_pilotTracking_missionTime];*/

    _var = GRAD_pilotTracking_progress/GRAD_pilotTracking_missionTime;
    [_bar, _var] call GRAD_pilotTracking_fnc_setBloodBar;

    _unit setVariable ["ace_advanced_fatigue_muscleDamage",_var];
    /* _unit sideChat format ["muscle damage is %1", _var]; */

},1,[_bar, _marker, _unit, _gpsStatus]] call CBA_fnc_addPerFrameHandler;
params ["_unit", "_gpsStatus"];

private ["_marker", "_clientLoop"];

_marker = call GRAD_pilotTracking_fnc_createPilotMarker;


[_unit] remoteExec ["grad_pilotTracking_fnc_dropBlood", -2];

_unit addEventhandler ["killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    if (!(isNull objectParent _unit)) then {
        // push out of vehicle
         _cargoIndex = (vehicle _unit) getCargoIndex _unit;
         _grp = createGroup CIVILIAN;
         _invisibleDude = objnull;
         _invisibleDude = _grp createUnit ["C_man_polo_2_F_afro",[0,0,0],[],0,"NONE"];
         hideObjectGlobal _invisibleDude;
         _invisibleDude allowDamage False;
         _invisibleDude setCaptive True;

         _invisibleDude moveInCargo [_veh, _cargoIndex];
         deleteVehicle _invisibleDude;

         // move body to nearest land position
         if (surfaceIsWater position _unit) then {
            _unit setPos [
              position _unit,
              1,
              100,
              0.5,
              0,
              0.5,
              1,
              [],
              []
            ] call BIS_fnc_findSafePos;
         };
    };
}];

/*
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
*/

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
        _unit sideChat format ["Ouch, my leg is broken."];
    };

    // MISSION END
    if (GRAD_pilotTracking_progress > GRAD_pilotTracking_missionTime) then {
    	[_handle] call CBA_fnc_removePerFrameHandler;

    	_unit sideChat format ["I see the light..."];
    	_unit setHit ["head", 1];
    };


    if ([_unit, _gpsStatus] call GRAD_pilotTracking_fnc_gpsCanReceive) then {
        if (vehicle _unit getVariable ["GRAD_pilotTracking_isVehicleMedical", false]) then {
            _marker setMarkerPos (getPos _unit);
        };
    };


    GRAD_pilotTracking_progress = GRAD_pilotTracking_progress + 1;

    _var = GRAD_pilotTracking_progress/GRAD_pilotTracking_missionTime;
    [_bar, _var] call GRAD_pilotTracking_fnc_setBloodBar;

    // _unit setVariable ["ace_advanced_fatigue_muscleDamage",_var];

},1,[_bar, _marker, _unit, _gpsStatus]] call CBA_fnc_addPerFrameHandler;

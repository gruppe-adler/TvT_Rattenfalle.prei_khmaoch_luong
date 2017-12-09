params ["_unit"];

private ["_marker"];

_marker = [_pilot] call GRAD_pilotTracking_fnc_createPilotMarker;
_pilot setVariable ["GRAD_pilotTracking_markerObj", _marker];

_unit setVariable ["GRAD_pilotTracking_isHunter", true]; // only for debug

_unit addEventhandler ["killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    if (!(isNull objectParent _unit)) then {
        // push out of vehicle
        _pX = floor random -5; 
        _pY = floor random -5; 
        _position = vehicle _unit modelToWorld [_pX,_pY,0]; 

        if (alive vehicle _unit) then {
            _unit action ["GetOut", vehicle _unit]; 
            _unit action ["Eject", vehicle _unit];
        };



    

         // move body to nearest land position
         if (surfaceIsWater _position) then {
            _unit setPos ([
              position _unit,
              0,
              40,
              0.25,
              0,
              1,
              1,
              [],
              []
            ] call BIS_fnc_findSafePos);
         } else {
            _unit setpos _position;
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


[{
    params ["_args", "_handle"];
    _args params ["_marker", "_unit"];

    private _currentPosition = getPos _unit;
    private _notInVehicle = isNull objectParent _unit;

    // DEAD
    if (!alive _unit) then {
        [_handle] call CBA_fnc_removePerFrameHandler;
        _marker setMarkerPos _currentPosition;
        diag_log format ["server: pilot died at %1", _currentPosition];
        _unit setVariable ["grad_pilotTracking_markerObj", _marker, true];
    };

    // BROKEN LEG
    if (GRAD_pilotTracking_progress isEqualTo GRAD_pilotTracking_penaltyBrokenLegDelay) then {
        _unit setHit ["legs", 0.5];
        ["Ouch, my leg is broken."] remoteExec ["sideChat", _unit];
    };

    // MISSION END
    if (GRAD_pilotTracking_progress > GRAD_pilotTracking_missionTime) then {
    	[_handle] call CBA_fnc_removePerFrameHandler;

    	_unit setHit ["head", 1];
      ["Its over. I see the light.."] remoteExec ["sideChat", _unit];
    };

    
    if ([_unit] call GRAD_pilotTracking_fnc_gpsCanReceive) then {
        if (!_notInVehicle) then {
            _marker setMarkerPos _currentPosition;
        };
    };
    

    GRAD_pilotTracking_progress = GRAD_pilotTracking_progress + 1;

},1,[_marker, _unit]] call CBA_fnc_addPerFrameHandler;

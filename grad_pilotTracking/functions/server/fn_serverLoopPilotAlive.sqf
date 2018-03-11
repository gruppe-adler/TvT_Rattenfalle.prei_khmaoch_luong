params ["_unit"];

private ["_marker"];

_marker = [_pilot] call GRAD_pilotTracking_fnc_createPilotMarker;
missionNamespace setVariable ["GRAD_pilotTracking_markerObj", _marker, true];

if (!isMultiplayer) then {
    _unit setVariable ["GRAD_pilotTracking_isScout", true]; // only for debug
};

_unit addEventhandler ["killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];

    ["The pilot was killed, check your map."] remoteExec ["hint", 0];

    missionNamespace setVariable ["GRAD_pilotTracking_pilotTrackingObj", _unit, true];
    
    private _marker = missionNamespace getVariable ["GRAD_pilotTracking_markerObj", ""];

    // define position
    _pX = floor random -5;
    _pY = floor random -5;
    _position = vehicle _unit modelToWorld [_pX,_pY,0];

    if (!(_marker isEqualTo "")) then {
        _marker setMarkerPos position _unit;
        _marker setMarkerAlpha 1;
    };

    if (!(isNull objectParent _unit)) then {
        // push out of vehicle
        
        _unit action ["GetOut", vehicle _unit];
        _unit action ["Eject", vehicle _unit];

        _unit setPos _position;
    };

    // move body to nearest land position
    /*
    private _positionUnit = getPosASL _unit;
    private _positionAboveUnit = _positionUnit;
    _positionAboveUnit set [2, 500];
    private _checkArray = lineIntersectsSurfaces [_positionAboveUnit, _positionUnit];
    */

    // move dead body to shore after delay
    [{
        params ["_unit"];
        
        if (!(isAbleToBreathe _unit) || eyePos _unit select 2 < 0) then {
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
        };
    }, [_unit], 5] call CBA_fnc_waitAndExecute;
}];



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
        _marker setMarkerAlpha 1;
        diag_log format ["server: pilot died at %1", _currentPosition];
    };

    // BROKEN LEG
    if (GRAD_pilotTracking_progress isEqualTo GRAD_pilotTracking_penaltyBrokenLegDelay &&
        _unit getVariable ["GRAD_pilotTracking_isBleeding",false]) then {
        _unit setHit ["legs", 0.5];
        ["Ouch, my leg is broken."] remoteExec ["sideChat", _unit];
    };

    // KILL PILOT
    if (GRAD_pilotTracking_progress > GRAD_pilotTracking_missionTime &&
        !(_unit getVariable ["GRAD_rattrap_pilotHealingStarted", false]) &&
        _unit getVariable ["GRAD_pilotTracking_isBleeding",false]) then {

        [_handle] call CBA_fnc_removePerFrameHandler;

    	_unit setHit ["head", 1];
        ["Its over. I see the light.."] remoteExec ["sideChat", _unit];
    };

    // 2 is gps visible
    if (([_unit] call GRAD_pilotTracking_fnc_gpsReceivingSetter) isEqualTo 2) then {
        if (!_notInVehicle) then {
            _marker setMarkerPos _currentPosition;
        };
    };

    if (_notInVehicle) then {

    };

    GRAD_pilotTracking_progress = GRAD_pilotTracking_progress + 1;
    publicVariable "GRAD_pilotTracking_progress";

},1,[_marker, _unit]] call CBA_fnc_addPerFrameHandler;

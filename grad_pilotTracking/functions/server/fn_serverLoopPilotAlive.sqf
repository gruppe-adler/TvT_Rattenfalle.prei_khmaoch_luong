params ["_unit"];

private ["_marker"];

/*
    _marker = [_pilot] call GRAD_pilotTracking_fnc_createPilotMarker;
    missionNamespace setVariable ["GRAD_pilotTracking_markerObj", _marker, true];
*/

if (!isMultiplayer) then {
    _unit setVariable ["GRAD_pilotTracking_isScout", true]; // only for debug
};

_unit addEventhandler ["killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];

    ["The pilot was killed, check your map."] remoteExec ["hint", 0];

    missionNamespace setVariable ["GRAD_pilotTracking_pilotTrackingObj", _unit, true];

    // todo reduce for east probably
    if (side _killer isEqualTo west) then {
          GRAD_pilotCam_RECORDING_DURATION_BLUFOR = GRAD_pilotCam_RECORDING_DURATION_BLUFOR + (60*15);
          [format ["Pilot filming time for Blufor set to %1 due to teamkill.", GRAD_pilotCam_RECORDING_DURATION_BLUFOR]] remoteExec ["hint"];
    };

    if ((side _killer isEqualTo east) + (!(missionNamespace getVariable ["GRAD_pilotCam_camRunning", false]))) then {
          GRAD_pilotCam_RECORDING_DURATION_OPFOR = GRAD_pilotCam_RECORDING_DURATION_OPFOR + (60*5);
          [format ["Pilot filming time for Opfor set to %1 for killing the pilot early.", GRAD_pilotCam_RECORDING_DURATION_OPFOR]] remoteExec ["hint"];
    };

    // define position
    private _pX = floor random -5;
    private _pY = floor random -5;
    private _position = (vehicle _unit) modelToWorld [_pX,_pY,0];


    if (!(isNull objectParent _unit)) then {
        // push out of vehicle

        _unit action ["GetOut", vehicle _unit];
        _unit action ["Eject", vehicle _unit];

        _unit setPos _position;
    };

    // move dead body to shore after delay
    [{
        params ["_unit"];

        private _positionOnShore = ([
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

        if (!(isAbleToBreathe _unit) || eyePos _unit select 2 < 0) then {
            _unit setPos _positionOnShore;
        };

        // todo clean up
        [_unit] call GRAD_pilotTracking_fnc_bodyBagHintAdd;

        // initial bird spawn
        ["Crowe", position _unit, 10, 10, 25, 0] remoteExec ["GRAD_crows_fnc_crowSingleCreate", [0,-2] select isDedicated, true];
        [position _unit, 25, 0] call GRAD_crows_fnc_setCirclePoint;
    }, [_unit], 5] call CBA_fnc_waitAndExecute;
}];



GRAD_pilotTracking_progress = 0;




[{
    params ["_args", "_handle"];
    _args params ["_unit"];

    private _currentPosition = getPos _unit;
    private _notInVehicle = isNull objectParent _unit;

    // DEAD
    if (!alive _unit) then {
        [_handle] call CBA_fnc_removePerFrameHandler;
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
            // _marker setMarkerPos _currentPosition;
        };
    };

    GRAD_pilotTracking_progress = GRAD_pilotTracking_progress + 1;
    publicVariable "GRAD_pilotTracking_progress";

},1,[_unit]] call CBA_fnc_addPerFrameHandler;

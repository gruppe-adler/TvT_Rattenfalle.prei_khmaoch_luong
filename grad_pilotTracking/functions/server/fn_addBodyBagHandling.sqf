// body bag scanner
["ace_placedInBodyBag", {
        diag_log format ["placedInBodyBag eh %1", _this];
        params ["_deadGuy", "_bodyBag"];

        private _dir = getDir _bodyBag;
        private _position = getPos _bodyBag;
        private _isPilot = _deadGuy getVariable ["GRAD_pilotTracking_isPilot", false];
        private _marker = missionNamespace getVariable ["GRAD_pilotTracking_markerObj", objNull];

        deleteVehicle _bodyBag;

        [{
            params ["_position", "_dir", "_isPilot", "_bodyBag", "_marker"];

            _bodyBag = createVehicle ["Land_Bodybag_01_black_F", [0,0,0], [], 0, "NONE"];
            _bodyBag setDir _dir;
            if (surfaceIsWater _position) then {
                _bodybag setPosASL [_position select 0, _position select 1, 3];
            } else {
                _bodybag setPos _position;
            };

            [_bodyBag, 1] call ace_cargo_fnc_setSize;
            [_bodyBag, true, [0, 1.6, 0.26], 0] remoteExec ["ace_dragging_fnc_setDraggable", 0];


            if (_isPilot) then {
            	[_bodyBag, _marker] call GRAD_pilotTracking_fnc_serverLoopPilotDead;
              missionNamespace setVariable ["GRAD_pilotTracking_pilotTrackingObj",_bodyBag, true];
            	missionNamespace setVariable ["GRAD_pilotTracking_bodyBag", _bodyBag, true];
            	[_bodyBag, true] call grad_gpsTracker_fnc_setTarget;
            	diag_log format ["putting someone into bodybag %1, its the pilot.", _bodyBag];
            } else {
            	diag_log format ["putting someone into bodybag %1, its NOT the pilot.", _bodyBag];
        	};

        }, [_position, _dir, _isPilot, _bodyBag, _marker], 0.5] call CBA_fnc_waitAndExecute;

}] call CBA_fnc_addEventHandler;


["ace_cargoLoaded", {
    params ["_item","_vehicle"];


    private _bodybag = missionNamespace getVariable ["GRAD_pilotTracking_bodyBag", objNull];
    diag_log format ["removed %1 cargo from %2", _item, _vehicle, _bodybag];

    if (!isNull _bodybag && _bodybag isEqualTo _item) then {

        diag_log format ["put %1 inside cargo of %2", _item, _vehicle];
        _item setVariable ["GRAD_pilotTracking_isCargoOf", _vehicle, true];
        missionNamespace setVariable ["GRAD_pilotTracking_bodyBagCargoVehicle", _vehicle, true];

    };

}] call CBA_fnc_addEventHandler;

["ace_cargoUnloaded", {
    params ["_item","_vehicle"];

    private _bodybag = missionNamespace getVariable ["GRAD_pilotTracking_bodyBag", objNull];
    diag_log format ["removed %1 cargo from %2", _item, _vehicle, _bodybag];

    if (!isNull _bodybag && _bodybag isEqualTo _item) then {

        diag_log format ["put %1 inside cargo of %2", _item, _vehicle];
        _item setVariable ["GRAD_pilotTracking_isCargoOf", objNull, true];
        missionNamespace setVariable ["GRAD_pilotTracking_bodyBagCargoVehicle", objNull, true];
    };

}] call CBA_fnc_addEventHandler;

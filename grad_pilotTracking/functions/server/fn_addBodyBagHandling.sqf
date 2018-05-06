// body bag scanner
["ace_placedInBodyBag", {
        diag_log format ["placedInBodyBag eh %1", _this];
        params ["_deadGuy", "_bodyBag"];

        private _dir = getDir _bodyBag;
        private _position = getPos _bodyBag;
        private _isPilot = _deadGuy getVariable ["GRAD_pilotTracking_isPilot", false];
        // private _marker = missionNamespace getVariable ["GRAD_pilotTracking_markerObj", objNull];

        // [_deadGuy] remoteExec ["GRAD_pilotTracking_fnc_bodyBagHintRemove", [0,-2] select isDedicated];
        deleteVehicle _bodyBag;
      
        _bodyBag = createVehicle ["Land_Bodybag_01_black_F", [0,0,0], [], 0, "NONE"];
        _bodyBag setDir _dir;
        if (surfaceIsWater _position) then {
            diag_log format ["position for bodybag on water, searching shore"];
            private _positionOnShore = ([
                  position _bodyBag,
                  0,
                  40,
                  0.25,
                  0,
                  1,
                  1,
                  [],
                  []
                ] call BIS_fnc_findSafePos);
                _bodybag setPos _positionOnShore;
        } else {
            diag_log format ["position for bodybag on land, setting pos"];
            _bodybag setPos _position;
        };

        [_bodyBag, 1] call ace_cargo_fnc_setSize;
        [_bodyBag, true, [0, 1.6, 0.26], 0] remoteExec ["ace_dragging_fnc_setDraggable", 0];


        if (_isPilot) then {
            // start loop to track bodybag status from now on
            [_bodyBag] call GRAD_pilotTracking_fnc_serverLoopPilotDead;
            // set tracking object needed for identifying pilot in front of cams (former pilot itself)
            missionNamespace setVariable ["GRAD_pilotTracking_pilotTrackingObj",_bodyBag, true];
            // give bodybag unique identifier
            missionNamespace setVariable ["GRAD_pilotTracking_bodyBag", _bodyBag, true];
            // set target for gps tracker to bodybag
            [_bodyBag, true] call grad_gpsTracker_fnc_setTarget;
            // add hints to bodybag position like flies
            [_bodyBag] remoteExec ["GRAD_pilotTracking_fnc_bodyBagHintAdd", [0,-2] select isDedicated];
            diag_log format ["putting someone into bodybag %1, its the pilot.", _bodyBag];
        } else {
        	diag_log format ["putting someone into bodybag %1, its NOT the pilot.", _bodyBag];
    	};

}] call CBA_fnc_addEventHandler;


["ace_cargoLoaded", {
    params ["_item","_vehicle"];


    private _bodybag = missionNamespace getVariable ["GRAD_pilotTracking_bodyBag", objNull];
    diag_log format ["removed %1 cargo from %2", _item, _vehicle, _bodybag];

    if (!isNull _bodybag && _bodybag isEqualTo _item) then {

        diag_log format ["put %1 inside cargo of %2", _item, _vehicle];
        _item setVariable ["GRAD_pilotTracking_isCargoOf", _vehicle, true];
        missionNamespace setVariable ["GRAD_pilotTracking_bodyBagCargoVehicle", _vehicle, true];

        [_bodybag] remoteExec ["GRAD_pilotTracking_fnc_bodyBagHintRemove", [0,-2] select isDedicated];

        [[worldSize/2,worldSize/2,400], 100, 0] call GRAD_crows_fnc_setCirclePoint; // move bird on position of bodybag
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

        [_bodybag] remoteExec ["GRAD_pilotTracking_fnc_bodyBagHintAdd", [0,-2] select isDedicated];

        [position _bodybag, 25, 0] call GRAD_crows_fnc_setCirclePoint; // move bird on position of bodybag
    };

}] call CBA_fnc_addEventHandler;

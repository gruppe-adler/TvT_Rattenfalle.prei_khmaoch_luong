// body bag scanner
["ace_placedInBodyBag", {
        diag_log format ["placedInBodyBag eh %1", _this];
        params ["_deadGuy", "_bodyBag"];

        private _dir = getDir _deadGuy;
        private _position = position _bodyBag;
        deleteVehicle _bodyBag;
        _bodyBag = createVehicle ["Land_Bodybag_01_black_F", _position, [], 0, "CAN_COLLIDE"];
        _bodyBag setDir _dir;

        [_bodyBag, 1] call ace_cargo_fnc_setSize;
        [_bodyBag, true, [0, 1.6, 0.26], 0] call ace_dragging_fnc_setDraggable;

        /* private _name = [_deadGuy] call ace_common_fnc_getName; */
        private _isPilot = _deadGuy getVariable ["GRAD_pilotTracking_isPilot", false];
        private _marker = _deadGuy getVariable ["GRAD_pilotTracking_markerObj", objNull];

        if (_isPilot) then {
        	[_bodyBag, _marker] call GRAD_pilotTracking_fnc_serverLoopPilotDead;
            missionNamespace setVariable ["GRAD_pilotTracking_pilotTrackingObj",_bodyBag];
        	missionNamespace setVariable ["GRAD_pilotTracking_bodyBag", _bodyBag, true];
        	[_bodyBag, true] call grad_gpsTracker_fnc_setTarget;
        	diag_log format ["putting %1 into bodybag %2, its the pilot.", _deadGuy, _bodyBag];
        } else {
        	diag_log format ["putting %1 into bodybag %2, its NOT the pilot.", _deadGuy, _bodyBag];
    	};
}] call CBA_fnc_addEventHandler;
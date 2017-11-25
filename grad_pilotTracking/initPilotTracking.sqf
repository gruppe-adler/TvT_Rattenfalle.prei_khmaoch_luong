if (hasInterface) then {
	if (!(player getVariable ["GRAD_pilotTracking_isPilot", false])) exitWith {};

	GRAD_pilotTracking_missionTime = 300; // seconds
	GRAD_pilotTracking_penaltyBrokenLegDelay = 299; // seconds

	// initial delay
	sleep 5;

	[player] call grad_pilotTracking_fnc_clientLoop;
};


if (isServer) then {

	GRAD_pilotTracking_trackingRange = 2000;
	publicVariable "GRAD_pilotTracking_trackingRange";
	
	// for local test purposes
	/*
	if (!isMultiplayer) then {
		{
			if (side player != independent && _x getVariable ["GRAD_pilotTracking_isPilot", false]) then {
				[_x] call grad_pilotTracking_fnc_clientLoop;
				
			};
		} forEach allUnits;
	};
	*/
	/* _marker = [_x] call GRAD_pilotTracking_fnc_createPilotMarker;*/
	/* _x setVariable ["GRAD_pilotTracking_markerObj", _marker];*/

	// body bag scanner
	["ace_placedInBodyBag", {
	        diag_log format ["placedInBodyBag eh %1", _this];
	        params ["_deadGuy", "_bodyBag"];

	        /* private _name = [_deadGuy] call ace_common_fnc_getName; */
	        private _isPilot = _deadGuy getVariable ["GRAD_pilotTracking_isPilot", false];
	        /* private _marker = _deadGuy getVariable ["GRAD_pilotTracking_markerObj", objNull];*/

	        if (_isPilot) then {
	        	/* [_bodyBag, _marker] call GRAD_pilotTracking_fnc_serverLoop; */
	        	missionNamespace setVariable ["GRAD_pilotTracking_bodyBag", _bodyBag, true];
	        	[_bodyBag, true] call grad_gpsTracker_fnc_setTarget;
	        	diag_log format ["putting %1 into bodybag %2, its the pilot.", _deadGuy, _bodyBag];
	        } else {
	        	diag_log format ["putting %1 into bodybag %2, its NOT the pilot.", _deadGuy, _bodyBag];
	    	};
	}] call CBA_fnc_addEventHandler;
};
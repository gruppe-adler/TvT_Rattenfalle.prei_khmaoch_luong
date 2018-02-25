params ["_unit"];

// even on pilot himself
[{
    params ["_args", "_handle"];
    _args params ["_unit"];

    private _notInVehicle = isNull objectParent _unit;

	if (_notInVehicle && !GRAD_WOUND_FORCE_CLOSE) then {
		[_unit] call GRAD_pilotTracking_fnc_dropBlood;
	};

},1,[_unit]] call CBA_fnc_addPerFrameHandler;

params ["_unit", "_gpsStatus"];

disableSerialization;
"GRAD_rattrap_bloodLevelBar" cutRsc ["GRAD_rattrap_bloodLevelBar", "PLAIN"];
_bar = uiNamespace getVariable ['GRAD_rattrap_bloodLevelBar',controlNull] displayCtrl 2399;

"gui_pilot_gps_0" cutRsc ["gui_pilot_gps_0", "PLAIN"];
_gpsStatus = uiNamespace getVariable ['gui_pilot_gps_0',controlNull] displayCtrl 2396;


[{
    params ["_args", "_handle"];
    _args params ["_bar", "_unit", "_gpsStatus"];

    private _notInVehicle = isNull objectParent _unit;

    if (!(_unit getVariable ["GRAD_rattrap_pilotHealingStarted", false])) then {
	    _var = GRAD_pilotTracking_progress/GRAD_pilotTracking_missionTime;
	    [_bar, _var] call GRAD_pilotTracking_fnc_setBloodBar;
	};

	if (!(_unit getVariable ["GRAD_pilotTracking_isBleeding", false])) then {
		[_handle] call CBA_fnc_removePerFrameHandler;
		"GRAD_rattrap_bloodLevelBar" cutRsc ["Default", "PLAIN"];
	};

	[_unit] call GRAD_pilotTracking_fnc_gpsSetReceivingIndicator;

},1,[_bar, _unit, _gpsStatus]] call CBA_fnc_addPerFrameHandler;


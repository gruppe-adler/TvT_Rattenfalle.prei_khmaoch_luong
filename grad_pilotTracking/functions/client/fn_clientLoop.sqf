params ["_unit", "_gpsStatus"];

disableSerialization;
"GRAD_rattrap_bloodLevelBar" cutRsc ["GRAD_rattrap_bloodLevelBar", "PLAIN"];
_bar = uiNamespace getVariable ['GRAD_rattrap_bloodLevelBar',controlNull] displayCtrl 2399;

"gui_pilot_gps_0" cutRsc ["gui_pilot_gps_0", "PLAIN"];
_gpsStatus = uiNamespace getVariable ['gui_pilot_gps_0',controlNull] displayCtrl 2396;

[{
    params ["_args", "_handle"];
    _args params ["_bar", "_unit", "_gpsStatus"];

    GRAD_pilotTracking_progress = GRAD_pilotTracking_progress + 1;

    _var = GRAD_pilotTracking_progress/GRAD_pilotTracking_missionTime;
    [_bar, _var] call GRAD_pilotTracking_fnc_setBloodBar;

    // _unit setVariable ["ace_advanced_fatigue_muscleDamage",_var];

},1,[_bar, _unit, _gpsStatus]] call CBA_fnc_addPerFrameHandler;
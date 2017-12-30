if (!isNull (uiNamespace getVariable ["RscTitleDisplayEmpty",displayNull])) then {
	call grad_gpsTracker_fnc_closeTitle; call grad_pilotTracking_fnc_openGPS;
};
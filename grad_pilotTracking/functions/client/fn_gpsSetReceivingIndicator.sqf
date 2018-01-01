params ["_unit"];

private _gpsStatus = uiNamespace getVariable ['gui_pilot_gps_0',controlNull] displayCtrl 2396;

switch (GRAD_RATTRAP_GPS_STATUS) do {
	case 0: {
		disableSerialization;
		_gpsStatus ctrlSetText ("grad_pilotTracking\data\gpsicon_0.paa");
		_gpsStatus ctrlCommit 0;
	};
	case 1: {
		disableSerialization;
		_gpsStatus ctrlSetText ("grad_pilotTracking\data\gpsicon_1.paa");
		_gpsStatus ctrlCommit 0;
	};
	case 2: {
		disableSerialization;
		_gpsStatus ctrlSetText ("grad_pilotTracking\data\gpsicon_2.paa");
		_gpsStatus ctrlCommit 0;
	};
	default {};
};
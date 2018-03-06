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
		private _animationState = missionNamespace getVariable ["grad_pilotTracking_gpsIconAnimationState", 1];

		private _path = "grad_pilotTracking\data\gpsicon_1_" + str _animationState + ".paa";
		_gpsStatus ctrlSetText _path;
		_gpsStatus ctrlCommit 0;

		if (_animationState < 3) then {
			missionNamespace setVariable ["grad_pilotTracking_gpsIconAnimationState", _animationState + 1];
		} else {
			missionNamespace setVariable ["grad_pilotTracking_gpsIconAnimationState", 1];
		};
	};
	case 2: {
		disableSerialization;
		_gpsStatus ctrlSetText ("grad_pilotTracking\data\gpsicon_2.paa");
		_gpsStatus ctrlCommit 0;
	};
	default {};
};
// TODO make pilot accessible here

private _pilot = missionNamespace getVariable ["GRAD_pilotTracking_pilotTrackingObj_vehicle",objNull];

if (isNull (missionNamespace getVariable ["GRAD_pilotTracking_pilotTrackingObj_vehicle", objNull])) then {


		[_pilot,0, 1, 1, 1, {

		params ["_unit","_target","_updateInterval"];
		private _reception = 0;
		_reception

	}] call grad_gpsTracker_fnc_openTitle;


} else {


	[_pilot,0, 1, 1, 1, {

		params ["_unit","_target","_updateInterval"];
		private _reception = 1 - (_unit distance2D _target)/GRAD_pilotTracking_trackingRange;
		_reception

	}] call grad_gpsTracker_fnc_openTitle;


};
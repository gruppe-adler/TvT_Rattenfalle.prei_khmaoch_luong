call grad_pilotTracking_fnc_initServer;
call grad_simpleWaveRespawn_fnc_serverLoop;

["Initialize"] call BIS_fnc_dynamicGroups;

// catch if pilot disconnects, server should make ai out of unit [true]
["rattrap_handlePilotDisconnect", "HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

	if (_unit getVariable ["grad_pilotTracking_isPilot", false]) then {
		true
	};
}] call BIS_fnc_addStackedEventHandler;

/*

// description.ext parameters
_timeOfDay = "TimeOfDay" call BIS_fnc_getParamValue;

setCustomWeather = {
	skipTime -24;
	0 setOvercast 0;
	0 setRain 0;
	forceWeatherChange;
	skipTime 24;
};

// set to full moon date
setDate [2015, 2, 1, _timeOfDay, 1]; // set to 5:00 for perfect full moon


[] call setCustomWeather;*/
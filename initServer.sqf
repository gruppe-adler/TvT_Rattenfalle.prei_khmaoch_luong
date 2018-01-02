call grad_pilotTracking_fnc_initServer;
call grad_simpleWaveRespawn_fnc_serverLoop;

["Initialize"] call BIS_fnc_dynamicGroups;


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
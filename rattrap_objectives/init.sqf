TRIGGER_ACTIVATION_TIME = 120;

// add trigger here
_trigger_rescued = selectRandom [
	trg_pilots_rescued
];

_trigger_captured_list = [
	trg_pilots_captured_1,
	trg_pilots_captured_2,
	trg_pilots_captured_3
];

// take 1 trigger, delete rest of stuff
_trigger_captured = selectRandom _trigger_captured_list;
_trigger_captured_list = _trigger_captured_list - [_trigger_captured];

{	
	_a = _x;
	{
		deleteVehicle _x
	} forEach list _a;
} forEach _trigger_captured_list;

[west, _trigger_rescued] remoteExec ["rattrap_objectives_fnc_createMarker", 0, true];
[east, _trigger_captured] remoteExec ["rattrap_objectives_fnc_createMarker", 0, true];

[_trigger_rescued, _trigger_captured] call rattrap_objectives_fnc_serverLoop;
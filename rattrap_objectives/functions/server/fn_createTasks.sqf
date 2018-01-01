params ["_tasks"];

{
	diag_log format ["%1", _x];

	_x params ["_side", "_taskName", "_taskDescription", "_taskTitle", "_areaMarkerName", "_icon"];

	[
		_side,
		_taskName,
		[
			_taskDescription,
			_taskTitle,
			_areaMarkerName
		],
		[_areaMarkerName select 0, _areaMarkerName select 1],
		"AUTOASSIGNED",
		2,
		true,
		_icon
	] call BIS_fnc_taskCreate;

} forEach _tasks;
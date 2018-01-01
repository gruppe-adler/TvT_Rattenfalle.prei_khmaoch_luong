params ["_tasks"];

{
	diag_log format ["%1", _x];

	_x params ["_side", "_taskName", "_taskDescription", "_taskTitle", "_areaMarkerName", "_areaMarkerName2", "_icon"];

	[
		_side,
		_taskName,
		[
			_taskDescription,
			_taskTitle,
			_areaMarkerName
		],
		[_areaMarkerName, _areaMarkerName2],
		"AUTOASSIGNED",
		2,
		true,
		_icon
	] call BIS_fnc_taskCreate;

} forEach _tasks;
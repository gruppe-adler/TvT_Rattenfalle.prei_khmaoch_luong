// _x params ["_side", "_taskName", "_taskDescription", "_taskTitle", "_areaMarkerName", "_icon"];

// blufor tasks
[
	[[	
		west, 
		"tsk_blufor_filmpilot",
		localize "str_rattrap_task_blufor_filmpilot_description",
		localize "str_rattrap_task_blufor_filmpilot_title",
		"mrk_endpoint_blufor",
		"kill"
	]]
] call rattrap_objectives_fnc_createTasks;

// opfor tasks
[
	[[	
		east, 
		"tsk_opfor_filmpilot",
		localize "str_rattrap_task_opfor_filmpilot_description",
		localize "str_rattrap_task_opfor_filmpilot_title",
		"mrk_endpoint_opfor",
		"kill"
	]]
] call rattrap_objectives_fnc_createTasks;
params ["_side"];

switch (_side) do {

	case west: {
		["tsk_blufor_filmpilot", "Succeeded",false] spawn BIS_fnc_taskSetState;
		["tsk_opfor_filmpilot", "Failed",false] spawn BIS_fnc_taskSetState;
		diag_log format ["rattrap_objectives: blufor wins by filming."];
	};
	case east: {
		["tsk_blufor_filmpilot", "Failed",false] spawn BIS_fnc_taskSetState;
		["tsk_opfor_filmpilot", "Succeeded",false] spawn BIS_fnc_taskSetState;
		diag_log format ["rattrap_objectives: opfor wins by filming."];
	};
	default {
		["tsk_blufor_filmpilot", "Failed",false] spawn BIS_fnc_taskSetState;
		["tsk_opfor_filmpilot", "Failed",false] spawn BIS_fnc_taskSetState;
		diag_log format ["rattrap_objectives: fatal error, end called but winner is neither east nor west"];
	};
};

// stops record, sends data and starts replay
call GRAD_replay_fnc_stopRecord;

// ends mission after replay is over
[{
	REPLAY_FINISHED
}, {
		params ["_side"];

		switch (_side) do {

			case west: {
				"BluforWinsByFilming" call BIS_fnc_endMissionServer;
			};
			case east: {
				"OpforWinsByFilming" call BIS_fnc_endMissionServer;
			};
			default {
				"EveryoneLost" call BIS_fnc_endMissionServer;
			};
		};

}, [_side]] call CBA_fnc_waitUntilAndExecute;

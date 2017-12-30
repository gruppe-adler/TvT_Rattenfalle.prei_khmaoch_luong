params ["_side"];

switch (_side) do {
	
	case west: { 
		"BluforWinsByFilming" call BIS_fnc_endMissionServer;
		diag_log format ["rattrap_objectives: blufor wins by filming."];
	};
	case east: { 
		"OpforWinsByFilming" call BIS_fnc_endMissionServer; 
		diag_log format ["rattrap_objectives: opfor wins by filming."];
	};
	default { 
		"EveryoneLost" call BIS_fnc_endMissionServer; 
		diag_log format ["rattrap_objectives: fatal error, end called but winner is neither east nor west"]; 
	};

};

params ["_veh"];



_veh addAction ["<t color='#66aa66'>Searchlight On", 
	"[(_this select 0), (_this select 1), true] remoteExec ['grad_mission_helpers_fnc_toggleHeliLight', (_this select 0)];",
	"", 1, false, false, "", 
	"_this in _target && _target turretLocal [0] && !(isLightOn _target)"
];

_veh addAction ["<t color='#66aa66'>Searchlight Off", 
	"[(_this select 0), (_this select 1), false] remoteExec ['grad_mission_helpers_fnc_toggleHeliLight', (_this select 0)];",
	"", 1, false, false, "", 
	"_this in _target && _target turretLocal [0] && (isLightOn _target)"
];
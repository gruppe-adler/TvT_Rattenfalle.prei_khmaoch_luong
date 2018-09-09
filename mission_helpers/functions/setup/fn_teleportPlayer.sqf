/*

	CLIENT AND / OR SERVER

	teleports players and AI to initial spawn

*/


#include "\z\ace\addons\main\script_component.hpp"
// takes location, distance

params ["_location", "_distance", "_unit"];

_spawn = _location findEmptyPosition[2, 20, "B_Soldier_F"];
diag_log format ["teleporting %1 to %2.", _unit, _location];

_nul = _unit setPos _spawn;
// make _unit vulnerable again
_unit allowDamage true;
// 3 call fn_sthud_usermenu_changeMode;

if (_unit getVariable ["GRAD_pilotTracking_isPilot", false]) then {
	_unit setDir (_unit getRelDir CRASH_SITE_VEHICLE_POS);
};

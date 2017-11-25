#include "\z\ace\addons\main\script_component.hpp"
// takes location, distance

_location = _this select 0;
_distance = _this select 1;
_unit = _this select 2;

//if (isMultiplayer) then { 
["."] call EFUNC(common,displayTextStructured);
sleep (random 1);
[""] call EFUNC(common,displayTextStructured);
sleep (random 1);
["."] call EFUNC(common,displayTextStructured);
sleep (random 1);
[""] call EFUNC(common,displayTextStructured);
sleep (random 1);
["."] call EFUNC(common,displayTextStructured);
sleep (random 1);
[""] call EFUNC(common,displayTextStructured);
sleep (random 1);
// }; // balance teleport load in MP



_spawn = _location findEmptyPosition[2, 20, "B_Soldier_F"];
diag_log format ["teleporting %1 to %2.", _unit, _location];

_nul = _unit setPos _spawn;
["."] call EFUNC(common,displayTextStructured);

[""] call EFUNC(common,displayTextStructured);
// make _unit vulnerable again
_unit allowDamage true;
// 3 call fn_sthud_usermenu_changeMode;

GRAD_player_teleported = true;

if (side player == independent) then {
	player setDir (player getRelDir CRASH_SITE_VEHICLE_POS);
};
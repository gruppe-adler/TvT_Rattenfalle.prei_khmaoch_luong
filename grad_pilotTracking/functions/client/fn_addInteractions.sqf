_readBlood = ["ACE_MainActions", "Sniff on Blood", "", {
	[_player, _target] call GRAD_pilotTracking_fnc_readBlood;
},
{true}] call ace_interact_menu_fnc_createAction;



/*
 _readBlood = ["ACE_MainActions", (localize "str_GRAD_flag_raise"), "",
 {0 = [(_this select 0), true] execVM "spawn\flagsOnVehicles.sqf";},
  {(side player == east) && isNull ((_this select 0) getVariable ["GRAD_flagObject",objNull])}
 ] call ace_interact_menu_fnc_createAction;

["BloodTrail_01_New_F", 0, ["ACE_MainActions"], _readBlood] call ace_interact_menu_fnc_addActionToClass;
*/

// _player getVariable ["GRAD_pilotTracking_isHunter", false]




diag_log format ["adding interactions %1"];


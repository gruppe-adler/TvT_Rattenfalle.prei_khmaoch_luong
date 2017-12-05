_readBlood = ["readBlood", "Sniff on Blood", "", {
	[_player, _target] call GRAD_pilotTracking_fnc_readBlood;
},
{_player getVariable ["GRAD_pilotTracking_isHunter", false]}] call ace_interact_menu_fnc_createAction;

["BloodTrail_01_New_F", 0, ["ACE_MainActions"], _readBlood, true] call ace_interact_menu_fnc_addActionToClass;
["BloodSpray_01_New_F", 0, ["ACE_MainActions"], _readBlood, true] call ace_interact_menu_fnc_addActionToClass;
["BloodSplatter_01_Small_New_F", 0, ["ACE_MainActions"], _readBlood, true] call ace_interact_menu_fnc_addActionToClass;
["BloodSplatter_01_Medium_New_F", 0, ["ACE_MainActions"], _readBlood, true] call ace_interact_menu_fnc_addActionToClass;

["BloodTrail_01_Old_F", 0, ["ACE_MainActions"], _readBlood, true] call ace_interact_menu_fnc_addActionToClass;
["BloodSpray_01_Old_F", 0, ["ACE_MainActions"], _readBlood, true] call ace_interact_menu_fnc_addActionToClass;
["BloodSplatter_01_Small_Old_F", 0, ["ACE_MainActions"], _readBlood, true] call ace_interact_menu_fnc_addActionToClass;
["BloodSplatter_01_Medium_Old_F", 0, ["ACE_MainActions"], _readBlood, true] call ace_interact_menu_fnc_addActionToClass;

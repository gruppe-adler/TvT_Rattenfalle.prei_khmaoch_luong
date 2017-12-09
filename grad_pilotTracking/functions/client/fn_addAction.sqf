params ["_object"];
/*
_mainAction = ["ACE_MainActions", (localize "STR_ACE_Interaction_MainAction"), "",{

}, {true}] call ace_interact_menu_fnc_createAction;


_readBlood = ["GRAD_interpretTrace", "Interpret Trace", "", {
	[_player, _target] call GRAD_pilotTracking_fnc_readBlood;
},
{true}] call ace_interact_menu_fnc_createAction;

hint "adding action";

[_object, 0, [], _mainAction] call ace_interact_menu_fnc_addActionToObject;
[_object, 0, [], _readBlood] call ace_interact_menu_fnc_addActionToObject;


_mainAction = ["ACE_MainActions", (localize "STR_ACE_Interaction_MainAction"), "", {
	
}, {true}] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _mainAction] call ace_interact_menu_fnc_addActionToObject;


//create action with position and distance
_actionTakeGrenade = ["action_take_grenade","Granate aufnehmen","", {
	hint "todo: disarm"
}, {true}, {},[],[0.1,0,1],1] call ace_interact_menu_fnc_createAction;

//append action to a object
[_object, 0, ["ACE_MainActions"], _actionTakeGrenade] call ace_interact_menu_fnc_addActionToObject;

*/
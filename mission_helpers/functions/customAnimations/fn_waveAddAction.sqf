GRAD_ANIMATION_WAVE = false;

_waveAction =
[
	'Wave both arms','Wave both arms','',
	{[] spawn GRAD_mission_helpers_fnc_doWave;},
	{!GRAD_ANIMATION_WAVE}
] call ace_interact_menu_fnc_createAction;
[
	player,
	1,
	["ACE_SelfActions"],
	_waveAction
] call ace_interact_menu_fnc_addActionToObject;

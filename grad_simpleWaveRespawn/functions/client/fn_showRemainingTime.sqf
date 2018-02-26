/*
    shows time to respawn in seconds
*/
#include "\z\ace\addons\main\script_component.hpp"

[{
    params ["_args", "_handle"];

    if (alive player) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    private _timeLeft = format ["%1 s",
    	floor (GRAD_SIMPLEWAVERESPAWN_ENDTIME - CBA_missionTime)
    ];
    [_timeLeft] call EFUNC(common,displayTextStructured);

    /*
    diag_log format ["
    	CBA_missionTime %1,
    	GRAD_SIMPLEWAVERESPAWN_DURATION %2,
    	GRAD_SIMPLEWAVERESPAWN_STARTTIME %3,
    	_timeLeft %4",
    	CBA_missionTime,
    	GRAD_SIMPLEWAVERESPAWN_DURATION,
    	GRAD_SIMPLEWAVERESPAWN_STARTTIME,
    	_timeLeft
    ];*/
    //hintsilent format ["Time to respawn: %1", floor (GRAD_SIMPLEWAVERESPAWN_DURATION - _timeLeft)];

},1,[]] call CBA_fnc_addPerFrameHandler;

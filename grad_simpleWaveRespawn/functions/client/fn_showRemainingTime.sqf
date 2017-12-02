// TODO : calculate and show next respawn timestamp
// hintsilent format ["%1", GRAD_SIMPLEWAVERESPAWN_DURATION];

[{
    params ["_args", "_handle"];

    if (alive player) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    private _timeLeft = CBA_missionTime - (GRAD_SIMPLEWAVERESPAWN_DURATION % GRAD_SIMPLEWAVERESPAWN_STARTTIME);
    hintsilent format ["Time to respawn: %1", GRAD_SIMPLEWAVERESPAWN_DURATION - _timeLeft];
    
},1,[]] call CBA_fnc_addPerFrameHandler;
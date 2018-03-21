_this spawn {
    params [["_preparationTime",300]];

    while {_preparationTime > -1} do {
        [_preparationTime] remoteExec ["BC_objectives_fnc_preparationTimeCountdown",0,false];
        _preparationTime = _preparationTime - 1;
        sleep 1;
    };
};

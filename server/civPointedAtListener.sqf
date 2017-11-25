/*

GRAD_civInterrogationAnimations = [
    "AidlPercSnonWnonDnon_talk1"
];

GRAD_fnc_stopCiv = {
    _civ = _this select 0;

    _vehicle = vehicle _civ;
    _hasVehicle = _vehicle isKindOf 'LandVehicle';


    // todo GRAD_civ_carOwnerOf is always null even when it shouldnt be
    if (_hasVehicle) then {
        _civ setVariable ["GRAD_civ_carOwnerOf", _vehicle];
    };

    // dont pile this function up, only accept one offical stopper
    if ((count (_civ getVariable ["GRAD_isPointedAtBy",[]])) > 1) exitWith {};
    
    doStop _civ;

    hintsilent format ["doStop civ executed"];

    waitUntil { sleep 1; speed _civ < 1 };

    if (_hasVehicle) then {
        _civ leaveVehicle _vehicle;
        hintsilent format ["leavevehicle executed"];
    };
    
    waitUntil {sleep 1; (isNull (objectParent _civ))};

    sleep 0.5;

    hintsilent format ["%1 = %2", vehicle _civ, _civ];

    _civ switchmove (selectRandom GRAD_civInterrogationAnimations);
    sleep 0.1;
    _civ disableAI "MOVE";
    _civ disableAI "FSM";
    _civ disableAI "CHECKVISIBLE";
    _civ disableAI "ANIM";
    diag_log format ["disabling AI"];

    waitUntil { sleep 1; ((count (_civ getVariable ["GRAD_isPointedAtBy",[]])) < 1) };
    
     _civ switchMove "";
    diag_log format ["reenabling AI"];
    _civ enableAI "MOVE";
    _civ enableAI "FSM";
    _civ enableAI "CHECKVISIBLE";
    _civ enableai "ANIM";

    _car = _civ getVariable ["GRAD_civ_carOwnerOf", objNull];

    if (!isNull _car) then {
        _civ assignAsDriver _car;
        [_civ] orderGetIn true;
    };

    _civ doFollow _civ;
};

*/
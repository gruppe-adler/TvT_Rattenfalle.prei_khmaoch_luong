params ["_bodybag"];

private _handle = _bodybag getVariable ["GRAD_flies_handle", -1];

if (_handle >= 0) then {
    [_handle] call CBA_fnc_removePerFrameHandler;
};

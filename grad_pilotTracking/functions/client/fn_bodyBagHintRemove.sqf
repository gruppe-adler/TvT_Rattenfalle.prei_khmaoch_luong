params ["_bodybag"];

private _handle = _bodybag getVariable ["GRAD_flies_handle", -1];
private _chemlight = _bodybag getVariable ["GRAD_chemlight_handle", objNull];

if (_handle >= 0) then {
    [_handle] call CBA_fnc_removePerFrameHandler;
};

if (!isNull _chemlight) then {
    detach _chemlight;
    deleteVehicle _chemlight;
};

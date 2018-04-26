params ["_bodybag"];

private _handle = ([_bodybag] call GRAD_flies_fnc_flies) select 1;
_bodybag setVariable ["GRAD_flies_handle", _handle];

private _chemlight = "Chemlight_Yellow" createVehicleLocal (position _bodybag);
_chemlight attachTo [_bodybag,[0,0,0.2]];
_bodyBag setVariable ["GRAD_chemlight_handle", _chemlight];
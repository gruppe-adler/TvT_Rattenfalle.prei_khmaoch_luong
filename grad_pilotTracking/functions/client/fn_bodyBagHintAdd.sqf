params ["_bodybag"];

_handle = [_bodybag] call GRAD_flies_fnc_flies;
_bodybag setVariable ["GRAD_flies_handle", _handle];

// todo with finished function
[position _bodybag, 25, 0] call GRAD_crows_fnc_setCirclePoint;

private _chemlight = "Chemlight_yellow" createVehicleLocal (position _bodybag);
_chemlight attachTo [_bodybag,[0,0,0]];
_bodyBag setVariable ["GRAD_chemlight_handle", _chemlight];

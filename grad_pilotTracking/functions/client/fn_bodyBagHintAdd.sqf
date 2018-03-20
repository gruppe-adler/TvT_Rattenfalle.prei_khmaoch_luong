params ["_bodybag"];

_handle = [_bodybag] call GRAD_flies_fnc_flies;
_bodybag setVariable ["GRAD_flies_handle", _handle];

// todo with finished function
[position player, 50, 0] call GRAD_crows_fnc_setCirclePoint;
["Eagle_F", position player, 1, 10, 5, 0] call GRAD_crows_fnc_crowCreateSingle;

params ["_side", "_trigger"];

if (side player != _side) exitWith {};

_pos = getPos _trigger;
_name = str _side + "_objective_marker";

_marker = createMarker [_name, _pos];
_marker setMarkerType "hd_end";

if (_side isEqualTo west) then {
	_marker setMarkerColor "ColorWEST";
} else {
	_marker setMarkerColor "ColorEAST";
};
params ["_unit", "_targets"];

private _return = objNull;

{ 
	if (_unit distance (_x select 0) < 2) exitWith {
		_return = (_x select 1);
	};
} forEach _targets;

_return
params ["_heli", "_caller", "_state"];

private _unit = _caller;

if (!isServer) then {
	_unit = player;
};

if (_state) then {
	_unit action ['LightOn', _heli];
} else {
	_unit action ['LightOff', _heli];
};